<?php

namespace App\Filament\Resources;

use Filament\Forms;
use App\Models\Dkmj;
use Filament\Tables;
use Filament\Forms\Set;
use App\Models\Material;
use Filament\Forms\Form;
use App\Models\Penugasan;
use Filament\Tables\Table;
use Filament\Resources\Resource;
use Filament\Forms\Components\Group;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\Repeater;
use Filament\Tables\Columns\TextColumn;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\RichEditor;
use Illuminate\Database\Eloquent\Builder;
use App\Filament\Resources\DkmjResource\Pages;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use App\Filament\Resources\DkmjResource\RelationManagers;
use Icetalker\FilamentTableRepeater\Forms\Components\TableRepeater;
use Filament\Forms\Components\Actions\Action; // Import class Action

class DkmjResource extends Resource
{
    protected static ?string $model = Dkmj::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Section::make()
                    ->schema([
                        Forms\Components\Section::make()
                            ->Schema([
                                Select::make('no_amp')
                                    ->label('Pilih Penugasan')
                                    ->options(function () {
                                        return Penugasan::hasWorkOrder()
                                            ->active() // jika ada scope active
                                            ->get()
                                            ->pluck('nama_penugasan', 'id');
                                    })
                                    ->required()
                                    //->unique(ignoreRecord: true)  // <-- Ini validasi untuk mencegah duplikat
                                    ->live() // Auto-update saat dipilih
                                    ->afterStateUpdated(function ($state, Set $set) {
                                        $penugasan = Penugasan::find($state);
                                        
                                        if (!$penugasan) return;

                                        $set('nilai_penugasan', 
                                                $penugasan->nilai_penugasan 
                                                    ? 'Rp ' . number_format($penugasan->nilai_penugasan, 0, ',', '.')
                                                    : '-'
                                            );
                                        
                                        $set('amp_id', $penugasan->no_amp);
                                        $set('tanggal_penugasan', $penugasan->tanggal_penugasan);
                                        $set('batas_waktu', $penugasan->batas_waktu_penugasan);
                                        $set('nomor_wbs', $penugasan->no_wbs);
                                    })
                                    ->afterStateHydrated(function ($state, $set) {
                                        // Ini akan dijalankan saat load form edit
                                        if ($state) {
                                            $penugasan = Penugasan::find($state);
                                            if ($penugasan) {
                                                $set('nilai_penugasan', 
                                                    $penugasan->nilai_penugasan 
                                                        ? 'Rp ' . number_format($penugasan->nilai_penugasan, 0, ',', '.')
                                                        : '-'
                                                );
                                                $set('amp_id', $penugasan->no_amp);
                                                $set('tanggal_penugasan', $penugasan->tanggal_penugasan);
                                                $set('batas_waktu', $penugasan->batas_waktu_penugasan);
                                                $set('nomor_wbs', $penugasan->no_wbs);
                                            }
                                        }
                                    })
                                    ->loadingMessage('Memuat penugasan...')
                                    ->searchDebounce(500)
                                    ->searchable(['nama_penugasan', 'no_amp']),
                                    Section::make()
                                        ->Schema([
                                            // Informasi yang akan terisi otomatis
                                            TextInput::make('nomor_wbs')
                                                ->label('Nomor WBS'),
                                            TextInput::make('amp_id')
                                                ->label('AMP ID'),
                                            TextInput::make('nilai_penugasan')
                                                ->label('Nilai Penugasan'),
                                            TextInput::make('tanggal_penugasan')
                                                ->label('Tanggal Penugasan'),
                                                
                                            TextInput::make('batas_waktu')
                                                ->label('Batas Waktu'),
                                    
                                        ])
                                        ->columns(3)
                            ]),
                            Forms\Components\Section::make()
                            ->Schema([
                                DatePicker::make('tanggal_dkmj')
                                    ->label('Tgl DKMJ')
                                    ->required()
                                    
                            ]),
                            // app/Filament/Resources/DkmjResource.php
                            TextInput::make('no_dkmj')
                                ->label('Nomor DKJM')
                                ->disabled()
                                ->dehydrated()
                                ->required()
                                ->default(function ($operation, $state) {
                                    if ($operation === 'edit') {
                                        return $state;
                                    }
                                    
                                    return 'Akan digenerate otomatis setelah disimpan';
                                }),

                            //====================DKMJ Item===================================
                            Section::make('DKMJ Item')
                                ->schema([
                                    TableRepeater::make('details')
                                        ->relationship('details')
                                        ->schema([
                                            Select::make('no_material')
                                                ->label('Pilih Material/Jasa')
                                                ->options(Material::all()->pluck('nama_material', 'id'))
                                                    
                                                ->required()
                                                ->searchable(),
                                            TextInput::make('spesifikasi'),
                                            TextInput::make('qty')
                                                ->numeric()
                                                ->required()
                                                ->minValue(1)
                                        ])
                                        ->reorderable()
                                        ->cloneable()
                                        ->collapsible()
                                        ->columnSpan('full'),
                                ])
                    
                        ])
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('no_dkmj')->label('No DKMJ')->searchable()->sortable(),
                TextColumn::make('penugasan.nama_penugasan')
                    ->searchable()
                    ->limit(75) // Potong teks setelah 50 karakter
                    ->tooltip(function (TextColumn $column): ?string {
                        $state = $column->getState();
                        return strlen($state) > 75 ? $state : null; // Tampilkan tooltip hanya jika teks dipotong
                    }),
                TextColumn::make('tanggal_dkmj')
                    ->label('Tanggal'),
                TextColumn::make('status')
                    ->badge()
                    ->color(fn (string $state): string => match ($state) {
                        'Draft' => 'gray',
                        'Approved' => 'success',
                        'Review' => 'danger',
                        default => 'primary',
                    }),
                ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\ViewAction::make(), // Tambahkan ini
                Tables\Actions\EditAction::make(),
                Tables\Actions\Action::make('view_dkmj')
                    ->label('')
                    ->tooltip('Cetak DKMJ')
                    ->icon('heroicon-o-printer')
                    ->url(fn ($record) => route('dkmj.print', $record))
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
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListDkmjs::route('/'),
            'create' => Pages\CreateDkmj::route('/create'),
            'view' => Pages\ViewDkmj::route('/{record}/view'), // Tambahkan ini
            'edit' => Pages\EditDkmj::route('/{record}/edit'),
            'dkmj' => Pages\Dkmj::route('/{record}/dkmj'),
        ];
    }

    public static function viewForm(Form $form): Form
    {
        return $form
            ->schema([
                Section::make('Informasi Utama')
                    ->schema([
                        TextInput::make('no_dkmj')->label('No. DKJM')->disabled(),
                        TextInput::make('penugasan.nama_penugasan')->label('Penugasan')->disabled(),
                        // ... field lainnya dalam mode baca saja
                    ])->columns(2),
                
                Section::make('Detail Item')
                    ->schema([
                        Repeater::make('details')
                            ->relationship()
                            ->schema([
                                TextInput::make('material.nama_material')->disabled(),
                                TextInput::make('spesifikasi')->disabled(),
                                TextInput::make('qty')->disabled(),
                            ])
                            ->columns(3)
                            ->disabled()
                    ])
            ]);
    }
}
