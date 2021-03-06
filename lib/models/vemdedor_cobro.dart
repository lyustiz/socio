class VendedorCobro {
  final int idVendedorCobroCarton; //": 1,
  final int idProgramacionJuego; //": 1,
  final String nombreVendedor; //": David Cespedes,
  final int totalCartones; //": 90,
  final int cartonesDevueltos; //": 0,
  final int numeroHojasEntregadas; //": 3,
  final double porcentajeComision; //": 0,
  final double totalVentas; //": 90,
  final int cartonesCortesia; //": 0,
  final double valorComision; //": 27,
  final double abonos; //": 0,
  final double totalPagado; //": 63,
  final double faltante; //": 0,
  final double totalRecibido; //": 63,
  final double gastoCortesia; //": 0,
  final double totalModulos; //": 0,
  final String estado; //A",
  final DateTime fechaHora; // "2022-06-04T14:32:42-07:; //00",
  final int idUsuario; //": 17,
  final DateTime? fechaCobroApp; //

  VendedorCobro(
      {required this.idVendedorCobroCarton,
      required this.idProgramacionJuego,
      required this.nombreVendedor,
      required this.totalCartones,
      required this.cartonesDevueltos,
      required this.numeroHojasEntregadas,
      required this.porcentajeComision,
      required this.totalVentas,
      required this.cartonesCortesia,
      required this.valorComision,
      required this.abonos,
      required this.totalPagado,
      required this.faltante,
      required this.totalRecibido,
      required this.gastoCortesia,
      required this.totalModulos,
      required this.estado,
      required this.fechaHora,
      required this.idUsuario,
      this.fechaCobroApp});
}
