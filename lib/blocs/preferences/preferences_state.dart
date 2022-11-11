part of 'preferences_bloc.dart';

abstract class PreferencesState extends Equatable {
  const PreferencesState();

  @override
  List<Object> get props => [];
}

class PreferencesInitial extends PreferencesState {}

class PreferenceLoaded extends PreferencesState {
  final Theme theme;
  final String endpoint;
  final String locale;
  const PreferenceLoaded(
      {required this.theme, required this.endpoint, this.locale = "es-CO"});

  @override
  List<Object> get props => [theme, endpoint, locale];

  @override
  String toString() => '$runtimeType { $theme,  $endpoint, $locale }';
}
