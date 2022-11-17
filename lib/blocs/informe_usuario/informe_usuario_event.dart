part of 'informe_usuario_bloc.dart';

abstract class InformeUsuarioEvent extends Equatable {
  const InformeUsuarioEvent();

  @override
  List<Object> get props => [];
}

class GetInformeUsuario extends InformeUsuarioEvent {
  final int idProgramacionJuego;
  final int idUsuario;

  const GetInformeUsuario(this.idProgramacionJuego, this.idUsuario);

  @override
  List<Object> get props => [idProgramacionJuego, idUsuario];

  @override
  String toString() =>
      'GetInformeUsuario idJuego $idProgramacionJuego $idUsuario ';
}

class SelectInformeUsuario extends InformeUsuarioEvent {
  final InformeCajaUsuarioDto informe;

  const SelectInformeUsuario(this.informe);

  @override
  List<Object> get props => [informe];

  @override
  String toString() => 'SelectInformeUsuario';
}
