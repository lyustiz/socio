import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';
import 'package:intl/intl.dart';
import 'package:socio/blocs/informe_venta/informe_venta_bloc.dart';
import 'package:socio/providers/dto/informe_promedio_ventas_dto.dart';
import 'package:socio/providers/dto/vendedores_promedio_ventas_dto.dart';
import 'package:socio/screens/informe_venta/venta_chart.dart';
import 'package:socio/utils/route_helper.dart';
import 'package:socio/screens/juego/juego_menu.dart';
import 'package:socio/widgets/layout/app_container.dart';
import 'package:socio/widgets/layout/app_info_list.dart';
import 'package:socio/widgets/layout/app_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socio/blocs/items/items_bloc.dart';
import 'package:socio/utils/db/db_manager.dart';
import 'package:socio/widgets/layout/app_title_bar_variant.dart';

import 'package:socio/utils/format/format_data.dart' as Fd;

class InformeVentaScreen extends StatelessWidget {
  InformeVentaScreen({Key? key}) : super(key: key);

  late Juego juego;
  late Fd.FormatLocale fL;

  @override
  Widget build(BuildContext context) {
    juego = context.read<ItemsBloc>().state.juegoSelected.juego;
    fL = Fd.FormatLocale(locale: juego.moneda);

    return BlocProvider(
      create: (context) => InformeVentaBloc(),
      child: BlocBuilder<InformeVentaBloc, InformeVentaState>(
        builder: (context, state) {
          if (state is InformeVentaInitial) {
            List<String> rango = getDefaulRange();
            String fechaIni = rango.first;
            String fechaFin = rango.last;
            context
                .read<InformeVentaBloc>()
                .add(GetInformeVenta(fechaIni, fechaFin));
          }
          return DefaultTabController(
              length: 2,
              child: AppScaffold(
                  color: 'white',
                  titleBar: AppTitleBarVariant(
                    title: 'Promedio Ventas',
                    leading: IconButton(
                        onPressed: () => navigateTo(context, 'juego_list_alt'),
                        icon: const Icon(Icons.chevron_left)),
                    helpScreen: null,
                  ),
                  drawer: const JuegoMenu(),
                  floatingActionButton: FloatingActionButton(
                    tooltip: 'Seleccione Rango',
                    onPressed: () => filter(
                        context, context.read<InformeVentaBloc>(), state),
                    child: const Icon(
                      Icons.date_range,
                      size: 28,
                    ),
                    backgroundColor: Colors.amber,
                    mini: true,
                  ),
                  child: juegoInforme(context, state),
                  bottomNavigationBar: TabBar(
                    indicatorColor:
                        Theme.of(context).colorScheme.secondaryVariant,
                    tabs: [
                      Tab(
                          icon: Icon(Icons.groups,
                              color: Theme.of(context).colorScheme.secondary)),
                      Tab(
                          icon: Icon(Icons.insert_chart,
                              color: Theme.of(context).colorScheme.secondary)),
                    ],
                  )));
        },
      ),
    );
  }

  Widget juegoInforme(BuildContext context, InformeVentaState state) {
    if (state is InformeVentaLoaded) {
      DateTime fini = state.informe.fechaInicial;
      DateTime ffin = state.informe.fechaFinal;
      return Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: AppInfoList(
                title: 'Fecha Desde/Hasta',
                text: '${fL.formatDate(fini)} - ${fL.formatDate(ffin)}'),
          ),
          Expanded(child: informeContent(context, state.informe))
        ],
      );
    }
    if (state is InformeVentaError) {
      return Container(
        alignment: Alignment.center,
        child: Text(
          state.errorMsj,
          style: const TextStyle(color: Colors.red),
        ),
      );
    }
    return const LinearProgressIndicator();
  }

  Widget informeContent(
      BuildContext context, InformePromedioVentasDto informe) {
    return TabBarView(
      children: [
        relacionVendedores(context, informe),
        VentaChart(informe.listaVendedoresPromedioVentas),
      ],
    );
  }

  Widget relacionVendedores(
      BuildContext context, InformePromedioVentasDto informe) {
    List<VendedoresPromedioVentasDto> dataInforme =
        informe.listaVendedoresPromedioVentas;
    int lugar = 0;
    return AppContainer(
        variant: 'secondary',
        child: Column(children: [
          const Text(
            'TOP VENDEDORES',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
              child: SingleChildScrollView(
            controller: ScrollController(),
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(columns: const [
                DataColumn(label: Text('Nro')),
                DataColumn(label: Text('Vendedor')),
                DataColumn(label: Text('T.Cartones')),
                DataColumn(label: Text('C.Devueltos')),
                DataColumn(label: Text('C.Cortesia')),
                DataColumn(label: Text('C.Vendidos')),
                DataColumn(label: Text('Tot.Venta')),
                DataColumn(label: Text('Tot.Comision')),
                DataColumn(label: Text('Tot.Pagado')),
              ], rows: [
                ...dataInforme.map((row) {
                  lugar++;
                  return DataRow(cells: [
                    DataCell(Text('$lugar')),
                    DataCell(Text(row.nombreCompleto)),
                    DataCell(Text(fL.formatCantidad(row.totalCartones))),
                    DataCell(Text(fL.formatCantidad(row.cartonesDevueltos))),
                    DataCell(Text(fL.formatCantidad(row.cartonesCortesia))),
                    DataCell(Text(fL.formatCantidad(row.cartonesVendidos))),
                    DataCell(Text(fL.currency(row.totalVentas))),
                    DataCell(Text(fL.currency(row.totalComision))),
                    DataCell(Text(fL.currency(row.totalPagado))),
                  ]);
                }),
                DataRow(
                    selected: true,
                    color: MaterialStateColor.resolveWith((states) {
                      return Colors.black87.withOpacity(0.2);
                    }),
                    cells: [
                      const DataCell(Text('')),
                      const DataCell(Text('TOTALES')),
                      DataCell(
                          Text(fL.formatCantidad(informe.sumTotalCartones))),
                      DataCell(Text(
                          fL.formatCantidad(informe.sumCartonesDevueltos))),
                      DataCell(
                          Text(fL.formatCantidad(informe.sumCartonesCortesia))),
                      DataCell(
                          Text(fL.formatCantidad(informe.sumCartonesVendidos))),
                      DataCell(Text(fL.currency(informe.sumTotalVentas))),
                      DataCell(Text(fL.currency(informe.sumTotalComision))),
                      DataCell(Text(fL.currency(informe.sumTotalPagado))),
                    ])
              ]),
            ),
          ))
        ]));
  }

  void filter(BuildContext context, InformeVentaBloc ivBloc,
      InformeVentaState state) async {
    DateTime fechaIni;
    DateTime fechaFin;

    if (state is InformeVentaLoaded) {
      fechaIni = state.informe.fechaInicial;
      fechaFin = state.informe.fechaFinal;
    } else {
      List<DateTime> rango = getDefaulDateRange();
      fechaIni = rango.first;
      fechaFin = rango.last;
    }

    DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: getDefaulDateRange().last,
      locale: const Locale('es'),
      initialDateRange: DateTimeRange(
        end: fechaFin,
        start: fechaIni,
      ),
    );
    _onSelectRango(context, picked, ivBloc);
  }

  void _onSelectRango(context, DateTimeRange? rango, InformeVentaBloc ivBloc) {
    if (rango != null) {
      String fechaIni = DateFormat('yyyy-MM-dd').format(rango.start);
      String fechaFin = DateFormat('yyyy-MM-dd').format(rango.end);
      ivBloc.add(GetInformeVenta(fechaIni, fechaFin));
    }
  }

  List<String> getDefaulRange() {
    DateTime current = DateTime.now();
    int year = current.year;
    int month = current.month;
    String fechaIni = DateFormat('yyyy-MM-dd').format(DateTime(year, month, 1));
    String fechaFin = DateFormat('yyyy-MM-dd')
        .format(DateTime(year, month + 1, 1).add(const Duration(days: -1)));

    return [fechaIni, fechaFin];
  }

  List<DateTime> getDefaulDateRange() {
    DateTime current = DateTime.now();
    int year = current.year;
    int month = current.month;
    DateTime fechaIni = DateTime(year, month, 1);
    DateTime fechaFin =
        DateTime(year, month + 1, 1).add(const Duration(days: -1));

    return [fechaIni, fechaFin];
  }
}
