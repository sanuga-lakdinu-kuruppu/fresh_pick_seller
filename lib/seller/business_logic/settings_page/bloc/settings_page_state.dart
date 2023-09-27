part of 'settings_page_bloc.dart';

@immutable
abstract class SettingsPageState {}

abstract class SettingsPageActionState extends SettingsPageState {}

class SettingsPageInitial extends SettingsPageState {}

class SettingsPageLoadingState extends SettingsPageState {}

class SettingsPageLoadingSucessState extends SettingsPageState {
  final UserDataModel user;

  SettingsPageLoadingSucessState({required this.user});
}

class SettingsPageLoadingErrorState extends SettingsPageState {}

class SettingsPageFullNameWantToEditActionState
    extends SettingsPageActionState {}

class SettingsPageNavigateToPreviousPageAtionState
    extends SettingsPageActionState {}

class SettingsPageFullNameEditedAtionState extends SettingsPageActionState {}

class SettingsPageLogoutSuccessAtionState extends SettingsPageActionState {}

class SettingsPageLogoutCheckAtionState extends SettingsPageActionState {}
