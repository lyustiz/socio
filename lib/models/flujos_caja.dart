class FlujosCaja {
  final int idFlujoCaja;
  final int idProgramacionJuego;
  final double valorInicial;
  final double valorFinal;
  final double valorInicialBancos;
  final double valorFinalBancos;
  final double valorInicialSocial;
  final double valorFinalSocial;
  final String estado;

  FlujosCaja(
      {required this.idFlujoCaja,
      required this.idProgramacionJuego,
      required this.valorInicial,
      required this.valorFinal,
      required this.valorInicialBancos,
      required this.valorFinalBancos,
      required this.valorInicialSocial,
      required this.valorFinalSocial,
      required this.estado});
}
