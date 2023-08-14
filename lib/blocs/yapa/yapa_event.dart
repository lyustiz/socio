part of 'yapa_bloc.dart';

abstract class YapaEvent extends Equatable {
  const YapaEvent();

  @override
  List<Object> get props => [];
}

class GetAllYapas extends YapaEvent {
  final int idProgramacionJuego;
  const GetAllYapas(this.idProgramacionJuego);

  @override
  List<Object> get props => [idProgramacionJuego];

  @override
  String toString() => 'GetAllYapas $idProgramacionJuego';
}

class UpdateYapa extends YapaEvent {
  final YapaDto yapa;
  const UpdateYapa(this.yapa);

  @override
  List<Object> get props => [yapa];

  @override
  String toString() => 'UpdateYapa';
}

class InsertYapa extends YapaEvent {
  final YapaDto yapa;
  const InsertYapa(this.yapa);

  @override
  List<Object> get props => [yapa];

  @override
  String toString() => 'InsertYapa';
}

class DeleteYapa extends YapaEvent {
  final YapaDto yapa;
  const DeleteYapa(this.yapa);

  @override
  List<Object> get props => [yapa];

  @override
  String toString() => 'DeleteYapa';
}

class SelectYapa extends YapaEvent {
  final YapaDto yapa;
  const SelectYapa(this.yapa);

  @override
  List<Object> get props => [yapa];

  @override
  String toString() => 'SelectYapa';
}
