class RecaudosTotales {
  final int idRecaudoTotal;
  final int idProgramacionJuego;
  final int idUsuario;
  final double recuadoTotal;
  final String estado;
  final double valorRecaudoCalculado;
  final double diferencia;
  final int incluirGastosGenerales;
  final double gastos;
  final double ingresos;
  final double registroGastos;
  final double registroIngresos;
  final double totalGrupoSuma1;
  final double totalGrupoSuma2;

  RecaudosTotales({
    required this.idRecaudoTotal,
    required this.idProgramacionJuego,
    required this.idUsuario,
    required this.recuadoTotal,
    required this.estado,
    required this.valorRecaudoCalculado,
    required this.diferencia,
    required this.incluirGastosGenerales,
    required this.gastos,
    required this.ingresos,
    required this.registroGastos,
    required this.registroIngresos,
    required this.totalGrupoSuma1,
    required this.totalGrupoSuma2,
  });
}
