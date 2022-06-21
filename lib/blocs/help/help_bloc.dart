import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socio/utils/db/db_manager.dart';
import 'package:socio/repository/help_repository.dart';

part 'help_event.dart';
part 'help_state.dart';

class HelpBloc extends Bloc<HelpEvent, HelpState> {
  HelpRepository rep = HelpRepository();

  HelpBloc() : super(HelpInitial()) {
    on<GetHelp>((event, emit) => _onGetHelp(event, emit));
  }

  void _onGetHelp(event, emit) async {
    emit(HelpLoading());
    try {
      final Help help = await rep.selectHelp(event.screen);
      emit(HelpLoaded(help));
    } catch (e) {
      emit(HelpError());
    }
  }

  dispose() {
    HelpBloc().close();
  }
}
