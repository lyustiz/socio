import 'package:flutter/material.dart';
import 'package:socio/blocs/juegodetalle/juegodetalle_bloc.dart';
import 'package:socio/utils/route_helper.dart';
import 'package:socio/screens/juego/juego_menu.dart';
import 'package:socio/widgets/layout/app_container.dart';
import 'package:socio/widgets/layout/app_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socio/blocs/items/items_bloc.dart';
import 'package:socio/utils/db/db_manager.dart';
import 'package:socio/widgets/layout/app_title_bar_variant.dart';

class JuegoScreen extends StatelessWidget {
  JuegoScreen({Key? key}) : super(key: key);
  final mensaje = SnackBar(
      duration: const Duration(milliseconds: 700),
      content: Row(children: [
        const Icon(
          Icons.warning,
          color: Colors.white,
        ),
        Container(
          margin: const EdgeInsets.only(left: 6),
          child: const Text(
            'Juego Terminado',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ]),
      backgroundColor: Colors.amber,
      action: SnackBarAction(
        label: 'Aceptar',
        onPressed: () => 1,
      ));

  @override
  Widget build(BuildContext context) {
    final Juego juego = context.read<ItemsBloc>().state.juegoSelected.juego;

    return AppScaffold(
      color: 'white',
      titleBar: AppTitleBarVariant(
        title:
            'Informe Juego ${juego.idProgramacionJuego.toString().padLeft(2, '0')}',
        leading: IconButton(
            onPressed: () => navigateTo(context, 'juego_list_alt'),
            icon: const Icon(Icons.chevron_left)),
        helpScreen: 'informe',
      ),
      drawer: const JuegoMenu(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppContainer(
              variant: 'secondary',
              borderRadius: 14,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  buildJuegoDetalles(context, juego.idProgramacionJuego)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildJuegoDetalles(BuildContext context, int idJuego) {
    return BlocProvider(
      create: (context) => JuegodetalleBloc(),
      child: BlocBuilder<JuegodetalleBloc, JuegoDetalleState>(
        builder: (context, state) {
          if (state is JuegoDetalleInitial) {
            context.read<JuegodetalleBloc>().add(GetJuegoDetalle(idJuego));
          }
          return juegoDetalles(context, state);
        },
      ),
    );
  }

  Widget juegoDetalles(BuildContext context, JuegoDetalleState state) {
    if (state is JuegoDetalleLoaded) {
      var detalles = state.juegosWithDetalles;
      int vendedores = detalles.numeroVendedores;
      int cartonesAsignados = detalles.cartonesAsignados;
      int cartonesVendidos = detalles.cartonesVendidos;
      int totalCartones = detalles.totalCartones;
      int modulosAsignados = detalles.modulosAsignados;
      int modulosVendidos = detalles.modulosVendidos;
      int totalModulos = detalles.totalModulos;
      double valorCarton = detalles.juego.valorCarton;
      double valorModulo = detalles.juego.valorModulo;
      double montoTotalCarton = totalCartones * valorCarton;
      double montoTotalModulo = totalModulos * valorModulo;
      double montoTotalGeneral = montoTotalCarton * montoTotalModulo;
      double montoVendidoCarton = cartonesVendidos * valorCarton;
      double montoVendidoModulo = modulosVendidos * valorModulo;
      double montoTotalVendido = montoVendidoCarton + montoVendidoModulo;

      double porcVendidoCarton =
          totalCartones > 0 ? cartonesVendidos / totalCartones : 0;
      double porcVendidoModulo =
          totalModulos > 0 ? modulosVendidos / totalModulos : 0;
      double porcVentaCarton =
          montoTotalCarton > 0 ? montoVendidoCarton / montoTotalCarton : 0;
      double porcVentaModulo =
          montoTotalModulo > 0 ? montoVendidoModulo / montoTotalModulo : 0;
      double porcVenta =
          montoTotalGeneral > 0 ? montoTotalVendido / montoTotalGeneral : 0;
      double porcCartonesAsignados =
          totalCartones > 0 ? cartonesAsignados / totalCartones : 0;
      double porcModulosAsignados =
          totalModulos > 0 ? modulosAsignados / totalModulos : 0;

      return Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.info_outline,
              size: 35,
            ),
            title: Text(
              'Valor Carton $valorCarton',
              style: TextStyle(fontSize: 16),
            ),
            subtitle: Text('Valor Modulo $valorModulo',
                style: TextStyle(fontSize: 16)),
          ),
          ListTile(
            leading: Icon(
              Icons.groups,
              size: 35,
            ),
            title: Text('Vendedores', style: TextStyle(fontSize: 16)),
            trailing: Text(
              '$vendedores'.padLeft(2, '0'),
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.greenAccent,
                  fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.table_view,
              size: 30,
            ),
            subtitle:
                Text('Cartones Asignados  $cartonesAsignados/$totalCartones'),
            title: LinearProgressIndicator(
              color: Colors.greenAccent,
              value: (porcCartonesAsignados < 0.1 && porcCartonesAsignados > 0)
                  ? 0.01
                  : porcCartonesAsignados,
              minHeight: 13,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.table_view,
              size: 30,
            ),
            subtitle:
                Text('Cartones Vendidos  $cartonesVendidos/$totalCartones'),
            title: LinearProgressIndicator(
              color: Colors.greenAccent,
              value: (porcVendidoCarton < 0.1 && porcVendidoCarton > 0)
                  ? 0.01
                  : porcVendidoCarton,
              minHeight: 13,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.view_module,
              size: 35,
            ),
            subtitle:
                Text('Modulos Asignados  $modulosAsignados/$totalModulos'),
            title: LinearProgressIndicator(
              color: Colors.greenAccent,
              value: (porcModulosAsignados < 0.1 && porcModulosAsignados > 0)
                  ? 0.01
                  : porcModulosAsignados,
              minHeight: 13,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.view_module,
              size: 35,
            ),
            subtitle: Text('Modulos Vendidos  $modulosVendidos/$totalModulos'),
            title: LinearProgressIndicator(
              color: Colors.greenAccent,
              value: (porcVendidoModulo < 0.1 && porcVendidoModulo > 0)
                  ? 0.01
                  : porcVendidoModulo,
              minHeight: 13,
            ),
          ),
          ListTile(
            leading: Text(
              ' \$',
              style: TextStyle(fontSize: 35),
            ),
            subtitle: Text(
                'Monto Venta Cartones $montoVendidoCarton/$montoTotalCarton'),
            title: LinearProgressIndicator(
              color: Colors.greenAccent,
              value: (porcVentaCarton < 1 && porcVentaCarton > 0)
                  ? 0.01
                  : porcVentaCarton,
              minHeight: 13,
            ),
          ),
          ListTile(
            leading: Text(
              ' \$',
              style: TextStyle(fontSize: 35),
            ),
            subtitle: Text(
                'Monto Venta Modulos $montoVendidoModulo/$montoTotalModulo'),
            title: LinearProgressIndicator(
              color: Colors.greenAccent,
              value: (porcVentaModulo < 1 && porcVentaModulo > 0)
                  ? 0.01
                  : porcVentaModulo,
              minHeight: 13,
            ),
          ),
          ListTile(
            leading: Text(
              ' \$',
              style: TextStyle(fontSize: 35),
            ),
            subtitle:
                Text('Monto Total Venta $montoTotalVendido/$montoTotalGeneral'),
            title: LinearProgressIndicator(
              color: Colors.greenAccent,
              value: (porcVenta < 1 && porcVenta > 0) ? 0.01 : porcVenta,
              minHeight: 13,
            ),
          ),
        ],
      );
    }
    if (state is JuegoDetalleError) {
      return Container(
        child: Text('errror'),
      );
    }
    return LinearProgressIndicator();
  }

  Widget premiosList(context, List<Premio> juegosPremios) {
    return SizedBox(
        width: double.infinity,
        height: 200,
        child: ListView.builder(
          itemCount: juegosPremios.length,
          itemBuilder: (context, index) {
            Premio premio = juegosPremios[index];
            return itemsPremio(context, premio);
          },
        ));
  }

  Widget itemsPremio(context, premio) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ListTile(
            dense: true,
            leading: const SizedBox(
              width: 50,
            ),
            title: Text('Figura ${premio.idPlenoAutomatico}',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),
            subtitle: Text(
              '${premio.valorPremio!}',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary, fontSize: 16),
            ),
            trailing: const Icon(
              Icons.emoji_events,
              size: 40,
              color: Colors.orange,
            ),
          ),
          Positioned(
            left: -6,
            top: -7,
            child: Container(
              width: 77,
              height: 79,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).colorScheme.secondary,
                    Theme.of(context).colorScheme.secondaryVariant
                  ],
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: const Icon(
                  Icons.table_view,
                  color: Colors.white,
                  size: 45,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
