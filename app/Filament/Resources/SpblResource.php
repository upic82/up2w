<?php

namespace App\Filament\Resources;

use id;
use Filament\Forms;
use App\Models\Dkmj;
use App\Models\Spbl;
use Filament\Tables;
use Filament\Forms\Get;
use Filament\Forms\Set;
use App\Models\Material;
use Filament\Forms\Form;
use App\Models\DkmjDetail;
use Filament\Tables\Table;
use Illuminate\Support\Str;
use Filament\Resources\Resource;
//use App\Filament\Resources\DkmjResource\Pages\Dkmj;
use Illuminate\Support\Facades\Log;
use Filament\Forms\Components\Hidden;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Section;
use Illuminate\Database\Eloquent\Model;
use Filament\Forms\Components\TextInput;
use Illuminate\Database\Eloquent\Builder;
use App\Filament\Resources\SpblResource\Pages;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Icetalker\FilamentTableRepeater\Forms\Components\TableRepeater;


class SpblResource extends Resource
{
    protected static ?string $model = Spbl::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Section::make('Informasi DKMJ')
                    ->schema([
                        Forms\Components\TextInput::make('no_dkmj')
                            ->label('No. DKMJ')
                            ->disabled()
                            ->dehydrated()
                            ->required()
                            ->default(fn ($operation) => $operation === 'create' ? request()->no_dkmj : null),
                            
                        Forms\Components\TextInput::make('no_wbs')
                            ->label('No. WBS')
                            ->disabled()
                            ->default(function ($operation) {
                                // Debug 1: Cek parameter yang diterima
                                logger()->debug('Create SPBL Debug', [
                                    'operation' => $operation,
                                    'no_dkmj' => request()->no_dkmj,
                                    'exists' => request()->no_dkmj ? \App\Models\Dkmj::where('id', request()->no_dkmj)->exists() : false
                                ]);

                                if ($operation === 'create' && request()->no_dkmj) {
                                    // Debug 2: Cek query dan hasilnya
                                    $dkmj = \App\Models\Dkmj::with('penugasan')->find(request()->no_dkmj);
                                    logger()->debug('DKMJ Data', [
                                        'full_data' => $dkmj,
                                        'no_wbs' => $dkmj?->no_wbs,
                                        'penugasan_no_wbs' => $dkmj?->penugasan?->no_wbs
                                    ]);

                                    // Coba semua kemungkinan field
                                    return $dkmj?->no_wbs 
                                        ?? $dkmj?->nomor_wbs 
                                        ?? $dkmj?->penugasan?->no_wbs;
                                }
                                return null;
                            })
                             ->required(),
                            
                        Forms\Components\TextInput::make('nama_penugasan')
                            ->label('Nama Penugasan')
                            ->disabled()
                            ->dehydrated()
                            ->default(function () {
                                if (request()->no_dkmj) {
                                    return Dkmj::find(request()->no_dkmj)?->penugasan?->nama_penugasan;
                                }
                                return null;
                            }),
                    ])
                    ->columns(3),
                    
                Forms\Components\Section::make('Informasi SPBL')
                    ->schema([
                        TextInput::make('no_spbl')
                            ->label('No. SPBL')
                            ->required()
                            ->default('SPBL-' . date('Ymd') . '-' . Str::random(4))
                            ->dehydrated() // WAJIB ada untuk memastikan nilai terkirim
                            ->unique(table: Spbl::class, column: 'no_spbl', ignoreRecord: true),
                            
                        Forms\Components\DatePicker::make('tanggal_spbl')
                            ->label('Tanggal SPBL')
                            ->default(now())
                            ->required(),
                            
                        Forms\Components\Select::make('no_vendor')
                            ->label('Vendor')
                            ->relationship('vendor', 'nama_vendor')
                            ->searchable()
                            ->required(),
                            
                        Forms\Components\TextInput::make('nilai_spbl')
                            ->label('Nilai SPBL (Rp)')
                            ->numeric()
                            ->disabled(),
                            
                        Forms\Components\TextInput::make('nilai_ppn')
                            ->label('PPN (Rp)')
                            ->disabled()
                            ->numeric(),
                    ])
                    ->columns(2),
                

                Section::make('Item SPBL')
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
                                    ->label('Qty')
                                    ->numeric()
                                    ->required(),
                                    
                                TextInput::make('satuan')
                                    ->label('Satuan')
                                    ->disabled()
                                    ->dehydrated(),
                                    
                                TextInput::make('harga')
                                    ->label('Harga')
                                    ->numeric()
                                    ->prefix('Rp')
                                    ->required()
                            ])
                            
                            ->columnSpan('full')
                        ]),
                                Forms\Components\Section::make('Persyaratan')
                                    ->schema([
                                        Forms\Components\Textarea::make('persyaratan_pengadaan')
                                            ->label('Persyaratan Pengadaan')
                                            ->columnSpanFull(),
                                    ]),
                            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                //
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
            
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListSpbls::route('/'),
            'create' => Pages\CreateSpbl::route('/create'),
            'edit' => Pages\EditSpbl::route('/{record}/edit'),
        ];
    }

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        // Auto-set created_by
        $data['created_by'] = auth()->id();
        
        // Hitung total dari detail jika ada
        if (isset($data['details'])) {
            $total = collect($data['details'])->sum(function ($item) {
                return $item['qty'] * $item['harga'];
            });
            $data['nilai_spbl'] = $total;
        }
        
        return $data;
    }
    
    
       
    
}
