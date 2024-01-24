part of 'figura_bloc.dart';

abstract class FiguraEvent extends Equatable {
  const FiguraEvent();

  @override
  List<Object> get props => [];
}

class GetFigura extends FiguraEvent {
  final FiguraDto figura;

  const GetFigura(this.figura);

  @override
  List<Object> get props => [figura];

  @override
  String toString() => 'GetFigura';
}

class GetAllFiguras extends FiguraEvent {
  final int idProgramacionJuego;
  const GetAllFiguras(this.idProgramacionJuego);

  @override
  List<Object> get props => [idProgramacionJuego];

  @override
  String toString() => 'GetAllFiguras $idProgramacionJuego';
}

class UpdateFigura extends FiguraEvent {
  final FiguraDto figura;
  final int idProgramacionJuego;

  const UpdateFigura(this.figura, this.idProgramacionJuego);

  @override
  List<Object> get props => [figura, idProgramacionJuego];

  @override
  String toString() => 'UpdateFigura';
}

class SetFigura extends FiguraEvent {
  final FiguraDto figura;

  const SetFigura(this.figura);

  @override
  List<Object> get props => [figura];

  @override
  String toString() => 'SetFigura';
}

class UpdateFiguraMultiple extends FiguraEvent {
  final FiguraDto figura;
  final int idProgramacionJuego;

  const UpdateFiguraMultiple(this.figura, this.idProgramacionJuego);

  @override
  List<Object> get props => [figura, idProgramacionJuego];

  @override
  String toString() => 'UpdateFiguraMultiple';
}

class InsertFigura extends FiguraEvent {
  final FiguraDto figura;

  const InsertFigura(this.figura);

  @override
  List<Object> get props => [figura];

  @override
  String toString() => 'InsertFigura';
}

class DeleteFigura extends FiguraEvent {
  final FiguraDto figura;

  const DeleteFigura(this.figura);

  @override
  List<Object> get props => [figura];

  @override
  String toString() => 'DeleteFigura';
}

class SelectFigura extends FiguraEvent {
  final FiguraDto figura;

  const SelectFigura(this.figura);

  @override
  List<Object> get props => [figura];

  @override
  String toString() => 'SelectFigura';
}
