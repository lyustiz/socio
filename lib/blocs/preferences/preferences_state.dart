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
  const PreferenceLoaded({required this.theme, required this.endpoint});

  @override
  List<Object> get props => [theme, endpoint];

  @override
  String toString() => '$runtimeType { $theme }';
}
