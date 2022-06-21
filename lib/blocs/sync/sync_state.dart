part of 'sync_bloc.dart';

const initialItems = {'juegos': false, 'cartones': false, 'clientes': false};

abstract class SyncState extends Equatable {
  const SyncState();

  @override
  List<Object> get props => [];
}

class SyncInitial extends SyncState {
  SyncInitial();

  @override
  List<Object> get props => [];
}

class SyncLoaded extends SyncState {
  final List<Sincronizado> items;

  SyncLoaded({required this.items});

  @override
  List<Object> get props => [items];

  @override
  String toString() => 'SyncLoaded { items: $items }';
}

class SyncLoading extends SyncState {
  final String message;
  final Map<String, int> progress;
  const SyncLoading(this.message, this.progress);
  @override
  List<Object> get props => [message, progress];

  @override
  String toString() {
    return 'SyncLoading  message: $message $progress';
  }
}

class SyncFinished extends SyncState {
  final List<Sincronizado> sincronizados;
  SyncFinished({required this.sincronizados});

  @override
  List<Object> get props => [sincronizados];
}

class SyncFilled extends SyncState {
  final bool isFilled;
  SyncFilled({required this.isFilled});

  @override
  List<Object> get props => [isFilled];
}

class SyncError extends SyncState {
  final String mensaje;
  SyncError({required this.mensaje});

  @override
  List<Object> get props => [mensaje];
}
