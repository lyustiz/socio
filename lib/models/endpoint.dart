class EndPoint {
  final int id;
  final String empresa;
  final String url;

  EndPoint({
    required this.id,
    required this.empresa,
    required this.url,
  });
}

Map<String, String> endpoints = {
  'Desarrollo': 'apidesarrollo.sistemasyayudas.online',
  'Florencia': 'apiflorencia.sistemasyayudas.online',
  'Guatemala': 'apiguatemala.sistemasyayudas.online',
  'Huaquillas': 'apihuaquillas.sistemasyayudas.online',
  'Ipiales': 'apiipiales.sistemasyayudas.online',
  'Pradera': 'apipradera.sistemasyayudas.online',
};

