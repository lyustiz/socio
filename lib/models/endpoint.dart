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
  'Huarquillas': 'apihuaquillas.sistemasyayudas.online',
  'Guatemala': 'apiguatemala.sistemasyayudas.online',
  'Desarrollo': 'apidesarrollo.sistemasyayudas.online',
};
