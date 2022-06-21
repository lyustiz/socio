part of 'juegodetalle_bloc.dart';

abstract class JuegoDetalleState extends Equatable {
  const JuegoDetalleState();

  @override
  List<Object> get props => [];
}

class JuegoDetalleInitial extends JuegoDetalleState {
  @override
  String toString() => 'JuegoDetalleInitial { juegos: [] }';
}

class JuegoDetalleLoading extends JuegoDetalleState {
  @override
  String toString() => 'JuegodetalleLoading { juegos: [] }';
}

class JuegoDetalleLoaded extends JuegoDetalleState {
  final JuegosWithDetalles juegosWithDetalles;

  const JuegoDetalleLoaded(this.juegosWithDetalles);

  @override
  List<Object> get props => [juegosWithDetalles];

  @override
  String toString() => 'JuegoLoaded { juegos: $juegosWithDetalles }';
}

class JuegoDetalleSelected extends JuegoDetalleState {
  final JuegosWithDetalles juegosWithDetalles;

  const JuegoDetalleSelected(this.juegosWithDetalles);
  @override
  String toString() => 'JuegoSelected $juegosWithDetalles';
}

class JuegoDetalleError extends JuegoDetalleState {
  @override
  String toString() => 'JuegoDetalleError';
}
