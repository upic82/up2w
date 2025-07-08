<?php

namespace App\Filament\Resources;

use Filament\Forms;
use Filament\Tables;
use App\Models\Material;
use Filament\Forms\Form;
use Filament\Tables\Table;
use Filament\Resources\Resource;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Illuminate\Database\Eloquent\Builder;
use App\Filament\Resources\MaterialResource\Pages;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use App\Filament\Resources\MaterialResource\RelationManagers;

class MaterialResource extends Resource
{
    protected static ?string $model = Material::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?string $navigationLabel = 'Material/Jasa';
    protected static ?string $navigationGroup = '1. Master Data';

    

    public static function form(Form $form): Form
    {
        return $form
        ->schema([

            //card
            Forms\Components\Section::make()
            ->schema([

                
                //title
                Forms\Components\TextInput::make('nama_material')
                    ->label('Nama Material')
                    ->placeholder('Nama Material')
                    ->required(),
                Forms\Components\TextInput::make('satuan')
                    ->label('Satuan')
                    ->placeholder('Satuan')
                    ->required(),
                Select::make('jenis')
                    ->options([
                        'Material' => 'Material',
                        'Jasa' => 'Jasa',
                    ]),
                TextInput::make('created_by')
                    ->disabled()
                    ->dehydrated()
                    ->default(auth()->user()->name),
                TextInput::make('updated_by')
                    ->disabled()
                    ->dehydrated()
                    ->default(auth()->user()->name)
                    ->visible(fn ($operation) => $operation === 'edit'),

            ])

        ]);
    }
    
    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('nama_material')->searchable(),
                Tables\Columns\TextColumn::make('satuan')->searchable(),
                Tables\Columns\TextColumn::make('jenis')->searchable()->badge()
                    ->color(fn (string $state): string => match ($state) {
                        'Material' => 'warning',
                        'Jasa' => 'success',
                    }),
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
            'index' => Pages\ListMaterials::route('/'),
            'create' => Pages\CreateMaterial::route('/create'),
            'edit' => Pages\EditMaterial::route('/{record}/edit'),
        ];
    }
}
