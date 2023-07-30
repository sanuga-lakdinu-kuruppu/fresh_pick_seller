import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fresh_pick_seller/seller/data/models/settings/user_details.dart';
import 'package:meta/meta.dart';

import '../../../../test_data/user_data.dart';

part 'settings_page_event.dart';
part 'settings_page_state.dart';

class SettingsPageBloc extends Bloc<SettingsPageEvent, SettingsPageState> {
  SettingsPageBloc() : super(SettingsPageInitial()) {
    on<SettingPageInitialFetchEvent>(settingPageInitialFetchEvent);
    on<SettingPageFullNameEditButtonClickedEvent>(
        settingPageFullNameEditButtonClickedEvent);
    on<SettingPageFullNamePopUpSaveButtonClickedEvent>(
        settingPageFullNamePopUpSaveButtonClickedEvent);
    on<SettingPageAnyCancelButtonClickedEvent>(
        settingPageAnyCancelButtonClickedEvent);
  }

  FutureOr<void> settingPageInitialFetchEvent(
      SettingPageInitialFetchEvent event,
      Emitter<SettingsPageState> emit) async {
    emit(SettingsPageLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    emit(SettingsPageLoadingSucessState(
      user: UserData.user,
    ));
  }

  FutureOr<void> settingPageFullNameEditButtonClickedEvent(
      SettingPageFullNameEditButtonClickedEvent event,
      Emitter<SettingsPageState> emit) {
    emit(SettingsPageFullNameWantToEditActionState());
  }

  FutureOr<void> settingPageFullNamePopUpSaveButtonClickedEvent(
      SettingPageFullNamePopUpSaveButtonClickedEvent event,
      Emitter<SettingsPageState> emit) {
    //save here
    emit(SettingsPageNavigateToPreviousPageAtionState());
    emit(SettingsPageFullNameEditedAtionState());
    emit(SettingsPageLoadingSucessState(user: UserData.user));
  }

  FutureOr<void> settingPageAnyCancelButtonClickedEvent(
      SettingPageAnyCancelButtonClickedEvent event,
      Emitter<SettingsPageState> emit) {
    emit(SettingsPageNavigateToPreviousPageAtionState());
  }
}
