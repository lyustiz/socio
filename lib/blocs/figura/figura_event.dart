part of 'figura_bloc.dart';

abstract class FiguraEvent extends Equatable {
  const FiguraEvent();

  @override
  List<Object> get props => [];
}

class GetFigura extends FiguraEvent {
  final Figura figura;

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
  final Figura figura;

  const UpdateFigura(this.figura);

  @override
  List<Object> get props => [figura];

  @override
  String toString() => 'UpdateFigura';
}

class InsertFigura extends FiguraEvent {
  final Figura figura;

  const InsertFigura(this.figura);

  @override
  List<Object> get props => [figura];

  @override
  String toString() => 'InsertFigura';
}

class DeleteFigura extends FiguraEvent {
  final Figura figura;

  const DeleteFigura(this.figura);

  @override
  List<Object> get props => [figura];

  @override
  String toString() => 'DeleteFigura';
}

class SelectFigura extends FiguraEvent {
  final Figura figura;

  const SelectFigura(this.figura);

  @override
  List<Object> get props => [figura];

  @override
  String toString() => 'SelectFigura';
}
