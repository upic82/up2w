<?php

namespace App\Filament\Resources;

use Carbon\Carbon;
use Filament\Forms;
use Filament\Tables;
use Filament\Forms\Form;
use App\Models\Penugasan;
use Filament\Tables\Table;
use Filament\Resources\Resource;
use Filament\Tables\Columns\TextColumn;
use Filament\Forms\Components\DatePicker;
use Filament\Tables\Columns\SelectColumn;
use Filament\Tables\Filters\SelectFilter;
use Illuminate\Database\Eloquent\Builder;
use App\Filament\Resources\PenugasanResource\Pages;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use App\Filament\Resources\PenugasanResource\RelationManagers;

class PenugasanResource extends Resource
{
    protected static ?string $model = Penugasan::class;

    protected static ?int $navigationSort = 1;
    protected static ?string $navigationGroup = '2. Perencanaan';
    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?string $navigationLabel = 'Penugasan';
    
    

    public static function form(Form $form): Form
    {
        return $form
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
            ]);
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
            'index' => Pages\ListPenugasans::route('/'),
            'create' => Pages\CreatePenugasan::route('/create'),
            'edit' => Pages\EditPenugasan::route('/{record}/edit'),
        ];
    }
}
