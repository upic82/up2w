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
use Illuminate\Support\Facades\DB;
use Filament\Forms\Components\Hidden;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Section;
use Filament\Tables\Columns\TextColumn;
use Filament\Forms\Components\TextInput;
use Filament\Notifications\Notification;
use Illuminate\Database\Eloquent\Builder;
use Filament\Forms\Components\Placeholder;
use App\Filament\Resources\HpeResource\Pages;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use App\Filament\Resources\HpeResource\RelationManagers;
use App\Models\Kontrak;
use App\Models\Spbl;
use Icetalker\FilamentTableRepeater\Forms\Components\TableRepeater;

class HpeResource extends Resource
{
    protected static ?string $model = Hpe::class;

    protected static ?string $navigationLabel = 'HPE / RAB';
    protected static ?string $navigationGroup = 'Pengadaan';
    protected static ?int $navigationSort = 7;
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
                        Forms\Components\Actions::make([
                            Forms\Components\Actions\Action::make('actual_pengadaan')
                            ->label('Actual Pengadaan')
                            ->button()
                            ->color('info')
                            ->modalHeading('Daftar Actual Pengadaan')
                            ->modalSubmitAction(false)
                            ->modalCancelAction(false)
                            ->modalContent(function (Get $get) {
                                $noDkmj = $get('no_dkmj');
                                if (!$noDkmj) {
                                    return view('filament.components.no-dkmj-selected');
                                }
                                
                                $dkmj = Dkmj::with(['penugasan', 'details.material', 'spbls.details', 'hpes.details'])->find($noDkmj);
                                if (!$dkmj || !$dkmj->penugasan) {
                                    return view('filament.components.no-penugasan-found');
                                }

                                // Hitung total qty per material dari SPBL dan HPE
                                $materialUsage = [];
                                
                                // Proses SPBL
                                foreach ($dkmj->spbls as $spbl) {
                                    foreach ($spbl->details as $detail) {
                                        $materialId = $detail->no_material;
                                        $materialUsage[$materialId]['spbl_qty'] = ($materialUsage[$materialId]['spbl_qty'] ?? 0) + $detail->qty;
                                    }
                                }
                                
                                // Proses HPE
                                foreach ($dkmj->hpes as $hpe) {
                                    foreach ($hpe->details as $detail) {
                                        $materialId = $detail->no_material;
                                        $materialUsage[$materialId]['hpe_qty'] = ($materialUsage[$materialId]['hpe_qty'] ?? 0) + $detail->qty;
                                    }
                                }

                                
                                // Siapkan data untuk view
                                $materialDetails = [];
                                foreach ($dkmj->details as $dkmjDetail) {
                                    $materialId = $dkmjDetail->no_material;
                                    $material = $dkmjDetail->material; // Ambil relasi material
                                    
                                    $materialDetails[] = [
                                        'nama_material' => Material::find($materialId)?->nama_material  ?? 'Material tidak ditemukan',
                                        'satuan' => Material::find($materialId)?->satuan ?? '-',
                                        'qty_dkmj' => $dkmjDetail->qty,
                                        'qty_spbl' => $materialUsage[$materialId]['spbl_qty'] ?? 0,
                                        'qty_hpe' => $materialUsage[$materialId]['hpe_qty'] ?? 0,
                                        'sisa' => $dkmjDetail->qty - (($materialUsage[$materialId]['spbl_qty'] ?? 0) + ($materialUsage[$materialId]['hpe_qty'] ?? 0))
                                    ];
                                }

                                $penugasanId = $dkmj->penugasan->id;
                                // Ambil total dari semua SPBL dan HPE milik penugasan ini
                                $totalSpbl = Spbl::whereHas('dkmj.workOrder', function ($query) use ($penugasanId) {
                                    $query->where('no_amp', $penugasanId);
                                })->sum('grand_total');
                                 $totalHpe = Hpe::whereHas('dkmj.workOrder', function ($query) use ($penugasanId) {
                                    $query->where('no_amp', $penugasanId);
                                })->sum('grand_total');
                                 $totalKontrak = Kontrak::whereHas('hpe.dkmj.workOrder', function ($query) use ($penugasanId) {
                                    $query->where('no_amp', $penugasanId);
                                })->sum('grand_total');

                                //ambil semua SPBL terkait penugasan yang sedang dipilih
                                $spblList = Spbl::whereHas('dkmj.workOrder', function ($query) use ($penugasanId) {
                                    $query->where('no_amp', $penugasanId);
                                })->get();
                                $hpeList = Hpe::whereHas('dkmj.workOrder', function ($query) use ($penugasanId) {
                                    $query->where('no_amp', $penugasanId);
                                })->get();
                                $kontrakList = Kontrak::whereHas('hpe.dkmj.workOrder', function ($query) use ($penugasanId) {
                                    $query->where('no_amp', $penugasanId);
                                })->get();

                                return view('filament.components.actual-pengadaan-modal', [
                                    'spbls' => $spblList,
                                    'hpes' => $hpeList,
                                    'kontraks' =>$kontrakList,
                                    'material_details' => $materialDetails,
                                    'totalSpbl' => $totalSpbl,
                                    'totalHpe' => $totalHpe,
                                    'totalKontrak' => $totalKontrak,
                                    'penugasan' => $dkmj->penugasan,
                                ]);
                            })
                        ])->fullWidth(),
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
                                    ->minValue(1)
                                    ->reactive()
                                    ->live()
                                    ->required()
                                    /*->afterStateUpdated(function ($state, callable $set, callable $get) {
                                        $qty = (float) $get('qty');
                                        $harga = (float) $get('harga');
                                        $set('subtotal', $qty * $harga);
                                    })*/
                                    ->afterStateUpdated(function ($state, $set, $get, $context) {
                                        $qty = (float) $state;
                                        $harga = (float) $get('harga');
                                        $set('subtotal', $qty * $harga);

                                        $noDkmj = $get('../../no_dkmj');
                                        $materialId = $get('no_material');
                                        $currentSpblId = $context === 'edit' ? $get('../../id') : null;
                                        $currentDetailId = $get('id'); // ID detail yang sedang diedit

                                        if (!$noDkmj || !$materialId) return;

                                        $dkmj = Dkmj::with(['details', 'hpes.details'])->find($noDkmj);
                                        $dkmjDetail = $dkmj->details->firstWhere('no_material', $materialId);

                                        if (!$dkmjDetail) {
                                            Notification::make()
                                                ->title('Material Tidak Ditemukan')
                                                ->danger()
                                                ->send();
                                            $set('qty', 0);
                                            return;
                                        }

                                        // Hitung total terpakai (SPBL + HPE)
                                        $totalUsed = $dkmj->spbls
                                            ->when($currentSpblId, fn($c) => $c->where('id', '!=', $currentSpblId))
                                            ->flatMap->details
                                            ->where('no_material', $materialId)
                                            ->sum('qty')
                                            +
                                            $dkmj->hpes
                                            ->flatMap->details
                                            ->where('no_material', $materialId)
                                            ->sum('qty');

                                        // Hitung nilai awal sebelum edit (jika mode edit)
                                        $originalQty = 0;
                                        if ($context === 'edit' && $currentDetailId) {
                                            $originalQty = \App\Models\HpeDetail::find($currentDetailId)->qty;
                                        }

                                        // Sisa stok = Stok DKMJ - (Total Terpakai - Nilai Awal + Nilai Baru)
                                        $remainingQty = $dkmjDetail->qty - ($totalUsed - $originalQty + $qty);

                                        if ($remainingQty < 0) {
                                            $maxAllowed = $dkmjDetail->qty - ($totalUsed - $originalQty);
                                            Notification::make()
                                                ->title('Stok Tidak Cukup')
                                                ->body("Maksimal qty yang diizinkan: $maxAllowed")
                                                ->warning()
                                                ->duration(5000)
                                                ->send();
                                                
                                            $set('qty', max(0, $maxAllowed));
                                            $set('subtotal', max(0, $maxAllowed) * $harga);
                                        }
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
                            ->minItems(1)
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
                        TextInput::make('sisa_saldo_hidden')
                           ->disabled()
                            ->rules([
                                'numeric',
                                'min:0'
                            ])
                            ->validationMessages([
                                'min' => 'Saldo penugasan tidak boleh minus. Silakan silahkan disesuaikan.',
                                'numeric' => 'Nilai harus berupa angka'
                            ])
                        ,
                        Placeholder::make('sisa_saldo_penugasan')
                            ->label('Saldo Penugasan Tersisa')
                            ->content(function ($record, $state, $get,$set) {
                                $noDkmj = $get('no_dkmj');

                                if (!$noDkmj) return '-';

                                $dkmj = \App\Models\Dkmj::find($noDkmj);
                                if (!$dkmj || !$dkmj->workOrder || !$dkmj->workOrder->penugasan) return '-';

                                $penugasan = $dkmj->workOrder->penugasan;

                                // Hitung total SPBL sebelumnya (termasuk yang sedang diedit)
                                $totalSpbl = Spbl::where('no_dkmj', $noDkmj)
                                    ->when($record?->id, function($query) use ($record) {
                                        $query->where('id', '!=', $record->id);
                                    })
                                    ->sum(DB::raw('nilai_spbl + nilai_ppn'));

                                // [BARU] Hitung total HPE/RAB untuk penugasan ini
                                $totalHpe = Hpe::whereHas('dkmj', function($query) use ($dkmj) {
                                        $query->where('no_dkmj', $dkmj->no_dkmj);
                                    })
                                    ->sum(DB::raw('nilai_hpe + nilai_ppn'));

                                // Hitung sisa saldo (termasuk HPE)
                                $saldo = $penugasan->nilai_penugasan - ($totalSpbl + $totalHpe + (float) $get('grand_total'));
                                // Simpan nilai ke hidden field
                                $set('sisa_saldo_hidden', $saldo);
                                return 'Rp ' . number_format($saldo, 0, ',', '.');
                            })
                            ->extraAttributes(['class' => 'text-right text-red-600 font-semibold'])
                            
                        
                    
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
