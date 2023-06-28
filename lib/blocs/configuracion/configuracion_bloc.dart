import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socio/providers/dto/configuracion_dto.dart';
import 'package:socio/repository/configuracion_repository.dart';

part 'configuracion_event.dart';
part 'configuracion_state.dart';

class ConfiguracionBloc extends Bloc<ConfiguracionEvent, ConfiguracionState> {
  ConfiguracionRepository rep = ConfiguracionRepository();

  ConfiguracionBloc() : super(ConfiguracionInitial()) {
    on<GetConfiguracion>((event, emit) => _onGetConfiguracion(event, emit));
    on<UpdateConfiguracion>(
        (event, emit) => _onUpdateConfiguracion(event, emit));
    on<InsertConfiguracion>(
        (event, emit) => _onInsertConfiguracion(event, emit));
    on<SetConfiguracion>((event, emit) => _onSetConfiguracion(event, emit));
  }

  void _onGetConfiguracion(event, emit) async {
    emit(ConfiguracionLoading());
    final ConfiguracionDto? configuracionDto = await rep.getConfiguracion(
        idProgramacionJuego: event.idProgramacionJuego);

    if (configuracionDto == null) {
      emit(ConfiguracionError('No se ha creado configuracion'));
    } else {
      emit(ConfiguracionLoaded(configuracionDto));
    }
  }

  void _onUpdateConfiguracion(event, emit) async {
    emit(ConfiguracionLoading());
    ConfiguracionDto configuracion = event.configuracion;
    bool isUpdated = await rep.updateConfiguracion(configuracion);
    if (isUpdated) {
      emit(ConfiguracionExito(
          'Registro Actualizado', configuracion.idConfiguracion));
    } else {
      emit(const ConfiguracionError('Registro no Acualizado'));
    }
  }

  void _onSetConfiguracion(event, emit) async {
    emit(ConfiguracionLoading());
    ConfiguracionDto configuracion = event.configuracion;
    emit(ConfiguracionLoaded(configuracion));
  }

  void _onInsertConfiguracion(event, emit) async {
    emit(ConfiguracionLoading());
    final ConfiguracionDto configuracion = event.configuracion;
    int idConfiguracion = await rep.insertConfiguracion(configuracion);
    if (idConfiguracion == 0) {
      emit(ConfiguracionError('Error al configurar Juego'));
    } else {
      emit(ConfiguracionExito(
        'Registro Creado',
        configuracion.idConfiguracion,
      ));
    }
  }

  void _onSelectConfiguracion(event, emit) async {
    emit(ConfiguracionSelected(event.configuracion));
  }
}
