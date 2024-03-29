part of 'juego_bloc.dart';

abstract class JuegoEvent extends Equatable {
  const JuegoEvent();

  @override
  List<Object> get props => [];
}

class GetJuego extends JuegoEvent {
  final Juego juego;

  GetJuego(this.juego);

  @override
  List<Object> get props => [juego];

  @override
  String toString() => 'GetJuego';
}

class GetAllJuego extends JuegoEvent {
  final String estado;
  GetAllJuego(this.estado);

  @override
  List<Juego> get props => [];

  @override
  String toString() => 'GetAllJuegos';
}

class ClearJuego extends JuegoEvent {
  @override
  List<Juego> get props => [];

  @override
  String toString() => 'ClearJuegos';
}

class UpdateJuego extends JuegoEvent {
  final Juego juego;

  UpdateJuego(this.juego);

  @override
  List<Juego> get props => [juego];

  @override
  String toString() => 'UpdateJuego';
}

class InsertJuego extends JuegoEvent {
  final Juego juego;

  InsertJuego(this.juego);

  @override
  List<Juego> get props => [juego];

  @override
  String toString() => 'InsertJuego';
}

class DeleteJuego extends JuegoEvent {
  final Juego juego;

  DeleteJuego(this.juego);

  @override
  List<Juego> get props => [juego];

  @override
  String toString() => 'DeleteJuego';
}

class SelectJuego extends JuegoEvent {
  final Juego juego;

  SelectJuego(this.juego);

  @override
  List<Juego> get props => [juego];

  @override
  String toString() => 'SelectJuego';
}

class SetJuego extends JuegoEvent {
  final JuegosWithConfiguracion juego;

  const SetJuego(this.juego);

  @override
  List<Object> get props => [juego];

  @override
  String toString() => 'SetJuego';
}

class UpdateCartonesJuego extends JuegoEvent {
  final int idProgramacionJuego;
  final String cartonesEnJuego;

  const UpdateCartonesJuego(this.idProgramacionJuego, this.cartonesEnJuego);

  @override
  List<Object> get props => [idProgramacionJuego, cartonesEnJuego];

  @override
  String toString() =>
      'UpdateCartonesJuego $idProgramacionJuego $cartonesEnJuego';
}
