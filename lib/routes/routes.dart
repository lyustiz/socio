import 'package:flutter/material.dart';
import 'package:socio/screens/auditoria_acumulado/auditoria_acumulado_screen.dart';
import 'package:socio/screens/auditoria_configuracion/auditoria_configuracion_screen.dart';
import 'package:socio/screens/configuracion/configuracion_form.dart';
import 'package:socio/screens/configuracion/configuracion_screen.dart';
import 'package:socio/screens/endpoint/endpoint_screen.dart';
import 'package:socio/screens/estadistica/estadistica_screen.dart';
import 'package:socio/screens/figuras/figura_screen.dart';
import 'package:socio/screens/informe_juego/informe_juego_screen.dart';
import 'package:socio/screens/informe_mensual/informe_mensual_screen.dart';
import 'package:socio/screens/informe_usuario/informe_usuario_screen.dart';
import 'package:socio/screens/informe_venta/informe_venta_screen.dart';
import 'package:socio/screens/juego/juego_list_screen_alt.dart';
import 'package:socio/screens/login/login_screen.dart';
import 'package:socio/screens/recover/recover_screen.dart';
import 'package:socio/screens/home/home_screen.dart';
import 'package:socio/screens/setup/setup_screen.dart';
import 'package:socio/screens/sync/sync_screen.dart';
import 'package:socio/screens/juego/juego_list_screen.dart';
import 'package:socio/screens/juego/juego_screen.dart';
import 'package:socio/screens/condiciones/condiciones_screen.dart';
import 'package:socio/screens/help/helper_screen.dart';
import 'package:socio/screens/help/helper_global.dart';
import 'package:socio/screens/cuenta/cuenta_screen.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'login': (_) => const LoginScreen(),
  'recover': (_) => RecoverScreen(),
  'setup': (_) => const SetupScreen(),
  'endpoint': (_) => const EndpointScreen(),
  'home': (_) => const HomeScreen(),
  'sincronizar': (_) => SyncScreen(),
  'juego': (_) => JuegoScreen(),
  'juego_list': (_) => JuegoListScreen(),
  'juego_list_alt': (_) => JuegoListScreenAlt(),
  'informe_juego': (_) => InformeJuegoScreen(),
  'informe_mensual': (_) => InformeMensualScreen(),
  'informe_usuario': (_) => InformeUsuarioScreen(),
  'informe_venta': (_) => InformeVentaScreen(),
  'configuracion': (_) => ConfiguracionScreen(),
  'configuracion_form': (_) => ConfiguracionForm(),
  'figura': (_) => FiguraScreen(),
  'auditoria_acumulado': (_) => AuditoriaAcumuladoScreen(),
  'auditoria_configuracion': (_) => AuditoriaConfiguracionScreen(),
  'estadistica': (_) => EstadisticaScreen(),
  'condiciones': (_) => const CondicionesScreen(),
  'helper_screen': (_) => const HelperScreen(),
  'helper': (_) => const HelperGlobal(),
  'cuenta': (_) => const CuentaScreen(),
};
