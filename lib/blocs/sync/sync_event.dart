part of 'sync_bloc.dart';

abstract class SyncEvent extends Equatable {
  const SyncEvent();

  @override
  List<Object> get props => [];
}

class Sincronizar extends SyncEvent {
  Sincronizar();

  @override
  List<Object> get props => [];
}

class GetAllSincronizados extends SyncEvent {
  GetAllSincronizados();

  @override
  List<Object> get props => [];
}

class FillSincronizados extends SyncEvent {
  FillSincronizados();

  @override
  List<Object> get props => [];
}

class FillOneSincronizado extends SyncEvent {
  final String table;
  FillOneSincronizado(this.table);

  @override
  List<Object> get props => [table];
}
