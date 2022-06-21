import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socio/repository/juego_datalle_repository.dart';
import 'package:socio/utils/db/db_manager.dart';

part 'juegodetalle_event.dart';
part 'juegodetalle_state.dart';

class JuegodetalleBloc extends Bloc<JuegoDetalleEvent, JuegoDetalleState> {
  JuegoDetalleRepository rep = JuegoDetalleRepository();
  JuegodetalleBloc() : super(JuegoDetalleInitial()) {
    on<GetJuegoDetalle>((event, emit) => _onGetJuegoDetalle(event, emit));
  }

  void _onGetJuegoDetalle(event, emit) async {
    emit(JuegoDetalleLoading());
    final JuegosWithDetalles? juego =
        await rep.getJuegoWithDetalles(idJuego: event.idJuego);
    if (juego is JuegosWithDetalles) {
      emit(JuegoDetalleLoaded(juego));
    } else {
      emit(JuegoDetalleError);
    }
  }
}
