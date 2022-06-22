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

class InformeJuegoScreen extends StatelessWidget {
  InformeJuegoScreen({Key? key}) : super(key: key);

  late Juego juego;

  @override
  Widget build(BuildContext context) {
    juego = context.read<ItemsBloc>().state.juegoSelected.juego;

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

  Widget informeContent(BuildContext context, InformeJuegoDto informeJuego) {
    return TabBarView(
      children: [
        resumenJuego(context, informeJuego),
        resumenVendedores(context, informeJuego),
        resumenPremios(context, informeJuego),
      ],
    );
  }

  Widget resumenJuego(BuildContext context, InformeJuegoDto informeJuego) {
    double asistenciaSocial = informeJuego.asistenciaSocial;
    double totalPremios = informeJuego.figuras
        .fold(0, (total, figura) => total + figura.valorPremio);

    double cuentasXCobrar = informeJuego.cuentasXCobrar;
    double totalVentas = informeJuego.totalVentas;
    double totalRecaudos = informeJuego.totalRecaudos;
    double faltante = informeJuego.faltante;
    double efectivo = informeJuego.efectivo;
    double banco = informeJuego.banco;
    double sobrante = informeJuego.sobrante;
    double totalGastos = informeJuego.totalGastos;
    double resultadoFinal = informeJuego.resultadoFinal;

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
                      'Desde: ${informeJuego.cartonInicial} al ${informeJuego.cartonFinal}'),
              infoList(
                  title: 'Valor Carton', text: '${informeJuego.valorCarton}'),
              infoList(
                  title: 'Valor Modulo', text: '${informeJuego.valorModulo}'),
              infoList(title: 'Total Premios', text: '$totalPremios'),
              infoList(
                  title: 'Total Cartones',
                  text: '${informeJuego.totalCartones}'),
              infoList(title: 'Asistenacia Social', text: '$asistenciaSocial'),
              infoList(title: 'Cuentas X Cobrar', text: '$cuentasXCobrar'),
              infoList(title: 'Total Ventas', text: '$totalVentas'),
              infoList(title: 'Total Recaudos', text: '$totalRecaudos'),
              infoList(title: 'Faltante', text: '$faltante'),
              infoList(title: 'Efectivo', text: '$efectivo'),
              infoList(title: 'Banco', text: '$banco'),
              infoList(title: 'Sobrante', text: '$sobrante'),
              infoList(title: 'Total Gastos', text: '$totalGastos'),
              const Divider(color: Colors.white, indent: 12, endIndent: 12),
              infoList(title: 'Resultado Final', text: '$resultadoFinal'),
            ]),
          ))
        ],
      ),
    );
  }

  Widget resumenVendedores(BuildContext context, InformeJuegoDto informeJuego) {
    List<VendedorCobroDto> vendedoresCobro = informeJuego.vendedoresCobroDto;
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
                    DataCell(Text('${vc.totalCartones}')),
                    DataCell(Text('${vc.totalModulos}')),
                    DataCell(Text('${vc.cartonesCortesia}')),
                    DataCell(Text('${vc.totalPagado}')),
                    DataCell(Text('${vc.cartonesDevueltos}')),
                    DataCell(Text('${vc.porcentajeComision}')),
                    DataCell(Text('${vc.cartonesCortesia}')),
                    DataCell(Text('${vc.porcentajeComision}')),
                    DataCell(Text('${vc.totalVentas}'))
                  ]);
                })
              ]),
            ),
          ))
        ]));
  }

  Widget resumenUsuarios(BuildContext context, InformeJuegoDto informeJuego) {
    List<RecaudosTotalesDto> recaudosTotales = informeJuego.recaudosTotalesDTO;
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
                    DataCell(Text('${row.ingresos}')),
                    DataCell(Text('${row.gastos}')),
                    DataCell(Text('${row.recuadoTotal}')),
                    DataCell(Text('${row.valorRecaudoCalculado}')),
                    DataCell(Text('${row.diferencia}')),
                  ]);
                })
              ]),
            ),
          ))
        ]));
  }

  Widget resumenPremios(BuildContext context, InformeJuegoDto informeJuego) {
    List<FiguraDto> premio = informeJuego.figuras;
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
                  DataCell(Text('${vr.valorPremio}')),
                ]);
              }),
              DataRow(selected: true, cells: [
                const DataCell(Text('Total',
                    style: TextStyle(fontWeight: FontWeight.bold))),
                DataCell(Text('$totalValoPremios',
                    style: const TextStyle(fontWeight: FontWeight.bold))),
              ])
            ]),
          ))
        ]));
  }

  Widget infoList({required String title, required String text}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
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
