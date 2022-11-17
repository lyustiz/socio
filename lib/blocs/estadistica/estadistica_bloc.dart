import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socio/utils/db/db_manager.dart';

part 'estadistica_event.dart';
part 'estadistica_state.dart';

class EstadisticaBloc extends Bloc<EstadisticaEvent, EstadisticaState> {
  EstadisticaBloc() : super(EstadisticaInitial()) {
    on<GetEstadistica>((event, emit) => _onGetEstadistica(event, emit));
  }

  void _onGetEstadistica(event, emit) async {
    emit(EstadisticaLoading());
  }
}
