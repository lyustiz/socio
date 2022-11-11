import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:socio/blocs/informe_juego/informe_juego_bloc.dart';
import 'package:socio/providers/dto/figura_dto.dart';
import 'package:socio/providers/dto/informe_juego_dto.dart';
import 'package:socio/providers/dto/recaudos_totales_dto.dart';
import 'package:socio/providers/dto/vendedor_cobro_dto.dart';
import 'package:socio/utils/route_helper.dart';
import 'package:socio/screens/juego/juego_menu.dart';
import 'package:socio/widgets/layout/app_container.dart';
import 'package:socio/widgets/layout/app_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socio/blocs/items/items_bloc.dart';
import 'package:socio/utils/db/db_manager.dart';
import 'package:socio/widgets/layout/app_title_bar_variant.dart';

import 'package:socio/utils/format/format_data.dart' as Fd;

class InformeJuegoScreen extends StatelessWidget {
  InformeJuegoScreen({Key? key}) : super(key: key);

  late Juego juego;
  late Fd.FormatLocale fL;

  @override
  Widget build(BuildContext context) {
    juego = context.read<ItemsBloc>().state.juegoSelected.juego;
    fL = Fd.FormatLocale(locale: juego.moneda);

    return DefaultTabController(
        length: 3,
        child: AppScaffold(
            color: 'white',
            titleBar: AppTitleBarVariant(
              title: 'Informe Juego ${juego.idProgramacionJuego}',
              leading: IconButton(
                  onPressed: () => navigateTo(context, 'juego_list_alt'),
                  icon: const Icon(Icons.chevron_left)),
              helpScreen: 'informe',
            ),
            drawer: const JuegoMenu(),
            child: buildJuegoDetalles(context, juego.idProgramacionJuego),
            bottomNavigationBar: TabBar(
              indicatorColor: Theme.of(context).colorScheme.secondaryVariant,
              tabs: [
                Tab(
                    icon: Icon(Icons.assignment,
                        color: Theme.of(context).colorScheme.secondary)),
                Tab(
                    icon: Icon(Icons.groups,
                        color: Theme.of(context).colorScheme.secondary)),
                Tab(
                    icon: Icon(Icons.emoji_events,
                        color: Theme.of(context).colorScheme.secondary)),
              ],
            )));
  }

  Widget buildJuegoDetalles(BuildContext context, int idJuego) {
    return BlocProvider(
      create: (context) => InformeJuegoBloc(),
      child: BlocBuilder<InformeJuegoBloc, InformeJuegoState>(
        builder: (context, state) {
          if (state is InformeJuegoInitial) {
            context.read<InformeJuegoBloc>().add(GetInformeJuego(idJuego));
          }
          return juegoInforme(context, state);
        },
      ),
    );
  }

  Widget juegoInforme(BuildContext context, InformeJuegoState state) {
    if (state is InformeJuegoLoaded) {
      return informeContent(context, state.informeJuego);
    }
    if (state is InformeJuegoError) {
      return const Text('Error en Informe');
    }
    return const LinearProgressIndicator();
  }

  Widget informeContent(BuildContext context, InformeJuegoDto informe) {
    return TabBarView(
      children: [
        resumenJuego(context, informe),
        resumenVendedores(context, informe),
        resumenPremios(context, informe),
      ],
    );
  }

  Widget resumenJuego(BuildContext context, InformeJuegoDto informe) {
    double asistenciaSocial = informe.asistenciaSocial;
    double totalPremios =
        informe.figuras.fold(0, (total, figura) => total + figura.valorPremio);

    double cuentasXCobrar = informe.cuentasXCobrar;
    double totalVentas = informe.totalVentas;
    double totalRecaudos = informe.totalRecaudos;
    double faltante = informe.faltante;
    double efectivo = informe.efectivo;
    double banco = informe.banco;
    double sobrante = informe.sobrante;
    double totalGastos = informe.totalGastos;
    double resultadoFinal = informe.resultadoFinal;

    return AppContainer(
      variant: 'secondary',
      child: Column(
        children: [
          const Text(
            'RESUMEN DE JUEGO',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
              child: Scrollbar(
            interactive: true,
            isAlwaysShown: true,
            child: ListView(padding: const EdgeInsets.all(0), children: [
              infoList(title: 'Serie', text: 'Serie ${juego.serie}'),
              infoList(
                  title: 'Cartones',
                  text:
                      'Desde: ${informe.cartonInicial} al ${informe.cartonFinal}'),
              infoList(
                  title: 'Valor Carton',
                  text: fL.currency(informe.valorCarton)),
              infoList(
                  title: 'Valor Modulo',
                  text: fL.currency(informe.valorModulo)),
              infoList(title: 'Total Premios', text: fL.currency(totalPremios)),
              infoList(
                  title: 'Total Cartones', text: '${informe.totalCartones}'),
              infoList(
                  title: 'Asistencia Social',
                  text: fL.currency(asistenciaSocial)),
              infoList(
                  title: 'Cuentas X Cobrar', text: fL.currency(cuentasXCobrar)),
              infoList(title: 'Total Ventas', text: fL.currency(totalVentas)),
              infoList(
                  title: 'Total Recaudos', text: fL.currency(totalRecaudos)),
              infoList(title: 'Faltante', text: fL.currency(faltante)),
              infoList(title: 'Efectivo', text: fL.currency(efectivo)),
              infoList(title: 'Banco', text: fL.currency(banco)),
              infoList(title: 'Sobrante', text: fL.currency(sobrante)),
              infoList(title: 'Total Gastos', text: fL.currency(totalGastos)),
              const Divider(color: Colors.white, indent: 12, endIndent: 12),
              infoList(
                  title: 'Resultado Final', text: fL.currency(resultadoFinal)),
            ]),
          ))
        ],
      ),
    );
  }

  Widget resumenVendedores(BuildContext context, InformeJuegoDto informe) {
    List<VendedorCobroDto> vendedoresCobro = informe.vendedoresCobroDto;
    return AppContainer(
        variant: 'secondary',
        child: Column(children: [
          const Text(
            'INFORME VENDEDORES',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
              child: SingleChildScrollView(
            controller: ScrollController(),
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(columns: const [
                DataColumn(label: Text('Nombre')),
                DataColumn(label: Text('Cartones')),
                DataColumn(label: Text('Mod')),
                DataColumn(label: Text('C.Ctesia')),
                DataColumn(label: Text('Ventas')),
                DataColumn(label: Text('Dev')),
                DataColumn(label: Text('%Comision ')),
                DataColumn(label: Text('C.Cortesia')),
                DataColumn(label: Text('Comision')),
                DataColumn(label: Text('Venta')),
              ], rows: [
                ...vendedoresCobro.map((vc) {
                  return DataRow(cells: [
                    DataCell(Text(vc.nombreVendedor)),
                    DataCell(Text(fL.currency(vc.totalCartones))),
                    DataCell(Text(fL.currency(vc.totalModulos))),
                    DataCell(Text(fL.currency(vc.cartonesCortesia))),
                    DataCell(Text(fL.currency(vc.totalPagado))),
                    DataCell(Text(fL.currency(vc.cartonesDevueltos))),
                    DataCell(Text(fL.currency(vc.porcentajeComision))),
                    DataCell(Text(fL.currency(vc.cartonesCortesia))),
                    DataCell(Text(fL.currency(vc.porcentajeComision))),
                    DataCell(Text(fL.currency(vc.totalVentas)))
                  ]);
                })
              ]),
            ),
          ))
        ]));
  }

  Widget resumenUsuarios(BuildContext context, InformeJuegoDto informe) {
    List<RecaudosTotalesDto> recaudosTotales = informe.recaudosTotalesDTO;
    return AppContainer(
        variant: 'secondary',
        child: Column(children: [
          const Text(
            'RECAUDO POR USUARIO',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
              child: SingleChildScrollView(
            controller: ScrollController(),
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(columns: const [
                DataColumn(label: Text('Nombre Usuario')),
                DataColumn(label: Text('Ingresos')),
                DataColumn(label: Text('Gastos')),
                DataColumn(label: Text('Recaudo Total')),
                DataColumn(label: Text('Valor Recaudo Calculado')),
                DataColumn(label: Text('Diferencia')),
              ], rows: [
                ...recaudosTotales.map((row) {
                  return DataRow(cells: [
                    DataCell(Text(row.nombreUsuario)),
                    DataCell(Text(fL.currency(row.ingresos))),
                    DataCell(Text(fL.currency(row.gastos))),
                    DataCell(Text(fL.currency(row.recuadoTotal))),
                    DataCell(Text(fL.currency(row.valorRecaudoCalculado))),
                    DataCell(Text(fL.currency(row.diferencia))),
                  ]);
                })
              ]),
            ),
          ))
        ]));
  }

  Widget resumenPremios(BuildContext context, InformeJuegoDto informe) {
    List<FiguraDto> premio = informe.figuras;
    double totalValoPremios = 0;

    return AppContainer(
        variant: 'secondary',
        child: Column(children: [
          const Text(
            'REGISTRO DE PREMIOS',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
              child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(columns: const [
              DataColumn(label: Text('Figura')),
              DataColumn(label: Text('Valor Premio')),
            ], rows: [
              ...premio.map((vr) {
                totalValoPremios += vr.valorPremio;
                return DataRow(cells: [
                  DataCell(Text(vr.nombre)),
                  DataCell(Text(fL.currency(vr.valorPremio))),
                ]);
              }),
              DataRow(selected: true, cells: [
                const DataCell(Text('Total',
                    style: TextStyle(fontWeight: FontWeight.bold))),
                DataCell(Text(fL.currency(totalValoPremios),
                    style: const TextStyle(fontWeight: FontWeight.bold))),
              ])
            ]),
          ))
        ]));
  }

  Widget infoList({required String title, required String text}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 6),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: Text(
              text,
              style:
                  TextStyle(fontSize: 18, color: Colors.white.withOpacity(0.7)),
            ),
          )
        ],
      ),
    );
  }
}

class PreferenceRepository {}
