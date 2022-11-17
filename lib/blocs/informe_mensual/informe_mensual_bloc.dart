import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socio/providers/dto/informe_mensual_dto.dart';
import 'package:socio/repository/informe_mensual_repository.dart';

part 'informe_mensual_event.dart';
part 'informe_mensual_state.dart';

class InformeMensualBloc
    extends Bloc<InformeMensualEvent, InformeMensualState> {
  InformeMensualRepository rep = InformeMensualRepository();
  InformeMensualBloc() : super(InformeMensualInitial()) {
    on<GetInformeMensual>((event, emit) => _onGetInformeMensual(event, emit));
  }

  void _onGetInformeMensual(event, emit) async {
    emit(InformeMensualLoading());

    late InformeMensualDto? juego;

    try {
      juego = await rep.getInformeMensual(anio: event.anio, mes: event.mes);
    } catch (e) {
      emit(InformeMensualError);
    }

    if (juego is InformeMensualDto) {
      emit(InformeMensualLoaded(juego));
    } else {
      emit(const InformeMensualError('No ha sido posible cargar el Informe'));
    }
  }
}
