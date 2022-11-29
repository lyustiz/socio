import 'package:socio/utils/db/db_manager.dart';
import 'package:socio/repository/configuracion_repository.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'configuracion_event.dart';
part 'configuracion_state.dart';

class ConfiguracionBloc extends Bloc<ConfiguracionEvent, ConfiguracionState> {
  ConfiguracionRepository rep = ConfiguracionRepository();
  AppDatabase db = AppDatabase();

  ConfiguracionBloc() : super(ConfiguracionInitial()) {
    on<ConfiguracionEvent>((event, emit) {
      on<GetConfiguracion>((event, emit) => _onGetConfiguracion(event, emit));
      on<UpdateConfiguracion>(
          (event, emit) => _onUpdateConfiguracion(event, emit));
      on<InsertConfiguracion>(
          (event, emit) => _onInsertConfiguracion(event, emit));
      on<DeleteConfiguracion>(
          (event, emit) => _onDeleteConfiguracion(event, emit));
      on<SelectConfiguracion>(
          (event, emit) => _onSelectConfiguracion(event, emit));
      on<SetConfiguracion>((event, emit) => _onSetConfiguracion(event, emit));
    });
  }

  void _onGetConfiguracion(event, emit) async {
    emit(ConfiguracionLoading());
    final Configuracion configuracion =
        await rep.selectConfiguracion(event.Configuracion);
    emit(ConfiguracionLoaded(configuracion));
  }

  void _onUpdateConfiguracion(event, emit) async {
    emit(ConfiguracionLoading());
    Configuracion configuracion = event.configuracion;
    bool isUpdated = await rep.updateConfiguracion(configuracion);
    if (isUpdated) {
      emit(ConfiguracionExito(
          'Registro Actualizado', configuracion.idConfiguracion));
    } else {
      emit(ConfiguracionError('Registro no Acualizado'));
    }
  }

  void _onSetConfiguracion(event, emit) async {
    Configuracion configuracion = event.configuracion;
    emit(ConfiguracionLoaded(configuracion));
  }

  void _onInsertConfiguracion(event, emit) async {
    emit(ConfiguracionLoading());
    final Configuracion configuracion = event.configuracion;
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

  void _onDeleteConfiguracion(event, emit) async {
    emit(ConfiguracionLoading());
    await rep.deleteConfiguracion(event.configuracion);
    final Configuracion configuracion =
        await rep.selectConfiguracion(event.terminado); //todo revisar
    emit(ConfiguracionLoaded(configuracion));
  }

  void _onSelectConfiguracion(event, emit) async {
    emit(ConfiguracionSelected(event.configuracion));
  }
}
