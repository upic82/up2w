<?php

namespace App\Filament\Resources;

use Carbon\Carbon;
use Filament\Forms;
use App\Models\Spbl;
use Filament\Tables;
use App\Models\Kontrak;
use Filament\Forms\Form;
use App\Models\Penugasan;
use Filament\Tables\Table;
use Filament\Resources\Resource;
use Illuminate\Support\HtmlString;
use Filament\Forms\Components\Tabs;
use Filament\Tables\Columns\TextColumn;
use Filament\Forms\Components\DatePicker;
use Filament\Tables\Columns\SelectColumn;
use Filament\Tables\Filters\SelectFilter;
use Illuminate\Database\Eloquent\Builder;
use Filament\Forms\Components\Placeholder;
use App\Filament\Resources\PenugasanResource\Pages;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use App\Filament\Resources\DkmjResource\Pages\ViewPenugasan;
use App\Filament\Resources\PenugasanResource\RelationManagers;

class PenugasanResource extends Resource
{
    protected static ?string $model = Penugasan::class;

    protected static ?string $navigationGroup = 'Perencanaan';
    protected static ?int $navigationSort = 4;
    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?string $navigationLabel = 'Penugasan';
    
    

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Tabs::make('Tabs')
                ->tabs([
                    Tabs\Tab::make('Info Penugasan')
                        ->icon('heroicon-m-bell')
                        ->schema([
                            Forms\Components\Section::make()
                            
                            ->schema([        
                                Forms\Components\TextInput::make('no_amp')
                                    ->label('No AMP')
                                    ->placeholder('No AMP')
                                    ->required(),
                                Forms\Components\TextInput::make('nama_penugasan')
                                    ->label('Nama Penugasan')
                                    ->placeholder('Nama Penugasan')
                                    ->required(),
                                Forms\Components\TextInput::make('no_surat_penugasan')
                                    ->label('No Surat')
                                    ->placeholder('No Surat'),
                                DatePicker::make('tanggal_penugasan')
                                    ->label('Tanggal Mulai')
                                    ->placeholder('Tanggal Mulai')
                                    ->required(),
                                DatePicker::make('batas_waktu_penugasan')
                                    ->label('Tanggal Berakhir')
                                    ->placeholder('Tanggal Berakhir')
                                    ->required(),
                        

                            ])
                            ->columns(2),
                            Forms\Components\Section::make()
                                ->schema([        
                                    Forms\Components\TextInput::make('nilai_penugasan')
                                        ->label('Nilai Penugasan')
                                        ->placeholder('Nilai Penugasan')
                                        ->required(),
                                    Forms\Components\TextInput::make('no_wbs')
                                        ->label('No WBS')
                                        ->placeholder('No WBS')
                                        ->required(),
                                    Forms\Components\Select::make('status_penugasan')
                                        ->label('Jenis')
                                        ->placeholder('Jenis')
                                        ->options([
                                            'Penugasan' => 'Penugasan',
                                            'Penugasan Sementara' => 'Penugasan Sementara',
                                            'Penugasan Tetap' => 'Penugasan Tetap',
                                        ]),
                                    Forms\Components\TextInput::make('pic_ren')
                                        ->label('PIC Perencanaan')
                                        ->placeholder('PIC Perencanaan'),
                                    Forms\Components\TextInput::make('pic_mek')
                                        ->label('PIC Mekanikal')
                                        ->placeholder('PIC Mekanikal'),
                                    Forms\Components\Select::make('status_progress')
                                        ->label('Status')
                                        ->placeholder('Status')
                                        ->options([
                                            'Not Started' => 'Not Started',
                                            'On Progress' => 'On Progress',
                                            '100% Done' => '100% Done',
                                            'BAPP' => 'BAPP',
                                            'Completed' => 'Completed',
                                            
                                        ]),
                                    

                                ])
                        
                        
                        
                                    ]),
                    Tabs\Tab::make('Pengadaan')
                        ->schema([
                            Placeholder::make('pengadaan_list')
                                ->label('Daftar SPBL & Kontrak')
                                ->content(function ($record) {
                                    $dkmjIds = $record->workOrders->flatMap->dkmj->pluck('id')->unique();

                                    $spbls = Spbl::whereIn('no_dkmj', $dkmjIds)->get()->map(fn($item) => [
                                        'jenis' => 'SPBL',
                                        'no' => $item->no_spbl,
                                        'nama' => $item->nama_spbl,
                                        'tanggal' => $item->tanggal_spbl,
                                        'nilai' => $item->grand_total,
                                        'vendor' => $item->vendor->nama_vendor,
                                    ]);

                                    $kontraks = Kontrak::whereHas('hpe.dkmj', fn($q) => $q->whereIn('id', $dkmjIds))
                                        ->get()
                                        ->map(fn($item) => [
                                            'jenis' => 'Kontrak',
                                            'no' => $item->no_kontrak,
                                            'nama' => $item->judul_kontrak,
                                            'tanggal' => $item->tgl_kontrak_awal,
                                            'nilai' => $item->grand_total,
                                            'vendor' => $item->vendor->nama_vendor,
                                        ]);
                                    //dd($dkmjIds);

                                    $items = $spbls->concat($kontraks)->sortBy('tanggal');


                                    /*return view('filament.components.penugasan-pengadaan-table', [
                                        'pengadaans' => $items,
                                    ])->render();*/
                                    $html = view('filament.components.penugasan-pengadaan-table', [
                                        'pengadaans' => $items,
                                    ])->render();

                                    return new HtmlString($html);
                                }),


                            Placeholder::make('nilai_penugasan_summary')
                                ->label('Nilai Penugasan')
                                ->content(fn ($record) => 'Rp ' . number_format($record->nilai_penugasan, 0, ',', '.')),

                            Placeholder::make('nilai_accrual_summary')
                                ->label('Nilai Accrual')
                                ->content(function ($record) {
                                    $dkmjIds = $record->workOrders->flatMap->dkmj->pluck('id');

                                    $spblTotal = Spbl::whereIn('no_dkmj', $dkmjIds)->sum('grand_total');
                                    $kontrakTotal = Kontrak::whereHas('hpe.dkmj', function ($q) use ($dkmjIds) {
                                        $q->whereIn('id', $dkmjIds);
                                    })->sum('grand_total');

                                    return 'Rp ' . number_format($spblTotal + $kontrakTotal, 0, ',', '.');
                                }),

                            Placeholder::make('saldo_penugasan_summary')
                                ->label('Saldo Penugasan')
                                ->content(function ($record) {
                                    $dkmjIds = $record->workOrders->flatMap->dkmj->pluck('id');

                                    $spblTotal = Spbl::whereIn('no_dkmj', $dkmjIds)->sum('grand_total');
                                    $kontrakTotal = Kontrak::whereHas('hpe.dkmj', function ($q) use ($dkmjIds) {
                                        $q->whereIn('id', $dkmjIds);
                                    })->sum('grand_total');

                                    $saldo = $record->nilai_penugasan - ($spblTotal + $kontrakTotal);

                                    return 'Rp ' . number_format($saldo, 0, ',', '.');
                                }),
                                    ]),
                                
                        ])//->contained(false)
                    ,
                ])->columns(1);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('no_amp')
                    ->label('No AMP')
                    ->searchable(),
                TextColumn::make('nama_penugasan')
                    ->label('Penugasan')
                    ->searchable()
                    ->limit(75) // Potong teks setelah 50 karakter
                    ->tooltip(function (TextColumn $column): ?string {
                        $state = $column->getState();
                        return strlen($state) > 75 ? $state : null; // Tampilkan tooltip hanya jika teks dipotong
                    })
                    ->wrap(),
                TextColumn::make('customer.nama_alias')
                    ->label('Nama Customer')
                    ->searchable()
                    ->sortable()
                    ->tooltip(fn ($record) => $record->customer->nama_customer), // Menampilkan alias saat hover
                TextColumn::make('status_penugasan')
                    ->badge()
                    ->label('Status')
                    ->sortable()
                    ->color(fn (string $state): string => match ($state) {
                        'Not Started' => 'danger',
                        'On Progress' => 'warning',
                        'Completed' => 'info',
                        '100% Done' => 'success',
                        'BAPP' => 'info',
                    }),
                TextColumn::make('batas_waktu_penugasan')
                    ->label('Batas Waktu')
                    ->date() // Format default: 'M j, Y'
                    ->sortable()
                    ->tooltip(function ($record) {
                        if (!$record->batas_waktu_penugasan) {
                            return 'Tidak ada batas waktu';
                        }
                        
                        $now = Carbon::now();
                        $deadline = Carbon::parse($record->batas_waktu_penugasan);
                        
                        return $deadline->isPast() 
                            ? "Terlewat " . $deadline->diffForHumans($now) . " (" . $deadline->format('d/m/Y') . ")"
                            : "Tersisa " . $deadline->diffForHumans($now) . " (" . $deadline->format('d/m/Y') . ")";
                    })
                
            ])
            ->defaultSort('batas_waktu_penugasan', 'asc') // Default sorting
            ->filters([
                SelectFilter::make('status_penugasan')
                    ->label('Status Progress')
                    ->options([
                        'Not Started' => 'Not Started',
                        'On Progress' => 'On Progress',
                        '100% Done' => '100% Done',
                        'BAPP' => 'BAPP',
                        'Completed' => 'Completed',
                        
                    ])
                    ->multiple()
                    ->default(['Not Started', 'On Progress'])
                    ->searchable() // Opsional: jika banyak pilihan
            ])
            ->actions([
                //Tables\Actions\EditAction::make(),
                Tables\Actions\ViewAction::make(),
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
            'index' => Pages\ListPenugasans::route('/'),
            'create' => Pages\CreatePenugasan::route('/create'),
            'edit' => Pages\EditPenugasan::route('/{record}/edit'),
            'view' => Pages\ViewPenugasan::route('/{record}/view'), // Tambahkan ini
        ];
    }
}
