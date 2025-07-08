<?php

namespace App\Filament\Resources\DkmjResource\Pages;

use Filament\Actions\Action;
use Filament\Actions\EditAction;
use App\Filament\Resources\DkmjResource;
use Filament\Notifications\Notification;
use Filament\Resources\Pages\ViewRecord;

class ViewDkmj extends ViewRecord
{
    protected static string $resource = DkmjResource::class;

    protected function getHeaderActions(): array
    {
        return [
        EditAction::make()
            ->visible(fn () => $this->record->approval_status !== 'approved_final'),
        
        //===============tombol approve dan reject==================
        Action::make('submit_tl')
                ->action(function () {
                    $this->record->update(['approval_status' => 'pending_tl']);
                    Notification::make()
                        ->title('DKMJ berhasil disetujui')
                        ->success()
                        ->send();
                })
               
                ->label('Sumbit')
                ->visible(function ($record) {
                    return $record->approval_status === 'draft' && auth()->user()->hasRole('Drafter');
                })->successNotificationTitle('DKMJ berhasil disetujui'),
            Action::make('approved_tl')
                ->action(function () {
                    $this->record->update(['approval_status' => 'approved_tl',
                        'approved_by_tl' => auth()->id()]);
                })
               
                ->label('Approve')
                ->visible(function ($record) {
                    return $record->approval_status === 'pending_tl' && auth()->user()->hasRole('Team Leader');
                })->successNotificationTitle('DKMJ berhasil disetujui'),
            Action::make('approved_am')
                ->action(function () {
                    $this->record->update(['approval_status' => 'approved_am',
                        'approved_by_am' => auth()->id()]);
                })
               
                ->label('Approve')
                ->visible(function ($record) {
                    return $record->approval_status === 'approved_tl' && auth()->user()->can('approve_level_2_dkmj');
                })->successNotificationTitle('DKMJ berhasil disetujui'),
            Action::make('approved_m')
                ->action(function () {
                    $this->record->update(['approval_status' => 'approved_final',
                        'approved_by_manager' => auth()->id()]);
                })
               
                ->label('Approve')
                ->visible(function ($record) {
                    return $record->approval_status === 'approved_am' && auth()->user()->can('approve_level_3_dkmj');
                })->successNotificationTitle('DKMJ berhasil disetujui'),
            Action::make('reject_dkmj')
                ->action(function () {
                    $this->record->update(['approval_status' => 'draft']);
                    $this->record->update(['rejected_by' => auth()->id(),
                        'approved_by_tl' => null,
                        'approved_by_am' => null
                     ]);
                    Notification::make()
                        ->title('DKMJ ditolak')
                        ->success()
                        ->send();
                })
               
                ->label('Reject')
                ->visible(fn ($record) =>
                    ($record->approval_status === 'pending_tl' && auth()->user()->can('approve_level_1_dkmj')) ||
                    ($record->approval_status === 'approved_tl' && auth()->user()->can('approve_level_2_dkmj')) ||
                    ($record->approval_status === 'approved_am' && auth()->user()->can('approve_level_3_dkmj'))
                )->successNotificationTitle('DKMJ berhasil ditolak'),
    ];
    }
}