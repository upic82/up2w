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
use Filament\Support\RawJs;
//use App\Filament\Resources\DkmjResource\Pages\Dkmj;
use Illuminate\Support\Str;
use Filament\Resources\Resource;
use Illuminate\Support\Facades\DB;
use Filament\Forms\Components\Grid;
use Filament\Forms\Components\View;
use Illuminate\Support\Facades\Log;
use Filament\Forms\Components\Hidden;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Section;
use Filament\Tables\Columns\TextColumn;
use Illuminate\Database\Eloquent\Model;
use Filament\Forms\Components\TextInput;
use Filament\Notifications\Notification;
use Illuminate\Database\Eloquent\Builder;
use Filament\Forms\Components\Placeholder;
use Filament\Forms\Components\TextInput\Mask;
use App\Filament\Resources\SpblResource\Pages;
use Illuminate\Validation\ValidationException;
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
                                    ? $record->nilai_penugasan ?? $record->dkmj->nilai_penugasan ?? $record->dkmj->penugasan->nilai_penugasan
                                    : (\App\Models\Dkmj::find(request()->no_dkmj)?->nilai_penugasan 
                                        ?? \App\Models\Dkmj::find(request()->no_dkmj)?->penugasan?->nilai_penugasan)
                            ),
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
                        Forms\Components\TextInput::make('nama_spbl')
                            ->label('Nama SPBL')
                            ->required(),   
                        Forms\Components\Select::make('no_vendor')
                            ->label('Vendor')
                            ->relationship('vendor', 'nama_vendor')
                            ->searchable()
                            ->required(),
                            
                        
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
                            ])
                            
                            ->columnSpan('full')
                            ->live()
                            ->reactive()
                            ->afterStateUpdated(function (callable $set, $state) {
                                // Hitung total semua item
                                $total = collect($state)->sum(function ($item) {
                                    return ((float) ($item['qty'] ?? 0)) * ((float) ($item['harga'] ?? 0));
                                });

                                $set('nilai_spbl', $total);
                                
                                $set('nilai_ppn',$total * 0.11);
                                
                                $set('grand_total',$total * 1.11);
                            }),
                            //->reactive() // Penting untuk update realtime
                            /*TextInput::make('nilai_spbl')
                                ->label('Total Keseluruhan')
                                ->prefix('Rp.')
                                ->viewonly
                                ->reactive()
                                ->formatStateUsing(fn ($state) => $state ? number_format($state, 0, ',', '.') : '0'),
                            TextInput::make('nilai_ppn')
                                ->label('PPN')
                                ->prefix('Rp.')
                                ->disabled(),    // Saat simpan, hilangkan simbol,
                            TextInput::make('grand_total')
                                ->label('Grand Total')
                                ->prefix('Rp.')
                                ->disabled()
                                ->numeric()*/
                            

                            /*Placeholder::make('nilai_spbl_in')
                                ->label('Nilai SPBL')
                                ->content(fn ($get) => 'Rp ' . number_format((float) $get('nilai_spbl'), 0, ',', '.')),
                            Placeholder::make('nilai_ppn_in')
                                ->label('PPN 11%')
                                ->content(fn ($get) => 'Rp ' . number_format((float) $get('nilai_ppn'), 0, ',', '.')),
                            Placeholder::make('grand_total')
                                ->label('Grand Total')
                                ->content(fn ($get) => 'Rp ' . number_format((float) $get('grand_total'), 0, ',', '.')),
                            */
                            
                        ]),
                        
                        TextInput::make('nilai_spbl')
                            ->numeric()
                            ->readOnly()
                            ,
                            
                        TextInput::make('nilai_ppn')
                            ->numeric()
                            ->readOnly()
                            ,
                        TextInput::make('grand_total')
                            ->label('Grand Total')
                            ->disabled()
                            //isi grand total waktu load edit
                            ->afterStateHydrated(function (\Filament\Forms\Set $set, $state, $get) {
                                // Ambil nilai dari dua field
                                $nilaiSpbl = (float) $get('nilai_spbl') ?? 0;
                                $nilaiPpn = (float) $get('nilai_ppn') ?? 0;

                                $grandTotal = $nilaiSpbl + $nilaiPpn;

                                // Format angka
                                $formatted = number_format($grandTotal, 0, ',', '.');

                                // Set state grand_total
                                $set('grand_total', $formatted);
                                 $set('nilai_spbl', number_format($nilaiSpbl, 0, ',', '.'));
                                  $set('nilai_ppn', number_format($nilaiPpn, 0, ',', '.'));
                            })
                            ->afterStateUpdated(function ($state, \Filament\Forms\Set $set) {
                                $formatted = number_format((float) str_replace(['.', ','], '', $state), 0, ',', '.');
                                $set('grand_total', $formatted);
                            })
                            ->hidden()
                            ->numeric(),
                        /*
                        Grid::make(1)
                            ->columns(['auto', '1fr', 'auto', '1fr', 'auto', '1fr']) // untuk 3 kolom label+isi
                            ->schema([
                                Grid::make(2)
                                    ->schema([
                                        Placeholder::make('')
                                            ->content('Nilai SPBL')
                                            ->extraAttributes(['class' => 'text-left font-semibold']),
                                        Placeholder::make('nilai_spbl_placeholder')
                                            ->label('')
                                            ->content(fn ($get) => number_format((int) str_replace(['.', ','], '', $get('nilai_spbl')), 0, ',', '.'))
                                            ->reactive()
                                            ->extraAttributes(['class' => 'text-left font-semibold']),
                                    ]),
                                Grid::make(2)
                                    ->schema([
                                        Placeholder::make('')
                                            ->content('PPN')
                                            ->extraAttributes(['class' => 'text-left font-semibold']),
                                        Placeholder::make('nilai_ppn_placeholder')
                                            ->label('')
                                            ->content(fn ($get) => number_format((int) str_replace(['.', ','], '', $get('nilai_ppn')), 0, ',', '.'))
                                            ->reactive()
                                            ->extraAttributes(['class' => 'text-left font-semibold']),
                                    ]),
                                Grid::make(2)
                                    ->schema([
                                        Placeholder::make('')
                                            ->content('Grand Total')
                                            ->extraAttributes(['class' => 'text-left font-semibold']),
                                        Placeholder::make('grand_total_placeholder')
                                            ->label('')
                                            ->content(fn ($get) => number_format((int) str_replace(['.', ','], '', $get('grand_total')), 0, ',', '.'))
                                            ->reactive()
                                            ->extraAttributes(['class' => 'text-left font-semibold']),
                                    ]),
                                
                            ]),
                        */
                        
                        Placeholder::make('sisa_saldo_penugasan')
                            ->label('Saldo Penugasan Tersisa')
                            ->content(function ($record, $state, $get) {
                                $noDkmj = $get('no_dkmj');

                                if (!$noDkmj) return '-';

                                $dkmj = \App\Models\Dkmj::find($noDkmj);
                                if (!$dkmj || !$dkmj->workOrder || !$dkmj->workOrder->penugasan) return '-';

                                $penugasan = $dkmj->workOrder->penugasan;

                                // Hitung total SPBL sebelumnya
                                $totalSpbl = 0;
                                foreach ($dkmj->workOrder->dkmj as $dk) {
                                    $totalSpbl += $dk->spbls()->sum(DB::raw('nilai_spbl + nilai_ppn'));
                                }

                                $saldo = $penugasan->nilai_penugasan - $totalSpbl;

                                return 'Rp ' . number_format($saldo, 0, ',', '.');
                            })
                            ->extraAttributes(['class' => 'text-right text-red-600 font-semibold'])
                    ]);
        }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('no_spbl')
                    ->searchable(),
                TextColumn::make('nama_spbl')
                    ->searchable(),
                TextColumn::make('dkmj.penugasan.nama_penugasan')
                    ->searchable(),
                TextColumn::make('total')
                    ->label('Nilai')
                    ->getStateUsing(function ($record) {
                        return ($record->nilai_spbl ?? 0) + ($record->nilai_ppn ?? 0);
                    })
                    ->formatStateUsing(fn ($state) => number_format($state, 0, ',', '.'))
                    ->alignEnd()
                    ->sortable(),
                TextColumn::make('no_dkmj')
                    ->label('No DKMJ')
                    ->alignCenter()
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\Action::make('view_spbl')
                        ->label('Print')
                        ->tooltip('Cetak SPBL')
                        ->icon('heroicon-o-printer')
                        ->url(fn ($record) => route('spbl.print', $record))
                        ->openUrlInNewTab(),
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
/*
    protected function mutateFormDataBeforeCreate(array $data): array
    {
        // Auto-set created_by
        //$data['created_by'] = auth()->id();
        
        // Hitung total dari detail jika ada
        if (isset($data['details'])) {
            $total = collect($data['details'])->sum(function ($item) {
                return $item['qty'] * $item['harga'];
            });
            $data['nilai_spbl'] = $total;
        }
        
        return $data;
    }
*/
    

}
