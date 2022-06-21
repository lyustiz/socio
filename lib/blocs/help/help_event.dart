part of 'help_bloc.dart';

abstract class HelpEvent extends Equatable {
  const HelpEvent();

  @override
  List<Object> get props => [];
}

class GetHelp extends HelpEvent {
  final String screen;

  GetHelp(this.screen);

  @override
  List<Object> get props => [screen];

  @override
  String toString() => 'GetHelp';
}

class GetAllHelp extends HelpEvent {
  GetAllHelp();

  @override
  List<Help> get props => [];

  @override
  String toString() => 'GetAllUsuario';
}

class UpdateHelp extends HelpEvent {
  final Help help;

  UpdateHelp(this.help);

  @override
  List<Help> get props => [help];

  @override
  String toString() => 'UpdateHelp';
}

class InsertHelp extends HelpEvent {
  final Help help;

  InsertHelp(this.help);

  @override
  List<Help> get props => [help];

  @override
  String toString() => 'InsertHelp';
}

class DeleteHelp extends HelpEvent {
  final Help help;

  DeleteHelp(this.help);

  @override
  List<Help> get props => [help];

  @override
  String toString() => 'DeleteHelp';
}

class SelectHelp extends HelpEvent {
  final Help screen;

  SelectHelp(this.screen);

  @override
  List<Help> get props => [screen];

  @override
  String toString() => 'SelectHelp $screen';
}
