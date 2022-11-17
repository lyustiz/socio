import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socio/providers/dto/informe_caja_usuario_dto.dart';
import 'package:socio/repository/informe_usuario_repository.dart';

part 'informe_usuario_event.dart';
part 'informe_usuario_state.dart';

class InformeUsuarioBloc
    extends Bloc<InformeUsuarioEvent, InformeUsuarioState> {
  InformeUsuarioRepository rep = InformeUsuarioRepository();
  InformeUsuarioBloc() : super(InformeUsuarioInitial()) {
    on<GetInformeUsuario>((event, emit) => _onGetInformeUsuario(event, emit));
  }

  void _onGetInformeUsuario(event, emit) async {
    emit(InformeUsuarioLoading());
    final InformeCajaUsuarioDto? informe = await rep.getInformeUsuario(
        idProgramacionJuego: event.idProgramacionJuego,
        idUsuario: event.idUsuario);
    if (informe is InformeCajaUsuarioDto) {
      emit(InformeUsuarioLoaded(informe));
    } else {
      emit(const InformeUsuarioError('No ha sido posible cargar el Informe'));
    }
  }
}
