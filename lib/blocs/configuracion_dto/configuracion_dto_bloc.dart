import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socio/providers/dto/configuracion_dto.dart';
import 'package:socio/repository/configuracion_repository.dart';

part 'configuracion_dto_event.dart';
part 'configuracion_dto_state.dart';

class ConfiguracionDtoBloc
    extends Bloc<ConfiguracionDtoEvent, ConfiguracionDtoState> {
  ConfiguracionRepository rep = ConfiguracionRepository();

  ConfiguracionDtoBloc() : super(ConfiguracionDtoInitial()) {
    on<GetConfiguracionDto>((event, emit) => _onGetConfiguracion(event, emit));
    /* on<InsertConfiguracion>(
          (event, emit) => _onInsertConfiguracion(event, emit));
      on<DeleteConfiguracion>(
          (event, emit) => _onDeleteConfiguracion(event, emit));
      on<SelectConfiguracion>(
          (event, emit) => _onSelectConfiguracion(event, emit));*/
  }
  void _onGetConfiguracion(event, emit) async {
    emit(ConfiguracionDtoLoading());
    final ConfiguracionDto? configuracionDto = await rep.getConfiguracion(
        idProgramacionJuego: event.idProgramacionJuego);

    if (configuracionDto == null) {
      emit(ConfiguracionDtoError('No se ha podido cargar la configuracion'));
    } else {
      emit(ConfiguracionDtoLoaded(configuracionDto));
    }
  }
}
