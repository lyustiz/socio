part of 'help_bloc.dart';

abstract class HelpState extends Equatable {
  const HelpState();

  @override
  List<Object> get props => [];
}

class HelpInitial extends HelpState {
  @override
  String toString() => 'HelpInitial';
}

class HelpLoading extends HelpState {
  @override
  String toString() => 'HelpLoading';
}

class HelpLoaded extends HelpState {
  final Help help;

  const HelpLoaded(this.help);

  @override
  List<Object> get props => [help];

  @override
  String toString() => 'HelpLoaded { helps: $help }';
}

class HelpsLoaded extends HelpState {
  final List<Help> helps;

  HelpsLoaded(List<Help> helps) : this.helps = helps;

  @override
  List<Object> get props => [helps];

  @override
  String toString() => 'HelpsLoaded { helps: $helps }';
}

class HelpSelected extends HelpState {
  final Help help;

  HelpSelected(Help this.help);
  @override
  String toString() => 'HelpSelected $help';
}

class HelpError extends HelpState {
  @override
  String toString() => 'HelpError';
}
