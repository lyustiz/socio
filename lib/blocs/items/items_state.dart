part of 'items_bloc.dart';

class ItemsState extends Equatable {
  final JuegosWithConfiguracion juegoSelected;
  final String terminado;
  final String vendido;
  const ItemsState({
    required this.juegoSelected,
    required this.terminado,
    required this.vendido,
  });

  factory ItemsState.initial() {
    const String terminado = 'N';
    const String vendido = 'N';

    final JuegosWithConfiguracion juegoInitial = JuegosWithConfiguracion(
        juego: Juego(
            idProgramacionJuego: 0,
            tipoJuego: 'C',
            fechaProgramada: DateTime.now(),
            moduloCartones: 0,
            moneda: '',
            valorCarton: 0,
            totalCartones: 0,
            valorModulo: 0,
            totalModulos: 0,
            totalPremios: 0,
            serie: 'A',
            cartonInicial: 0,
            cartonFinal: 0,
            hojaInicial: 0,
            hojaFinal: 0,
            horaCierre: DateTime.now(),
            previoCierre: 0,
            permitirDevolucion: 'N',
            estado: 'C'),
        configuracion: null);

    return ItemsState(
        juegoSelected: juegoInitial, terminado: terminado, vendido: vendido);
  }

  @override
  List<Object> get props => [juegoSelected, vendido, terminado];

  ItemsState copyWhith(
      {JuegosWithConfiguracion? juegoSelected,
      String? terminado,
      String? vendido}) {
    return ItemsState(
        juegoSelected: juegoSelected ?? this.juegoSelected,
        terminado: terminado ?? this.terminado,
        vendido: vendido ?? this.vendido);
  }
}
