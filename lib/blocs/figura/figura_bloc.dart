import 'package:socio/providers/api.dart';
import 'package:socio/providers/dto/figura_dto.dart';
import 'package:socio/utils/db/db_manager.dart';
import 'package:socio/repository/figura_repository.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'figura_event.dart';
part 'figura_state.dart';

class FiguraBloc extends Bloc<FiguraEvent, FiguraState> {
  FiguraRepository rep = FiguraRepository();
  FiguraBloc() : super(FiguraInitial()) {
    on<GetFigura>((event, emit) => _onGetFigura(event, emit));
    on<GetAllFiguras>((event, emit) => _onGetAllFiguras(event, emit));
    on<UpdateFigura>((event, emit) => _onUpdateFigura(event, emit));
    on<UpdateFiguraMultiple>(
        (event, emit) => _onUpdateFiguraMultiple(event, emit));
    on<SetFigura>((event, emit) => _onSetFigura(event, emit));
  }

  void _onGetFigura(event, emit) async {
    emit(FiguraLoading());
    final Figura figura = await rep.selectfigura(event.idFigura);
    emit(FiguraLoaded(FiguraDto.fromFigura(figura)));
  }

  void _onGetAllFiguras(event, emit) async {
    emit(FiguraLoading());
    final List<FiguraDto> figuras =
        await rep.selectfiguras(event.idProgramacionJuego);
    emit(FigurasLoaded(figuras));
  }

  void _onUpdateFigura(event, emit) async {
    emit(FiguraLoading());
    FiguraDto figura = event.figura;
    ResultApi respuesta = await rep.updateFigura(figura);
    if (respuesta.success) {
      emit(FiguraExito(respuesta.message));
    } else {
      emit(FiguraError(respuesta.message));
    }
    final List<FiguraDto> figuras =
        await rep.selectfiguras(event.idProgramacionJuego);
    Future.delayed(const Duration(milliseconds: 800), () {});
    emit(FigurasLoaded(figuras));
  }

  void _onUpdateFiguraMultiple(event, emit) async {
    emit(FiguraLoading());
    FiguraDto figura = event.figura;
    ResultApi respuesta = await rep.updateFiguraMultple(figura);
    if (respuesta.success) {
      emit(FiguraExito(respuesta.message));
    } else {
      emit(FiguraError(respuesta.message));
    }
    final List<FiguraDto> figuras =
        await rep.selectfiguras(event.idProgramacionJuego);
    Future.delayed(const Duration(milliseconds: 800), () {});
    emit(FigurasLoaded(figuras));
  }

  void _onSetFigura(event, emit) async {
    emit(FiguraLoaded(event.figura));
  }
}
