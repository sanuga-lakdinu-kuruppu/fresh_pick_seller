part of 'settings_page_bloc.dart';

@immutable
abstract class SettingsPageEvent {}

class SettingPageInitialFetchEvent extends SettingsPageEvent {}

class SettingPageFullNameEditButtonClickedEvent extends SettingsPageEvent {}

class SettingPageAddressEditButtonClickedEvent extends SettingsPageEvent {}

class SettingPageMobileNumberEditButtonClickedEvent extends SettingsPageEvent {}

class SettingPageEmailAddressEditButtonClickedEvent extends SettingsPageEvent {}

class SettingPageNicNumberEditButtonClickedEvent extends SettingsPageEvent {}

class SettingPageFullNamePopUpSaveButtonClickedEvent
    extends SettingsPageEvent {}

class SettingPageAnyCancelButtonClickedEvent extends SettingsPageEvent {}

class SettingPageLogoutButtonClickedEvent extends SettingsPageEvent {}

class SettingPageLogoutButtonClickedConfirmedEvent extends SettingsPageEvent {}
