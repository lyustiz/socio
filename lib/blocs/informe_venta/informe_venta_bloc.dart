import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socio/providers/dto/informe_promedio_ventas_dto.dart';
import 'package:socio/repository/informe_venta_repository.dart';

part 'informe_venta_event.dart';
part 'informe_venta_state.dart';

class InformeVentaBloc extends Bloc<InformeVentaEvent, InformeVentaState> {
  InformeVentaRepository rep = InformeVentaRepository();
  InformeVentaBloc() : super(InformeVentaInitial()) {
    on<GetInformeVenta>((event, emit) => _onGetInformeVenta(event, emit));
  }

  void _onGetInformeVenta(event, emit) async {
    emit(InformeVentaLoading());
    final InformePromedioVentasDto? informe =
        await rep.getInformeVentas(fechaF: event.fechaF, fechaI: event.fechaI);
    if (informe is InformePromedioVentasDto) {
      emit(InformeVentaLoaded(informe));
    } else {
      emit(const InformeVentaError('No ha sido posible cargar el Informe'));
    }
  }
}
