import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:socio/blocs/informe_mensual/informe_mensual_bloc.dart';
import 'package:socio/providers/dto/gastos_generales_dto.dart';
import 'package:socio/providers/dto/informe_mensual_dto.dart';
import 'package:socio/providers/dto/ingresos_generales_dto.dart';
import 'package:socio/providers/dto/resumen_juego_dto.dart';
import 'package:socio/providers/dto/socio_porcentaje_dto.dart';
import 'package:socio/utils/route_helper.dart';
import 'package:socio/screens/juego/juego_menu.dart';
import 'package:socio/widgets/layout/app_container.dart';
import 'package:socio/widgets/layout/app_filters.dart';
import 'package:socio/widgets/layout/app_info_list.dart';
import 'package:socio/widgets/layout/app_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socio/blocs/items/items_bloc.dart';
import 'package:socio/utils/db/db_manager.dart';
import 'package:socio/widgets/layout/app_title_bar_variant.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart' as dp;

import 'package:socio/utils/format/format_data.dart' as Fd;

class InformeMensualScreen extends StatelessWidget {
  InformeMensualScreen({Key? key}) : super(key: key);

  late Juego juego;
  late Fd.FormatLocale fL;
  DateTime currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    juego = context.read<ItemsBloc>().state.juegoSelected.juego;
    fL = Fd.FormatLocale(locale: juego.moneda);

    return BlocProvider(
      create: (context) => InformeMensualBloc(),
      child: BlocBuilder<InformeMensualBloc, InformeMensualState>(
        builder: (context, state) {
          if (state is InformeMensualInitial) {
            int year = currentDate.year;
            int month = currentDate.month;
            context
                .read<InformeMensualBloc>()
                .add(GetInformeMensual(year, month));
          }
          return DefaultTabController(
              length: 5,
              child: AppScaffold(
                  color: 'white',
                  titleBar: AppTitleBarVariant(
                    title: 'Informe Mensual',
                    leading: IconButton(
                        onPressed: () => navigateTo(context, 'juego_list_alt'),
                        icon: const Icon(Icons.chevron_left)),
                    helpScreen: null,
                  ),
                  drawer: const JuegoMenu(),
                  floatingActionButton: FloatingActionButton(
                    tooltip: 'Seleccione Mes',
                    onPressed: () => filter(
                        context, context.read<InformeMensualBloc>(), state),
                    child: const Icon(
                      Icons.calendar_today,
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
                          icon: Icon(Icons.calendar_today,
                              color: Theme.of(context).colorScheme.secondary)),
                      Tab(
                          icon: Icon(Icons.list_alt,
                              color: Theme.of(context).colorScheme.secondary)),
                      Tab(
                          icon: Icon(Icons.file_download,
                              color: Theme.of(context).colorScheme.secondary)),
                      Tab(
                          icon: Icon(Icons.file_upload,
                              color: Theme.of(context).colorScheme.secondary)),
                      Tab(
                          icon: Icon(Icons.groups,
                              color: Theme.of(context).colorScheme.secondary)),
                    ],
                  )));
        },
      ),
    );
  }

  Widget juegoInforme(BuildContext context, InformeMensualState state) {
    if (state is InformeMensualLoaded) {
      return informeContent(context, state.informe);
    }
    if (state is InformeMensualError) {
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

  Widget informeContent(BuildContext context, InformeMensualDto informe) {
    return Column(children: [
      Expanded(
        child: TabBarView(
          children: [
            resumenMensual(context, informe),
            resumenJuegos(context, informe),
            ingresosGenerales(context, informe),
            gastosGenerales(context, informe),
            porcentajesSocios(context, informe),
          ],
        ),
      )
    ]);
  }

  Widget resumenMensual(BuildContext context, InformeMensualDto informe) {
    DateTime fdesde = DateTime.parse('${informe.anio}${informe.mes}01');
    DateTime fhasta = DateTime.parse('${informe.anio}${informe.mes + 1}01')
        .add(const Duration(days: -1));
    return AppContainer(
        variant: 'secondary',
        child: Column(children: [
          const Text(
            'RESUMEN MENSUAL',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
              child: Scrollbar(
            interactive: true,
            isAlwaysShown: true,
            child: ListView(padding: const EdgeInsets.all(0), children: [
              AppInfoList(
                  title: 'Fecha Desde/Hasta',
                  text: '${fL.formatDate(fdesde)} - ${fL.formatDate(fhasta)}'),
              AppInfoList(
                  title: 'Utilidad Neta',
                  text: fL.currency(informe.utilidadNeta)),
              AppInfoList(
                  title: 'Ingresos', text: fL.currency(informe.totalIngresos)),
              AppInfoList(
                  title: 'Gastos', text: fL.currency(informe.totalGastos)),
              AppInfoList(
                  title: 'Aporte Social',
                  text: fL.currency(informe.totalAporteSocial)),
              AppInfoList(
                  title: 'Utilidad Final',
                  text: fL.currency(informe.totalUtilidadFinal)),
              AppInfoList(
                  title: 'Socios', text: fL.currency(informe.totalSocios)),
              AppInfoList(
                  title: 'Efectivo', text: fL.currency(informe.totalEfectivo)),
              AppInfoList(
                  title: 'Banco', text: fL.currency(informe.totalBancos)),
              AppInfoList(
                  title: 'Diferencia',
                  text: fL.currency(informe.totalDiferencia)),
            ]),
          ))
        ]));
  }

  Widget resumenJuegos(BuildContext context, InformeMensualDto informe) {
    List<ResumenJuegoDto> dataInforme = informe.listaResumenJuegos;
    return AppContainer(
        variant: 'secondary',
        child: Column(children: [
          const Text(
            'Relacion de Juegos',
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
                DataColumn(label: Text('Juego')),
                DataColumn(label: Text('Fecha')),
                DataColumn(label: Text('Val.Carton')),
                DataColumn(label: Text('Val.Modulo')),
                DataColumn(label: Text('Tot.Premios')),
                DataColumn(label: Text('Serie')),
                DataColumn(label: Text('C.Inicial')),
                DataColumn(label: Text('C.Final')),
                DataColumn(label: Text('A.Social')),
                DataColumn(label: Text('C.Vendidos')),
                DataColumn(label: Text('Tot.Ventas')),
                DataColumn(label: Text('Comisión')),
                DataColumn(label: Text('Ingresos')),
                DataColumn(label: Text('Gastos')),
                DataColumn(label: Text('Benef.Neto')),
              ], rows: [
                ...dataInforme.map((row) {
                  return DataRow(cells: [
                    DataCell(Text('${row.idProgramacionJuego}')),
                    DataCell(Text(fL.formatDate(row.fechaProgramada))),
                    DataCell(Text(fL.currency(row.valorCarton))),
                    DataCell(Text(fL.currency(row.valorModulo))),
                    DataCell(Text(fL.currency(row.totalPremios))),
                    DataCell(Text(row.serie)),
                    DataCell(Text(fL.formatCantidad(row.cartonInicial))),
                    DataCell(Text(fL.formatCantidad(row.cartonFinal))),
                    DataCell(Text(fL.currency(row.asistenciaSocial))),
                    DataCell(
                        Text(fL.formatCantidad(row.cartonesVendidos.toInt()))),
                    DataCell(Text(fL.currency(row.ventasTotales))),
                    DataCell(Text(fL.currency(row.comision))),
                    DataCell(Text(fL.currency(row.ingresos))),
                    DataCell(Text(fL.currency(row.gastos))),
                    DataCell(Text(fL.currency(row.beneficioNeto))),
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
                      const DataCell(Text('')),
                      const DataCell(Text('')),
                      DataCell(Text(fL.currency(informe.sumTotalPremios))),
                      const DataCell(Text('')),
                      const DataCell(Text('')),
                      const DataCell(Text('')),
                      DataCell(Text(fL.currency(informe.sumAsistenciaSocial))),
                      const DataCell(Text('')),
                      DataCell(Text(fL.currency(informe.sumVentasTotales))),
                      DataCell(Text(fL.currency(informe.sumComision))),
                      DataCell(Text(fL.currency(informe.sumIngresos))),
                      DataCell(Text(fL.currency(informe.sumGastos))),
                      DataCell(Text(fL.currency(informe.sumBeneficioNeto))),
                    ])
              ]),
            ),
          ))
        ]));
  }

  Widget ingresosGenerales(BuildContext context, InformeMensualDto informe) {
    List<IngresosGeneralesDto> dataInforme = informe.listaIngresosGenerales;
    return AppContainer(
        variant: 'secondary',
        child: Column(children: [
          const Text(
            'Resumen de Ingresos Generales',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
              child: SingleChildScrollView(
            controller: ScrollController(),
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: dataInforme.isEmpty
                  ? const Text('Sin Informacion')
                  : DataTable(columns: const [
                      DataColumn(label: Text('Fecha')),
                      DataColumn(label: Text('Concepto')),
                      DataColumn(label: Text('Descripcion')),
                      DataColumn(label: Text('Valor')),
                    ], rows: [
                      ...dataInforme.map((row) {
                        return DataRow(cells: [
                          DataCell(Text(fL.formatDate(row.fechaRegistro))),
                          DataCell(Text(row.nombre)),
                          DataCell(Text(row.descripcion)),
                          DataCell(Text(fL.currency(row.valor))),
                        ]);
                      }),
                      DataRow(
                          selected: true,
                          color: MaterialStateColor.resolveWith((states) {
                            return Colors.black87.withOpacity(0.2);
                          }),
                          cells: [
                            const DataCell(Text('TOTAL')),
                            const DataCell(Text('')),
                            const DataCell(Text('')),
                            DataCell(Text(fL.currency(informe.sumIngresos))),
                          ])
                    ]),
            ),
          ))
        ]));
  }

  Widget gastosGenerales(BuildContext context, InformeMensualDto informe) {
    List<GastosGeneralesDto> dataInforme = informe.listaGastosGenerales;
    return AppContainer(
        variant: 'secondary',
        child: Column(children: [
          const Text(
            'Resumen de Gastos Generales',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
              child: SingleChildScrollView(
            controller: ScrollController(),
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: dataInforme.isEmpty
                  ? const Text('Sin Informacion')
                  : DataTable(columns: const [
                      DataColumn(label: Text('Fecha')),
                      DataColumn(label: Text('Concepto')),
                      DataColumn(label: Text('Descripcion')),
                      DataColumn(label: Text('Valor')),
                    ], rows: [
                      ...dataInforme.map((row) {
                        return DataRow(cells: [
                          DataCell(Text(fL.formatDate(row.fechaRegistro))),
                          DataCell(Text(row.descripcion)),
                          DataCell(Text(row.descripcion)),
                          DataCell(Text(fL.currency(row.valor))),
                        ]);
                      }),
                      DataRow(
                          selected: true,
                          color: MaterialStateColor.resolveWith((states) {
                            return Colors.black87.withOpacity(0.2);
                          }),
                          cells: [
                            const DataCell(Text('TOTAL')),
                            const DataCell(Text('')),
                            const DataCell(Text('')),
                            DataCell(Text(fL.currency(informe.sumGastos))),
                          ])
                    ]),
            ),
          ))
        ]));
  }

  Widget porcentajesSocios(BuildContext context, InformeMensualDto informe) {
    List<SocioPorcentajeDto> dataInforme = informe.listaSocioPorcentaje;
    return AppContainer(
        variant: 'secondary',
        child: Column(children: [
          const Text(
            'Porcentajes por Socio',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
              child: SingleChildScrollView(
            controller: ScrollController(),
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: dataInforme.isEmpty
                  ? const Text('Sin Informacion')
                  : DataTable(columns: const [
                      DataColumn(label: Text('Nombre Completo')),
                      DataColumn(label: Text('Porcentaje')),
                      DataColumn(label: Text('Monto')),
                      DataColumn(label: Text('Anticipo')),
                      DataColumn(label: Text('Total')),
                    ], rows: [
                      ...dataInforme.map((row) {
                        return DataRow(cells: [
                          DataCell(Text(row.nombreCompleto)),
                          DataCell(Text(fL.percent(row.procentaje))),
                          DataCell(Text(fL.currency(row.monto))),
                          DataCell(Text(fL.currency(row.anticipos))),
                          DataCell(Text(fL.currency(row.total))),
                        ]);
                      }),
                    ]),
            ),
          ))
        ]));
  }

  void filter(BuildContext context, InformeMensualBloc imBloc,
      InformeMensualState state) async {
    int currentYear = currentDate.year;
    int firstYear = currentYear - 1;

    if (state is InformeMensualLoaded) {
      currentDate = DateTime(state.informe.anio, state.informe.mes, 1);
    }

    List<Widget> content = [
      dp.MonthPicker.single(
        selectedDate: currentDate,
        onChanged: (newDate) => _onSelectedfecha(context, newDate, imBloc),
        firstDate: DateTime(firstYear),
        lastDate: DateTime.now(),
      ),
    ];

    appFilters(context, 'Seleccione Mes', content);
  }

  void _onSelectedfecha(context, DateTime newDate, InformeMensualBloc imBloc) {
    int year = newDate.year;
    int month = newDate.month;
    imBloc.add(GetInformeMensual(year, month));
    Navigator.pop(context);
  }
}
