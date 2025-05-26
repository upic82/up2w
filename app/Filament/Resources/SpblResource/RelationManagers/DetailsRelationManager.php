<?php

namespace App\Filament\Resources\SpblResource\RelationManagers;

use App\Models\Dkmj;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Tables;
use Filament\Tables\Table;

class DetailsRelationManager extends RelationManager
{
    protected static string $relationship = 'details';

    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Select::make('no_material')
                    ->label('Material/Jasa')
                    ->options(function () {
                        $dkmjId = $this->getOwnerRecord()->no_dkmj;
                        if ($dkmjId) {
                            return Dkmj::find($dkmjId)
                                ->details()
                                ->with('material')
                                ->get()
                                ->pluck('material.nama_material', 'material.id');
                        }
                        return [];
                    })
                    ->required()
                    ->searchable(),
                    
                Forms\Components\TextInput::make('qty')
                    ->label('Quantity')
                    ->numeric()
                    ->required(),
                    
                Forms\Components\TextInput::make('harga')
                    ->label('Harga Satuan (Rp)')
                    ->numeric()
                    ->required(),
            ]);
    }

    public function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('material.nama_material')
                    ->label('Material/Jasa'),
                    
                Tables\Columns\TextColumn::make('qty')
                    ->label('Qty'),
                    
                Tables\Columns\TextColumn::make('harga')
                    ->label('Harga')
                    ->money('IDR'),
                    
                Tables\Columns\TextColumn::make('subtotal')
                    ->label('Subtotal')
                    ->money('IDR')
                    ->state(fn ($record) => $record->qty * $record->harga),
            ])
            ->filters([])
            ->headerActions([
                Tables\Actions\CreateAction::make(),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ]);
    }
}