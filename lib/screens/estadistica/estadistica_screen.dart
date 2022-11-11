import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socio/blocs/estadistica/estadistica_bloc.dart';
import 'package:socio/blocs/items/items_bloc.dart';
import 'package:socio/screens/estadistica/widgets/pie_chart.dart';
import 'package:socio/utils/db/db_manager.dart';

import 'package:socio/utils/route_helper.dart';
import 'package:socio/widgets/layout/app_scaffold.dart';
import 'package:socio/widgets/layout/app_title_bar_variant.dart';

import 'package:socio/utils/format/format_data.dart' as Fd;

class EstadisticaScreen extends StatelessWidget {
  EstadisticaScreen({Key? key}) : super(key: key);

  late Fd.FormatLocale fL;

  @override
  Widget build(BuildContext context) {
    Juego juego = context.read<ItemsBloc>().state.juegoSelected.juego;
    fL = Fd.FormatLocale(locale: juego.moneda);
    return BlocProvider(
      create: (context) => EstadisticaBloc(),
      child: AppScaffold(
          color: 'white',
          titleBar: AppTitleBarVariant(
            title: 'Estadisticas',
            leading: IconButton(
                onPressed: () => navigateTo(context, 'juego'),
                icon: Icon(Icons.chevron_left)),
          ),
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Theme.of(context).colorScheme.primaryVariant,
                    Theme.of(context).colorScheme.primary,
                  ],
                ),
              ),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white),
                    child: Text(
                        'Estadisticas Juego ${juego.idProgramacionJuego}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.primary)),
                  ),
                  BlocBuilder<EstadisticaBloc, EstadisticaState>(
                    builder: (context, state) {
                      if (state is EstadisticaInitial) {
                        context
                            .read<EstadisticaBloc>()
                            .add(GetEstadistica(juego.idProgramacionJuego));
                      }
                      return Container(
                          child: (state is EstadisticaLoaded)
                              ? listEstadisticas(context, state)
                              : LinearProgressIndicator());
                    },
                  ),
                ],
              ))),
    );
  }

  Widget listEstadisticas(context, EstadisticaLoaded estadisticaState) {
    Estadistica est = estadisticaState.estadistica;
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                chartContainer(
                  context,
                  title: 'Cartones Vendidos',
                  chart: PieChart(
                    radio: 90,
                    value: est.ventaCartones,
                    total: est.totalCartones,
                    colorValue: Theme.of(context).colorScheme.secondaryVariant,
                    colorTotal: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                chartContainer(
                  context,
                  title: 'Modulos Vendidos',
                  chart: PieChart(
                    radio: 90,
                    value: est.ventaModulos,
                    total: est.totalModulos,
                    colorValue: Theme.of(context).colorScheme.secondaryVariant,
                    colorTotal: Theme.of(context).colorScheme.secondary,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              title: const Text(
                'Total Venta Cartones',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text(
                'Valor Carton ${fL.currency(est.valorCarton)}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary),
              ),
              trailing: Text(fL.currency(est.totalVentaCartones),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
            ListTile(
              title: Text('Total Venta Modulos',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              subtitle: Text(
                'Valor Modulo ${fL.currency(est.valorModulo)}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary),
              ),
              trailing: Text('${fL.currency(est.totalVentaModulos)}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            )
          ],
        ),
      ),
    );
  }

  Widget chartContainer(context,
      {required String title, required Widget chart}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.40,
      margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 1),
      padding: EdgeInsets.only(top: 14, bottom: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Colors.white),
      child: Column(
        children: [
          chart,
          const SizedBox(
            height: 15,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18, color: Theme.of(context).colorScheme.secondary),
          ),
        ],
      ),
    );
  }
}
