import 'package:socio/utils/db/db_manager.dart';
import 'package:socio/repository/juego_repository.dart';
import 'package:socio/utils/db/db_init.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'juego_event.dart';
part 'juego_state.dart';

class JuegoBloc extends Bloc<JuegoEvent, JuegoState> {
  JuegoRepository rep = JuegoRepository();

  JuegoBloc() : super(JuegoInitial()) {
    on<GetJuego>((event, emit) => _onGetJuego(event, emit));
    on<GetAllJuego>((event, emit) => _onGetAllJuego(event, emit));
    on<UpdateJuego>((event, emit) => _onUpdateJuego(event, emit));
    on<InsertJuego>((event, emit) => _onInsertJuego(event, emit));
    on<DeleteJuego>((event, emit) => _onDeleteJuego(event, emit));
    on<SelectJuego>((event, emit) => _onSelectJuego(event, emit));
  }

  void _onGetJuego(event, emit) async {
    emit(JuegoLoading());
    final Juego juego = await rep.selectJuego(event.juego);
    emit(JuegoLoaded(juego));
  }

  void _onGetAllJuego(event, emit) async {
    emit(JuegoLoading());
    final List<JuegosWithConfiguracion> juegosPremios =
        await db<AppDatabase>().allJuegosWithConfiguracion(event.estado);
    emit(JuegosLoaded(juegosPremios));
  }

  void _onUpdateJuego(event, emit) async {
    emit(JuegoLoading());
    await rep.upateJuego(event.juego);
    final List<JuegosWithConfiguracion> juegos =
        await db<AppDatabase>().allJuegosWithConfiguracion(event.estado);
    emit(JuegosLoaded(juegos));
  }

  void _onInsertJuego(event, emit) async {
    emit(JuegoLoading());
    await rep.insertJuego(event.juego);
    final List<JuegosWithConfiguracion> juegos =
        await db<AppDatabase>().allJuegosWithConfiguracion(event.estado);
    emit(JuegosLoaded(juegos));
  }

  void _onDeleteJuego(event, emit) async {
    emit(JuegoLoading());
    await rep.deleteJuego(event.juego);
    final List<JuegosWithConfiguracion> juegos =
        await db<AppDatabase>().allJuegosWithConfiguracion(event.estado);
    emit(JuegosLoaded(juegos));
  }

  void _onSelectJuego(event, emit) async {
    emit(JuegoSelected(event.juego));
  }
}
