import 'package:flutter/material.dart';
import 'package:socio/blocs/configuracion/configuracion_bloc.dart';
import 'package:socio/providers/dto/configuracion_dto.dart';
import 'package:socio/screens/configuracion/configuracion_form.dart';
import 'package:socio/utils/route_helper.dart';
import 'package:socio/screens/juego/juego_menu.dart';
import 'package:socio/widgets/layout/app_container.dart';
import 'package:socio/widgets/layout/app_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socio/blocs/items/items_bloc.dart';
import 'package:socio/utils/db/db_manager.dart';
import 'package:socio/widgets/layout/app_title_bar_variant.dart';
import 'package:socio/widgets/layout/app_message.dart' as Msg;

class ConfiguracionScreen extends StatelessWidget {
  ConfiguracionScreen({Key? key}) : super(key: key);

  late Juego juego;
  late JuegosWithConfiguracion juegoConfiguracion;
  late ConfiguracionDto? configuracion;

  @override
  Widget build(BuildContext context) {
    juegoConfiguracion = context.read<ItemsBloc>().state.juegoSelected;

    juego = juegoConfiguracion.juego;
    configuracion = null;
    return BlocProvider(
      create: (context) => ConfiguracionBloc(),
      child: BlocBuilder<ConfiguracionBloc, ConfiguracionState>(
        builder: (context, state) {
          if (state is ConfiguracionInitial) {
            configuracion = null;
            context
                .read<ConfiguracionBloc>()
                .add(GetConfiguracion(juego.idProgramacionJuego));
          }
          if (state is ConfiguracionLoaded) {
            configuracion = state.configuracion;
          }
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
                child: configuracionDetail(context, state)),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () =>
                  setConfiguracion(context, context.read<ItemsBloc>(), state),
              child: configuracion != null
                  ? const Icon(Icons.edit)
                  : const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }

  Widget configuracionDetail(context, ConfiguracionState configuracionState) {
    return AppContainer(
        variant: 'primary',
        borderRadius: 14,
        width: MediaQuery.of(context).size.width * 0.95,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        padding: const EdgeInsets.all(15),
        child: configuracionShow(context, configuracionState));
  }

  Widget configuracionShow(context, ConfiguracionState configuracionState) {
    if (configuracionState is ConfiguracionError) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text(
            configuracionState.mensaje,
            style: const TextStyle(color: Colors.red),
            textAlign: TextAlign.center,
          ),
        ),
        color: Colors.white,
      );
    }

    if (configuracionState is ConfiguracionLoaded) {
      if (configuracionState.configuracion.idConfiguracion < 0) {
        return const Card(
          child: Text('No se ha Creado Configuracion b'),
          color: Colors.white,
        );
      } else {
        return Column(
          children: [
            ...configuracionInfo(context, configuracionState.configuracion)
          ],
        );
      }
    }

    return const LinearProgressIndicator();
  }

  List<Widget> configuracionInfo(context, ConfiguracionDto configuracion) {
    return [
      itemData('Serie', configuracion.serie, Icons.dynamic_feed),
      itemData('Carton', '${configuracion.carton}', Icons.table_view_rounded),
      itemData('Balota', '${configuracion.balotas}', Icons.workspaces),
      itemData(
          'Ganador Multiple',
          configuracion.balotas == 76 ? 'SI' : 'NO',
          configuracion.balotas == 76
              ? Icons.check_circle
              : Icons.radio_button_unchecked),
      itemData('Fecha Modificacion', configuracion.fechaModificacion ?? '',
          Icons.calendar_today),
      itemData(
          'Reconfigurado',
          configuracion.reconfigurado == 1 ? 'SI' : 'NO',
          configuracion.reconfigurado == 1
              ? Icons.check_circle
              : Icons.radio_button_unchecked),
      (configuracion.carton == 0)
          ? itemData('Cliente', configuracion.clienteDefecto ?? '', Icons.face)
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

  void setConfiguracion(context, ItemsBloc itemsBloc,
      ConfiguracionState configuracionState) async {
    if (juego.idJuego != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(Msg.appMessage(context, 'warning', 'Juego Terminado'));
    } else {
      if (configuracionState is ConfiguracionLoaded) {
        var config =
            ConfiguracionDto.toConfiguracion(configuracionState.configuracion);

        JuegosWithConfiguracion juegoC =
            JuegosWithConfiguracion(juego: juego, configuracion: config);
        itemsBloc.add(SelectItem(tipoItem: 'juego', item: juegoC));
      }

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ConfiguracionForm()),
      );
    }
  }
}
