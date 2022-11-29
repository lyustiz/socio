import 'package:flutter/material.dart';
import 'package:socio/utils/route_helper.dart';
import 'package:socio/screens/juego/juego_menu.dart';
import 'package:socio/widgets/layout/app_container.dart';
import 'package:socio/widgets/layout/app_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socio/blocs/items/items_bloc.dart';
import 'package:socio/utils/db/db_manager.dart';
import 'package:socio/widgets/layout/app_title_bar_variant.dart';
import 'package:socio/utils/format/format_data.dart' as ft;
import 'package:socio/widgets/layout/app_message.dart' as Msg;

class ConfiguracionScreen extends StatelessWidget {
  ConfiguracionScreen({Key? key}) : super(key: key);

  late Juego juego;

  @override
  Widget build(BuildContext context) {
    final JuegosWithConfiguracion juegoConfiguracion =
        context.read<ItemsBloc>().state.juegoSelected;

    juego = juegoConfiguracion.juego;
    final Configuracion? configuracion = juegoConfiguracion.configuracion;
    final bool hasConfiguracion = configuracion != null;

    return AppScaffold(
      color: 'white',
      titleBar: AppTitleBarVariant(
        title: 'Juego ${juego.idProgramacionJuego}',
        leading: IconButton(
            onPressed: () => navigateTo(context, 'juego_list'),
            icon: const Icon(Icons.chevron_left)),
        helpScreen: 'configuracion',
      ),
      drawer: const JuegoMenu(),
      child: SingleChildScrollView(
          child: configuracionDetail(context, configuracion)),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () => setConfiguracion(context),
        child:
            hasConfiguracion ? const Icon(Icons.edit) : const Icon(Icons.add),
      ),
    );
  }

  Widget configuracionDetail(context, Configuracion? configuracion) {
    return AppContainer(
        variant: 'primary',
        borderRadius: 14,
        width: MediaQuery.of(context).size.width * 0.95,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        padding: const EdgeInsets.all(15),
        child: Column(
          children: (configuracion == null)
              ? [const Text('No se ha Creado Configuracion')]
              : [...configuracionInfo(context, configuracion)],
        ));
  }

  List<Widget> configuracionInfo(context, Configuracion configuracion) {
    return [
      itemData('Serie', '${configuracion.serie}', Icons.dynamic_feed),
      itemData('Carton', '${configuracion.carton}', Icons.table_view_rounded),
      itemData('Balota', '${configuracion.balotas}', Icons.workspaces),
      itemData(
          'Fecha Modificacion',
          ft.formatDateTime(configuracion.fechaModificacion ?? DateTime.now()),
          Icons.calendar_today),
      itemData(
          'Reconfigurado',
          configuracion.reconfigurado ? 'SI' : 'NO',
          configuracion.reconfigurado
              ? Icons.check_circle
              : Icons.radio_button_unchecked),
      (configuracion.carton == 0)
          ? itemData('Cliente', '${configuracion.clienteDefecto}', Icons.face)
          : const Text(''),
    ];
  }

  Widget itemData(String title, String data, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(top: 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.white),
      child: ListTile(
        selected: true,
        dense: true,
        focusColor: Colors.amber,
        minLeadingWidth: 0,
        leading: Icon(
          icon,
          color: Colors.blue,
          size: 34,
        ),
        title: Text(
          title,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        subtitle: Text(data, style: const TextStyle(fontSize: 18)),
      ),
    );
  }

  void setConfiguracion(context) async {
    if (juego.idJuego != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(Msg.appMessage(context, 'warning', 'Juego Terminado'));
    } else {
      pushScreen(context, 'configuracion_form');
    }
  }
}
