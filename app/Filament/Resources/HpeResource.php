<?php

namespace App\Filament\Resources;

use App\Models\Hpe;
use Filament\Forms;
use App\Models\Dkmj;
use Filament\Tables;
use Filament\Forms\Get;
use Filament\Forms\Set;
use App\Models\Material;
use Filament\Forms\Form;
use Filament\Tables\Table;
use Illuminate\Support\Str;
use Filament\Resources\Resource;
use Filament\Forms\Components\Hidden;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Section;
use Filament\Tables\Columns\TextColumn;
use Filament\Forms\Components\TextInput;
use Illuminate\Database\Eloquent\Builder;
use Filament\Forms\Components\Placeholder;
use App\Filament\Resources\HpeResource\Pages;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use App\Filament\Resources\HpeResource\RelationManagers;
use Icetalker\FilamentTableRepeater\Forms\Components\TableRepeater;

class HpeResource extends Resource
{
    protected static ?string $model = Hpe::class;

    protected static ?string $navigationLabel = 'HPE / RAB';
    protected static ?string $navigationGroup = '3. Pengadaan';
    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Section::make('Informasi DKMJ')
                    ->schema([
                        Hidden::make('no_dkmj')
                            ->dehydrated()
                            ->required()
                            ->default(fn ($operation) => $operation === 'create' ? request()->no_dkmj : null)

                            ->afterStateUpdated(function ($state, Set $set) {
                                $dkmj = Dkmj::with('penugasan')->find($state);
                                $set('no_wbs', $dkmj?->no_wbs ?? $dkmj?->penugasan?->no_wbs ?? '');
                            }),
                        Placeholder::make('dkmj')
                            ->label('No DKMJ')
                            //->content(fn ($record) => $record?->dkmj->penugasan->no_wbs ?? '-')
                            ->content(fn ($operation, $record) => 
                                $operation === 'edit' 
                                    ? $record->no_wbs ?? $record->dkmj->no_dkmj ?? $record->dkmj->no_dkmj
                                    : (\App\Models\Dkmj::find(request()->no_dkmj)?->no_dkmj 
                                        ?? \App\Models\Dkmj::find(request()->no_dkmj)?->no_dkmj)
                            ),
                        Placeholder::make('wbs')
                            ->label('WBS langsung')
                            //->content(fn ($record) => $record?->dkmj->penugasan->no_wbs ?? '-')
                            ->content(fn ($operation, $record) => 
                                $operation === 'edit' 
                                    ? $record->no_wbs ?? $record->dkmj->no_wbs ?? $record->dkmj->penugasan->no_wbs
                                    : (\App\Models\Dkmj::find(request()->no_dkmj)?->no_wbs 
                                        ?? \App\Models\Dkmj::find(request()->no_dkmj)?->penugasan?->no_wbs)
                            ),
                        Placeholder::make('nama_penugasan')
                            ->label('Nama Penugasan')
                            ->content(fn ($operation, $record) => 
                                $operation === 'edit' 
                                    ? $record->nama_penugasan ?? $record->dkmj->nama_penugasan ?? $record->dkmj->penugasan->nama_penugasan
                                    : (\App\Models\Dkmj::find(request()->no_dkmj)?->nama_penugasan 
                                        ?? \App\Models\Dkmj::find(request()->no_dkmj)?->penugasan?->nama_penugasan)
                            ),
                        Placeholder::make('nilai_penugasan')
                            ->label('Nilai Penugasan')
                            ->content(fn ($operation, $record) => 
                                $operation === 'edit' 
                                    ? number_format($record->nilai_penugasan ?? $record->dkmj->nilai_penugasan ?? $record->dkmj->penugasan->nilai_penugasan, 0, ',', '.')
                                    : number_format(\App\Models\Dkmj::find(request()->no_dkmj)?->nilai_penugasan 
                                        ?? \App\Models\Dkmj::find(request()->no_dkmj)?->penugasan?->nilai_penugasan, 0, ',', '.')
                            ),
                    ])
                    ->columns(3),
                
                    Forms\Components\Section::make('Informasi HPE')
                    ->schema([
                        TextInput::make('no_hpe')
                            ->label('No. HPE')
                            ->required()
                            ->default('HPE-' . date('Ymd') . '-' . Str::random(4))
                            ->dehydrated() // WAJIB ada untuk memastikan nilai terkirim
                            ->unique(table: Hpe::class, column: 'no_hpe', ignoreRecord: true),
                            
                        Select::make('jenis')
                            ->label('Jenis Dokumen')
                            ->options([
                                'HPE' => 'HPE',
                                'RAB' => 'RAB',
                            ])
                            ->required(),

                        Forms\Components\DatePicker::make('tanggal_hpe')
                            ->label('Tanggal HPE')
                            ->default(now())
                            ->required(),
                        Forms\Components\TextInput::make('nama_hpe')
                            ->label('Nama HPE')
                            ->required(),
                    ])
                    ->columns(2),

                    Section::make('Item HPE')
                    ->schema([
                        TableRepeater::make('details')
                            ->relationship('details')
                            ->schema([
                                
                                Select::make('no_material')
                                    ->label('Pilih Material/Jasa')
                                    ->options(function (Get $get) {
                                        // Ambil ID DKMJ yang dipilih dari form state
                                        $dkmjId = $get('../../no_dkmj'); // Sesuaikan dengan struktur form Anda
                                        
                                        if (!$dkmjId) {
                                            return [];
                                        }

                                        // Ambil material yang hanya ada di DKMJ terpilih
                                        return Material::whereHas('dkmjDetails', function($query) use ($dkmjId) {
                                                $query->where('no_dkmj', $dkmjId);
                                            })
                                            ->pluck('nama_material', 'id');
                                    })
                                    ->required()
                                    ->searchable()
                                    ->live()
                                    ->afterStateUpdated(function ($state, Set $set) {
                                        if (!$state) return;
                                        
                                        $material = Material::find($state);
                                        $set('satuan', $material->satuan ?? '');
                                        $set('harga_satuan', $material->harga_satuan ?? 0);
                                    }),
                                    
                                TextInput::make('qty')
                                    ->numeric()
                                    ->reactive()
                                    ->live()
                                    ->required()
                                    ->afterStateUpdated(function ($state, callable $set, callable $get) {
                                        $qty = (float) $get('qty');
                                        $harga = (float) $get('harga');
                                        $set('subtotal', $qty * $harga);
                                    }),
                                TextInput::make('satuan')
                                    ->label('Satuan')
                                    ->disabled()
                                    ->dehydrated(),
                                    
                                TextInput::make('harga')
                                    ->label('Harga')
                                    ->numeric()
                                    ->prefix('Rp')
                                    ->required()
                                    ->live()
                                    ->reactive()
                                    ->afterStateUpdated(function ($state, callable $set, callable $get) {
                                        $qty = (float) $get('qty');
                                        $harga = (float) $get('harga');
                                        $set('subtotal', $qty * $harga);
                                    }),
                                    
                                TextInput::make('subtotal')
                                    ->numeric()
                                    ->disabled()
                                    ->dehydrated(false)
                                    ->default(0)
                                    ->afterStateHydrated(function (TextInput $component, $state, $record, $set, $get) {
                                        $qty = (float) $get('qty');
                                        $harga = (float) $get('harga');
                                        $set('subtotal', $qty * $harga);
                                    })
                                    ->live()
                                    ->reactive()
                                    ->afterStateUpdated(function ($state, callable $set, callable $get) {
                                        $qty = (float) $get('qty');
                                        $harga = (float) $get('harga');
                                        $set('subtotal', $qty * $harga);
                                    })
                                ])//----akhir details
                            ->columnSpan('full')
                            ->live()
                            ->reactive()
                            ->afterStateUpdated(function (callable $set, $state) {
                                // Hitung total semua item
                                $total = collect($state)->sum(function ($item) {
                                    return ((float) ($item['qty'] ?? 0)) * ((float) ($item['harga'] ?? 0));
                                });

                                $set('nilai_hpe', $total);
                                
                                $set('nilai_ppn',$total * 0.11);
                                
                                $set('grand_total',$total * 1.11);
                            }),
                        TextInput::make('nilai_hpe')
                            ->numeric()
                            ->readOnly()
                            ,
                            
                        TextInput::make('nilai_ppn')
                            ->numeric()
                            ->readOnly()
                            ,
                        TextInput::make('grand_total')
                            ->label('Grand Total')
                            ->readonly()
                            ->numeric(),
                    
                        ])                
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('no_hpe')
                    ->searchable()
                    ->tooltip(fn ($record) => $record->dkmj?->penugasan?->nama_penugasan ?? '-'),
                
                TextColumn::make('nama_hpe')
                    ->label('Nama HPE')
                    ->tooltip(fn ($record) => $record->dkmj?->penugasan?->nama_penugasan ?? '-')
                    ->searchable(),
                TextColumn::make('jenis')
                    ->badge()
                    ->color(fn (string $state): string => match ($state) {
                        'HPE' => 'warning',
                        'RAB' => 'success',
                       
                    }),
                TextColumn::make('grand_total')
                    ->label('Nilai')
                    
                    ->formatStateUsing(fn ($state) => number_format($state, 0, ',', '.'))
                    ->alignEnd()
                    ->sortable()
                    ->tooltip(fn ($record) => $record->dkmj?->penugasan?->nama_penugasan ?? '-'),
                TextColumn::make('dkmj.no_dkmj')
                    ->tooltip(fn ($record) => $record->dkmj?->penugasan?->nama_penugasan ?? '-')
                    ->searchable(),

            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListHpes::route('/'),
            'create' => Pages\CreateHpe::route('/create'),
            'edit' => Pages\EditHpe::route('/{record}/edit'),
        ];
    }
}
