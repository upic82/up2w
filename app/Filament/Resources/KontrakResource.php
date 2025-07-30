<?php

namespace App\Filament\Resources;

use App\Models\Kontrak;
use App\Models\Hpe;
use App\Models\Material;
use Filament\Forms;
use Filament\Forms\Get;
use Filament\Forms\Set;
use Filament\Tables;
use Filament\Forms\Form;
use Filament\Tables\Table;
use Filament\Resources\Resource;
use Filament\Forms\Components\Hidden;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Section;
use Filament\Tables\Columns\TextColumn;
use Filament\Forms\Components\TextInput;
use Illuminate\Database\Eloquent\Builder;
use Filament\Forms\Components\Placeholder;
use App\Filament\Resources\KontrakResource\Pages;
use Icetalker\FilamentTableRepeater\Forms\Components\TableRepeater;

class KontrakResource extends Resource
{
    protected static ?string $model = Kontrak::class;

    protected static ?string $navigationLabel = 'Kontrak';
    protected static ?string $navigationGroup = '3. Pengadaan';
    protected static ?string $navigationIcon = 'heroicon-o-document-text';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                // Section Informasi HPE
                Forms\Components\Section::make('Informasi HPE')
                    ->schema([
                        // Tampilkan sebagai placeholder saat edit
                Forms\Components\Placeholder::make('no_hpe_display')
                    ->content(function ($record) {
                        // Jika ada record dan relasi hpe terload
                        if ($record && $record->hpe) {
                            return $record->hpe->no_hpe;
                        }
                        
                        // Jika relasi belum terload, load secara manual
                        if ($record && $record->no_hpe) {
                            $hpe = \App\Models\Hpe::find($record->no_hpe);
                            return $hpe ? $hpe->no_hpe : '-';
                        }
                        
                        return '-';
                    })
                    ->visible(fn (string $operation) => $operation === 'edit'),
                    
                    // Tampilkan select hanya saat create
                    Forms\Components\Select::make('no_hpe')
                        ->relationship(
                            name: 'hpe',
                            titleAttribute: 'no_hpe',
                            modifyQueryUsing: fn (Builder $query) => $query->belumTerpakai()
                        )
                        ->required()
                        ->live()
                        ->afterStateUpdated(function ($state, Set $set) {
                            $hpe = Hpe::find($state);
                            //dd($hpe);
                            $set('nilai_hpe', $hpe?->grand_total ?? 0);
                            $set('judul_kontrak', $hpe?->nama_hpe ?? '');
                            
                        })
                        ->searchable()
                        ->preload()
                        ->visible(fn (string $operation) => $operation === 'create'),
            
                        Forms\Components\Hidden::make('no_hpe')
                            ->visible(fn (string $operation) => $operation === 'edit'),                        
                        TextInput::make('nilai_hpe')->readOnly(),
                    ])
                    ->columns(3),
                
                // Section Informasi Kontrak
                Forms\Components\Section::make('Informasi Kontrak')
                    ->schema([
                        TextInput::make('no_kontrak')
                            ->label('No. Kontrak')
                            ->required()
                            ->disabled(fn (Get $get) => empty($get('no_hpe')))
                            ->unique(ignoreRecord: true),
                            
                        TextInput::make('judul_kontrak')
                            ->label('Judul Kontrak')
                            ->disabled(fn (Get $get) => empty($get('no_hpe')))
                            ->required(),
                            
                        Forms\Components\DatePicker::make('tgl_kontrak_awal')
                            ->label('Tanggal Mulai')
                            ->disabled(fn (Get $get) => empty($get('no_hpe')))
                            ->required(),
                            
                        Forms\Components\DatePicker::make('tgl_kontrak_akhir')
                            ->label('Tanggal Berakhir')
                            ->disabled(fn (Get $get) => empty($get('no_hpe')))
                            ->required(),
                            
                        Select::make('id_vendor')
                            ->relationship('vendor', 'nama_vendor')
                            ->searchable()
                            ->preload()
                            ->disabled(fn (Get $get) => empty($get('no_hpe')))
                            ->required(),
                            
                        Select::make('status_kontrak')
                            ->options([
                                'draft' => 'Draft',
                                'aktif' => 'Aktif',
                                'selesai' => 'Selesai',
                                'terminasi' => 'Terminasi',
                            ])
                            ->disabled(fn (Get $get) => empty($get('no_hpe')))
                            ->required(),
                        // Di KontrakResource.php
                        Select::make('jenis_kontrak')
                            ->options([
                                'barang' => 'Barang',
                                'jasa' => 'Jasa',
                                'konsultansi' => 'Konsultansi',
                            ])
                            ->default('barang') // Tambahkan ini
                            ->required()
                            ->disabled(fn (Get $get) => empty($get('no_hpe')))
                            ->label('Jenis Kontrak'),
                    ])
                    ->columns(3),
                
                // Section Nilai Kontrak
                Forms\Components\Section::make('Nilai Kontrak')
                    ->schema([
                        TextInput::make('nilai_kontrak')
                            ->numeric()
                            ->required()
                            ->live()
                            ->prefix('Rp')
                            ->readOnly()
                            //->disabled(fn (Get $get) => empty($get('no_hpe')))
                            ->afterStateUpdated(function ($state, Set $set) {
                                $ppn = $state * 0.11;
                                $set('nilai_ppn', $ppn);
                                $set('grand_total', $state + $ppn);
                            })
                            ->afterStateHydrated(function ($component, $state, $record) {
                                // Set nilai saat load edit
                                if ($record) {
                                    $component->state($record->nilai_kontrak);
                                }
                            }),
                            
                        TextInput::make('nilai_ppn')
                            ->numeric()
                            ->readOnly()
                            ->prefix('Rp')
                            //->disabled(fn (Get $get) => empty($get('no_hpe')))
                            ->afterStateHydrated(function ($component, $state, $record) {
                                if ($record) {
                                    $component->state($record->nilai_ppn);
                                }
                            }),
                            
                        TextInput::make('grand_total')
                            ->label('Grand Total')
                            ->numeric()
                            ->readOnly()
                            ->prefix('Rp')
                            //->disabled(fn (Get $get) => empty($get('no_hpe')))
                            ->afterStateHydrated(function ($component, $state, $record) {
                                if ($record) {
                                    $component->state($record->nilai_kontrak + $record->nilai_ppn);
                                }
                            }),
                    ])
                    ->columns(3),
                
                // Section Item Kontrak (Detail)
                Section::make('Item Kontrak')
                    ->schema([
                        TableRepeater::make('details')
                            ->relationship('detail')
                            ->schema([
                                Select::make('no_material')
                                    ->label('Material/Jasa')
                                    ->options(function (Get $get) {
                                        $hpeId = $get('../../no_hpe');
                                        if (!$hpeId) return [];
                                        
                                        return Material::whereHas('hpeDetails', function($query) use ($hpeId) {
                                            $query->where('hpe_detail.no_hpe', $hpeId);
                                        })
                                        ->pluck('nama_material', 'id');
                                    })
                                    ->required()
                                    ->searchable()
                                    ->live()
                                    ->disabled(fn (Get $get) => empty($get('../../no_hpe')))
                                    ->afterStateUpdated(function ($state, Set $set) {
                                        $material = Material::find($state);
                                        $set('satuan', $material?->satuan ?? '');
                                        $set('harga', $material?->harga_satuan ?? 0);
                                    }),
                                    
                                TextInput::make('qty')
                                    ->numeric()
                                    ->required()
                                    ->live()
                                    ->disabled(fn (Get $get) => empty($get('../../no_hpe')))
                                    ->afterStateUpdated(function ($state, Set $set, Get $get) {
                                        $set('subtotal', $state * $get('harga'));
                                        static::updateGrandTotal($set, $get);
                                    }),
                                    
                                TextInput::make('satuan')
                                    ->disabled()
                                    ->dehydrated(),
                                    
                                TextInput::make('harga')
                                    ->numeric()
                                    ->prefix('Rp')
                                    ->required()
                                    ->live()
                                    ->disabled(fn (Get $get) => empty($get('../../no_hpe')))
                                    ->afterStateUpdated(function ($state, Set $set, Get $get) {
                                        $set('subtotal', $get('qty') * $state);
                                        static::updateGrandTotal($set, $get);
                                    }),
                                    
                                TextInput::make('subtotal')
                                    ->numeric()
                                    ->disabled()
                                    ->dehydrated(false)
                                    ->prefix('Rp')
                                    ->default(0)
                                    ->afterStateHydrated(function ($component, $state, $record) {
                                        // Hitung subtotal saat pertama kali load
                                        if ($record) {
                                            $component->state($record->qty * $record->harga);
                                        }
                                    }),
                            ])
                            ->columnSpan('full')
                            ->live()
                            ->afterStateUpdated(function (Set $set, $state) {
                                $total = collect($state)->sum('subtotal');
                                $set('nilai_kontrak', $total);
                                $set('nilai_ppn', $total * 0.11);
                                $set('grand_total', $total * 1.11);
                            })
                            ->afterStateHydrated(function (Set $set, $state) {
                                // Hitung grand total saat pertama kali load
                                $total = collect($state)->sum(function($item) {
                                    return ($item['qty'] ?? 0) * ($item['harga'] ?? 0);
                                });
                                $set('nilai_kontrak', $total);
                                $set('nilai_ppn', $total * 0.11);
                                $set('grand_total', $total * 1.11);
                            }),
                    ]),
                
                // Dokumen Referensi
                Forms\Components\Section::make('Dokumen Referensi')
                    ->schema([
                        TextInput::make('no_gl')->disabled(fn (Get $get) => empty($get('no_hpe'))),
                        TextInput::make('no_pr')->disabled(fn (Get $get) => empty($get('no_hpe'))),
                        TextInput::make('no_po')->disabled(fn (Get $get) => empty($get('no_hpe'))),
                        TextInput::make('no_nota_dinas')->disabled(fn (Get $get) => empty($get('no_hpe'))),
                        Hidden::make('created_by')
                            ->default(auth()->id())
                            ->required(),
                            
                        Hidden::make('updated_by')
                            ->default(auth()->id())
                            ->required(),
                                ])
                                ->columns(2),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('no_kontrak')
                    ->searchable(),
                    
                TextColumn::make('judul_kontrak')
                    ->searchable(),
                    
                TextColumn::make('hpe.no_hpe')
                    ->searchable(),
                    
                TextColumn::make('vendor.nama_vendor')
                    ->searchable(),
                    
                TextColumn::make('grand_total')
                    ->label('Grand Total')
                    ->getStateUsing(fn ($record) => $record->nilai_kontrak + $record->nilai_ppn)
                    ->money('IDR', locale: 'id')
                    ->numeric(decimalPlaces: 0)
                    ->alignRight()
                    ->sortable(),
                    
                TextColumn::make('status_kontrak')
                    ->badge()
                    ->color(fn (string $state): string => match ($state) {
                        'draft' => 'gray',
                        'aktif' => 'success',
                        'selesai' => 'primary',
                        'terminasi' => 'danger',
                    }),
            ])
            ->filters([
                Tables\Filters\SelectFilter::make('status_kontrak')
                    ->options([
                        'draft' => 'Draft',
                        'aktif' => 'Aktif',
                        'selesai' => 'Selesai',
                        'terminasi' => 'Terminasi',
                    ]),
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
            'index' => Pages\ListKontraks::route('/'),
            'create' => Pages\CreateKontrak::route('/create'),
            'edit' => Pages\EditKontrak::route('/{record}/edit'),
        ];
    }
    // Add this inside your KontrakResource class (at the top level, not inside another method)
    protected static function updateGrandTotal(Set $set, Get $get): void
    {
        $details = $get('details');
        $total = collect($details)->sum(function($item) {
            return ($item['qty'] ?? 0) * ($item['harga'] ?? 0);
        });
        $set('nilai_kontrak', $total);
        $set('nilai_ppn', $total * 0.11);
        $set('grand_total', $total * 1.11);
    }
}