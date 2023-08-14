import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socio/providers/api.dart';
import 'package:socio/providers/dto/Yapa_dto.dart';
import 'package:socio/repository/yapa_repository.dart';

part 'yapa_event.dart';
part 'yapa_state.dart';

class YapaBloc extends Bloc<YapaEvent, YapaState> {
  YapaRepository rep = YapaRepository();
  YapaBloc() : super(YapaInitial()) {
    on<GetAllYapas>((event, emit) => _onGetAllYapas(event, emit));
    on<InsertYapa>((event, emit) => _onInsertYapa(event, emit));
    on<UpdateYapa>((event, emit) => _onUpdateYapa(event, emit));
    on<DeleteYapa>((event, emit) => _onDeleteYapa(event, emit));
    on<SelectYapa>((event, emit) => _onSelectYapa(event, emit));
  }

  void _onGetAllYapas(event, emit) async {
    emit(YapaLoading());
    final List<YapaDto> yapas =
        await rep.getYapas(idProgramacionJuego: event.idProgramacionJuego);
    emit(YapasLoaded(yapas));
  }

  void _onInsertYapa(event, emit) async {
    emit(YapaLoading());
    YapaDto yapa = event.yapa;
    ResultApi respuesta = await rep.insertYapa(yapa);
    if (respuesta.success) {
      emit(YapaExito(respuesta.message));
    } else {
      emit(YapaError(respuesta.message));
    }
    final List<YapaDto> yapas =
        await rep.getYapas(idProgramacionJuego: yapa.idProgramacionJuego);
    Future.delayed(const Duration(milliseconds: 800), () {});
    emit(YapasLoaded(yapas));
  }

  void _onUpdateYapa(event, emit) async {
    emit(YapaLoading());
    YapaDto yapa = event.yapa;
    ResultApi respuesta = await rep.updateYapa(yapa);
    if (respuesta.success) {
      emit(YapaExito(respuesta.message));
    } else {
      emit(YapaError(respuesta.message));
    }
    final List<YapaDto> yapas =
        await rep.getYapas(idProgramacionJuego: yapa.idProgramacionJuego);
    Future.delayed(const Duration(milliseconds: 800), () {});
    emit(YapasLoaded(yapas));
  }

  void _onDeleteYapa(event, emit) async {
    emit(YapaLoading());
    YapaDto yapa = event.yapa;
    ResultApi respuesta = await rep.deleteYapa(yapa);
    if (respuesta.success) {
      emit(YapaExito(respuesta.message));
    } else {
      emit(YapaError(respuesta.message));
    }
    final List<YapaDto> yapas =
        await rep.getYapas(idProgramacionJuego: yapa.idProgramacionJuego);
    Future.delayed(const Duration(milliseconds: 800), () {});
    emit(YapasLoaded(yapas));
  }

  void _onSelectYapa(event, emit) async {
    emit(YapaSelected(event.yapa));
  }
}
