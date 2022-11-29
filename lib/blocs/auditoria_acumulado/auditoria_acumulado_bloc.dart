import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socio/providers/dto/auditoria_acumulado_dto.dart';
import 'package:socio/providers/dto/informe_promedio_ventas_dto.dart';
import 'package:socio/repository/auditoria_acumulado_repository.dart';

part 'auditoria_acumulado_event.dart';
part 'auditoria_acumulado_state.dart';

class AuditoriaAcumuladoBloc
    extends Bloc<AuditoriaAcumuladoEvent, AuditoriaAcumuladoState> {
  AuditoriaAcumuladoRepository rep = AuditoriaAcumuladoRepository();
  AuditoriaAcumuladoBloc() : super(AuditoriaAcumuladoInitial()) {
    on<GetAuditoriaAcumulado>(
        (event, emit) => _onGetAuditoriaAcumulado(event, emit));
  }

  void _onGetAuditoriaAcumulado(event, emit) async {
    emit(AuditoriaAcumuladoLoading());
    final List<AuditoriaAcumuladoDto> auditoria =
        await rep.getAuditoria(idProgramacionJuego: event.idProgramacionJuego);
    if (auditoria is List<AuditoriaAcumuladoDto>) {
      emit(AuditoriaAcumuladoLoaded(auditoria));
    } else {
      emit(const AuditoriaAcumuladoError(
          'No ha sido posible cargar el Historial'));
    }
  }
}
