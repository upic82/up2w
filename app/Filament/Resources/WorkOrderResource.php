<?php

namespace App\Filament\Resources;

use Filament\Forms;
use Filament\Tables;
use Filament\Forms\Get;
use Filament\Forms\Set;
use Filament\Forms\Form;
use App\Models\Penugasan;
use App\Models\WorkOrder;
use Filament\Tables\Table;
use Doctrine\DBAL\Schema\Schema;
use Filament\Resources\Resource;
use Illuminate\Support\HtmlString;
use Filament\Forms\Components\Select;
use Illuminate\Support\Facades\Cache;
use Filament\Forms\Components\Section;
use Filament\Tables\Columns\TextColumn;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\RichEditor;
use Illuminate\Database\Eloquent\Builder;
use Filament\Forms\Components\Placeholder;
use App\Filament\Resources\WorkOrderResource\Pages;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use App\Filament\Resources\WorkOrderResource\RelationManagers;

class WorkOrderResource extends Resource
{
    protected static ?string $model = WorkOrder::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?string $navigationLabel = 'Work Order';
    protected static ?string $navigationGroup = 'Perencanaan';
    protected static ?int $navigationSort = 5;
    
    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Section::make()
                    ->schema([
                        Select::make('no_amp')
                            ->label('Pilih Penugasan')
                            ->options(Penugasan::active()->pluck('nama_penugasan', 'id'))
                            ->required()
                            ->unique(ignoreRecord: true)  // <-- Ini validasi untuk mencegah duplikat
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
                                $set('nomorwbs', $penugasan->no_wbs);
                            })
                            ->searchable(['nama_penugasan', 'no_amp']),
                        Section::make()
                            ->Schema([
                                Placeholder::make('nomorwbs_info')
                                    ->label('Nomor WBS')
                                    ->content(function (Get $get) {
                                        $penugasanId = $get('no_amp');
                                        if (!$penugasanId) return '-';
                                        
                                        // Untuk optimasi, bisa tambahkan caching
                                        return Cache::remember("penugasan_{$penugasanId}_wbs", 60, function() use ($penugasanId) {
                                            return Penugasan::find($penugasanId)?->no_wbs ?? '-';
                                        });
                                    }),
                                Placeholder::make('nomoramp_info')
                                    ->label('Nomor AMP')
                                    ->content(function (Get $get) {
                                        $penugasanId = $get('no_amp');
                                        if (!$penugasanId) return '-';
                                        
                                        // Untuk optimasi, bisa tambahkan caching
                                        return Cache::remember("penugasan_{$penugasanId}_amp", 60, function() use ($penugasanId) {
                                            return Penugasan::find($penugasanId)?->no_amp ?? '-';
                                        });
                                    }),
                                Placeholder::make('nilaipenugasan_info')
                                    ->label('Nilai Penugasan')
                                    ->content(function (Get $get) {
                                        $penugasanId = $get('no_amp');
                                        if (!$penugasanId) return '-';
                                        
                                        // Untuk optimasi, bisa tambahkan caching
                                        return Cache::remember("penugasan_{$penugasanId}_nilai", 60, function() use ($penugasanId) {
                                            
                                            return number_format(Penugasan::find($penugasanId)?->nilai_penugasan ?? '0', 0, ',', '.');
                                        });
                                    }),
                                Placeholder::make('tglpenugasan_info')
                                    ->label('Nomor AMP')
                                    ->content(function (Get $get) {
                                        $penugasanId = $get('no_amp');
                                        if (!$penugasanId) return '-';
                                        
                                        // Untuk optimasi, bisa tambahkan caching
                                        return Cache::remember("penugasan_{$penugasanId}_tglawal", 60, function() use ($penugasanId) {
                                            return Penugasan::find($penugasanId)?->tanggal_penugasan ?? '-';
                                        });
                                    }),
                                Placeholder::make('bataswaktu_info')
                                    ->label('Batas Waktu')
                                    ->content(function (Get $get) {
                                        $penugasanId = $get('no_amp');
                                        if (!$penugasanId) return '-';
                                        
                                        // Untuk optimasi, bisa tambahkan caching
                                        return Cache::remember("penugasan_{$penugasanId}_batasan", 60, function() use ($penugasanId) {
                                            return Penugasan::find($penugasanId)?->batas_waktu_penugasan ?? '-';
                                        });
                                    }),
                
                                
                        
                            ])
                            ->columns(5)
                
                    ]),
                Section::make('Working Item')
                    ->schema([
                        RichEditor::make('technical_requirment')
                            ->label('Technical Requirement'),
                        RichEditor::make('task_plan_schedule')
                            ->label('Task Plan & Schedule'),
                        RichEditor::make('material')
                            ->label('Material'),
                        RichEditor::make('method')
                            ->label('Method (Internal/External)'),
                        RichEditor::make('machine_tools_usage')
                            ->label('Machine & Tools Usage')
                    ])
                    ->columns(2)
            ]);
    }
    
    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('penugasan.no_amp')
                    ->label('No AMP')
                    ->searchable(),
                TextColumn::make('penugasan.nama_penugasan')
                    ->label('Nama Penugasan')
                    ->searchable(),
                TextColumn::make('no_wo')
                    ->label('No WO')
                    ->searchable(),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\Action::make('view_workorder')
                        ->label('Print')
                        ->tooltip('Cetak Workorder')
                        ->icon('heroicon-o-printer')
                        ->url(fn ($record) => route('workorder.print', $record))
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
            'index' => Pages\ListWorkOrders::route('/'),
            'create' => Pages\CreateWorkOrder::route('/create'),
            'edit' => Pages\EditWorkOrder::route('/{record}/edit'),
        ];
    }
}
