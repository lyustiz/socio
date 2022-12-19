import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socio/providers/dto/informe_juego_dto.dart';
import 'package:socio/repository/informe_juego_repository.dart';

part 'informe_juego_event.dart';
part 'informe_juego_state.dart';

class InformeJuegoBloc extends Bloc<InformeJuegoEvent, InformeJuegoState> {
  InformeJuegoRepository rep = InformeJuegoRepository();

  InformeJuegoBloc() : super(InformeJuegoInitial()) {
    on<GetInformeJuego>((event, emit) => _onGetInformeJuego(event, emit));
  }

  void _onGetInformeJuego(event, emit) async {
    emit(InformeJuegoLoading());
    final InformeJuegoDto? juego =
        await rep.getInformeJuego(idJuego: event.idJuego);
    if (juego is InformeJuegoDto) {
      emit(InformeJuegoLoaded(juego));
    } else {
      emit(const InformeJuegoError('No ha sido posible cargar el Informe'));
    }
  }
}
