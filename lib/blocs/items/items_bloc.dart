import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socio/utils/db/db_manager.dart';

part 'items_event.dart';
part 'items_state.dart';

class ItemsBloc extends Bloc<ItemsEvent, ItemsState> {
  ItemsBloc() : super(ItemsState.initial()) {
    on<SelectItem>((event, emit) => _onSelectItem(event, emit));
  }

  void _onSelectItem(event, emit) {
    final String tipo = event.tipoItem;
    final item = event.item;

    if (tipo == 'juego') {
      emit(state.copyWhith(juegoSelected: item));
    }

    if (tipo == 'terminado') {
      emit(state.copyWhith(terminado: item));
    }

    if (tipo == 'vendido') {
      emit(state.copyWhith(vendido: item));
    }
  }
}
