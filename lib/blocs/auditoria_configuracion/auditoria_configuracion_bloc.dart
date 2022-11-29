import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socio/providers/dto/auditoria_configuracion_dto.dart';
import 'package:socio/providers/dto/informe_promedio_ventas_dto.dart';
import 'package:socio/repository/auditoria_configuracion_repository.dart';

part 'auditoria_configuracion_event.dart';
part 'auditoria_configuracion_state.dart';

class AuditoriaConfiguracionBloc
    extends Bloc<AuditoriaConfiguracionEvent, AuditoriaConfiguracionState> {
  AuditoriaConfiguracionRepository rep = AuditoriaConfiguracionRepository();
  AuditoriaConfiguracionBloc() : super(AuditoriaConfiguracionInitial()) {
    on<GetAuditoriaConfiguracion>(
        (event, emit) => _onGetAuditoriaConfiguracion(event, emit));
  }

  void _onGetAuditoriaConfiguracion(event, emit) async {
    emit(AuditoriaConfiguracionLoading());
    final List<AuditoriaConfiguracionDto> auditoria =
        await rep.getAuditoria(idProgramacionJuego: event.idProgramacionJuego);
    if (auditoria is List<AuditoriaConfiguracionDto>) {
      emit(AuditoriaConfiguracionLoaded(auditoria));
    } else {
      emit(const AuditoriaConfiguracionError(
          'No ha sido posible cargar el Historial'));
    }
  }
}
