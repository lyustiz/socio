part of 'preferences_bloc.dart';

abstract class PreferencesEvent extends Equatable {
  const PreferencesEvent();

  @override
  List<Object> get props => [];
}

class LoadPreferences extends PreferencesEvent {}

class UpdateTheme extends PreferencesEvent {
  final Theme theme;

  const UpdateTheme(this.theme);

  @override
  List<Object> get props => [
        {theme}
      ];

  @override
  String toString() => '$runtimeType { $theme }';
}

class UpdateEndPoint extends PreferencesEvent {
  final String empresa;

  const UpdateEndPoint(this.empresa);

  @override
  List<Object> get props => [
        {empresa}
      ];

  @override
  String toString() => 'UpdateEndPonit { $empresa }';
}
