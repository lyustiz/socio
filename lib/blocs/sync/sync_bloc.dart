import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_builder_validators/localization/intl/messages_de.dart';
import 'package:socio/repository/sincronizar_repository.dart';
import 'package:socio/utils/db/db_manager.dart';

part 'sync_event.dart';
part 'sync_state.dart';

class SyncBloc extends Bloc<SyncEvent, SyncState> {
  SincronizarRepository rep = SincronizarRepository();

  SyncBloc() : super(SyncInitial()) {
    on<Sincronizar>((event, emit) => _onSincronizar(event, emit));
    on<GetAllSincronizados>(
        (event, emit) => _onGetAllSincronizados(event, emit));
  }

  void _onSincronizar(event, emit) async {
    try {
      emit(const SyncLoading('inicio sincronizacion...', {}));
      emit(const SyncLoading('Sincronizando Juegos...', {}));
      await rep.sincronizarJuego();
    } catch (errorMessage) {
      emit(SyncError(mensaje: errorMessage.toString()));
    }
    final List<Sincronizado> items = await rep.getAllSincronizados();
    emit(SyncLoaded(items: items));
  }

  void _onGetAllSincronizados(event, emit) async {
    emit(const SyncLoading('', {}));
    final List<Sincronizado> items = await rep.getAllSincronizados();
    emit(SyncLoaded(items: items));
  }
}
