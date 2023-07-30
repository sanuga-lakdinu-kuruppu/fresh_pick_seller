part of 'landing_page_bloc.dart';

@immutable
abstract class LandingPageEvent {}

class TabChanged extends LandingPageEvent {
  final int tabIndex;

  TabChanged({required this.tabIndex});
}
