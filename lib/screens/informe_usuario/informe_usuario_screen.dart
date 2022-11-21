import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:socio/blocs/informe_usuario/informe_usuario_bloc.dart';
import 'package:socio/providers/dto/gastos_programacion_juego_dto.dart';
import 'package:socio/providers/dto/informe_caja_usuario_dto.dart';
import 'package:socio/providers/dto/ingresos_programacion_juego_dto.dart';
import 'package:socio/providers/dto/usuario_dto.dart';
import 'package:socio/providers/dto/vendedor_cobro_carton_dto.dart';
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

import 'package:socio/utils/format/format_data.dart' as Fd;

class InformeUsuarioScreen extends StatelessWidget {
  InformeUsuarioScreen({Key? key}) : super(key: key);

  late Juego juego;
  late Fd.FormatLocale fL;

  @override
  Widget build(BuildContext context) {
    juego = context.read<ItemsBloc>().state.juegoSelected.juego;
    fL = Fd.FormatLocale(locale: juego.moneda);

    return BlocProvider(
      create: (context) => InformeUsuarioBloc(),
      child: BlocBuilder<InformeUsuarioBloc, InformeUsuarioState>(
        builder: (context, state) {
          if (state is InformeUsuarioInitial) {
            context
                .read<InformeUsuarioBloc>()
                .add(GetInformeUsuario(juego.idProgramacionJuego, 3));
          }
          return DefaultTabController(
              length: 4,
              child: AppScaffold(
                  color: 'white',
                  titleBar: AppTitleBarVariant(
                    title: 'Informe Caja por Usuario',
                    leading: IconButton(
                        onPressed: () => navigateTo(context, 'juego_list_alt'),
                        icon: const Icon(Icons.chevron_left)),
                    helpScreen: null,
                  ),
                  drawer: const JuegoMenu(),
                  floatingActionButton: FloatingActionButton(
                    tooltip: 'Seleccione Usuario',
                    onPressed: () => filter(
                        context, context.read<InformeUsuarioBloc>(), state),
                    child: const Icon(
                      Icons.person,
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
                          icon: Icon(Icons.list_alt,
                              color: Theme.of(context).colorScheme.secondary)),
                      Tab(
                          icon: Icon(Icons.groups,
                              color: Theme.of(context).colorScheme.secondary)),
                      Tab(
                          icon: Icon(Icons.file_download,
                              color: Theme.of(context).colorScheme.secondary)),
                      Tab(
                          icon: Icon(Icons.file_upload,
                              color: Theme.of(context).colorScheme.secondary)),
                    ],
                  )));
        },
      ),
    );
  }

  Widget juegoInforme(BuildContext context, InformeUsuarioState state) {
    if (state is InformeUsuarioLoaded) {
      return informeContent(context, state.informe);
    }
    if (state is InformeUsuarioError) {
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

  Widget informeContent(BuildContext context, InformeCajaUsuarioDto informe) {
    return TabBarView(
      children: [
        resumenInforme(context, informe),
        relacionVendedores(context, informe),
        ingresosGenerales(context, informe),
        gastosGenerales(context, informe)
      ],
    );
  }

  Widget resumenInforme(BuildContext context, InformeCajaUsuarioDto informe) {
    return AppContainer(
        variant: 'secondary',
        child: Column(children: [
          const Text(
            'RESUMEN POR USUARIO',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(height: 15),
          Expanded(
              child: Scrollbar(
            interactive: true,
            isAlwaysShown: true,
            child: ListView(padding: const EdgeInsets.all(0), children: [
              AppInfoList(title: 'Usuario', text: informe.nombreUsuario),
              AppInfoList(
                  title: 'Total Fantante',
                  text: fL.currency(informe.totalFaltante)),
              AppInfoList(
                  title: 'Total Facturado',
                  text: fL.currency(informe.totalFacturado)),
              AppInfoList(
                  title: 'Total Recaudado',
                  text: fL.currency(informe.totalRecaudo)),
              const SizedBox(height: 15),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'Cierre de Caja',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              const SizedBox(height: 10),
              AppInfoList(
                  title: 'Entregado',
                  text: fL.currency(informe.totalEntregado)),
              AppInfoList(
                  title: 'Calculado',
                  text: fL.currency(informe.totalCalculado)),
              AppInfoList(
                  title: 'Diferencia',
                  text: fL.currency(informe.totalDiferencia)),
            ]),
          ))
        ]));
  }

  Widget relacionVendedores(
      BuildContext context, InformeCajaUsuarioDto informe) {
    List<VendedorCobrocartonDto> dataInforme =
        informe.listaVendedoresCobrocartones;
    return AppContainer(
        variant: 'secondary',
        child: Column(children: [
          const Text(
            'RELACION DE VENDEDORES',
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
                DataColumn(label: Text('Vendedor')),
                DataColumn(label: Text('T.Cartones')),
                DataColumn(label: Text('Cortesia')),
                DataColumn(label: Text('Modulos')),
                DataColumn(label: Text('C.Vendidos')),
                DataColumn(label: Text('C.Devueltos')),
                DataColumn(label: Text('%Comision')),
                DataColumn(label: Text('Comision')),
                DataColumn(label: Text('Facturado')),
                DataColumn(label: Text('Faltante')),
                DataColumn(label: Text('G.Cortesia')),
                DataColumn(label: Text('Tot.Recibido')),
              ], rows: [
                ...dataInforme.map((row) {
                  return DataRow(cells: [
                    DataCell(Text(row.nombreVendedor)),
                    DataCell(Text(fL.formatCantidad(row.totalCartones))),
                    DataCell(Text(fL.formatCantidad(row.cartonesCortesia))),
                    DataCell(Text(fL.formatCantidad(row.totalModulos))),
                    DataCell(Text(fL.formatCantidad(row.ventaTotalCartones))),
                    DataCell(Text(fL.formatCantidad(row.cartonesDevueltos))),
                    DataCell(Text(fL.percent(row.porcentajeComision))),
                    DataCell(Text(fL.currency(row.valorComision))),
                    DataCell(Text(fL.currency(row.totalVentas))),
                    DataCell(Text(fL.currency(row.faltante))),
                    DataCell(Text(fL.currency(row.gastoCortesia))),
                    DataCell(Text(fL.currency(row.totalRecibido))),
                  ]);
                }),
                DataRow(
                    selected: true,
                    color: MaterialStateColor.resolveWith((states) {
                      return Colors.black87.withOpacity(0.2);
                    }),
                    cells: [
                      const DataCell(Text('TOTALES')),
                      DataCell(
                          Text(fL.formatCantidad(informe.sumTotalCartones))),
                      DataCell(
                          Text(fL.formatCantidad(informe.sumCartonesCortesia))),
                      DataCell(
                          Text(fL.formatCantidad(informe.sumTotalModulos))),
                      DataCell(Text(
                          fL.formatCantidad(informe.sumVentaTotalCartones))),
                      DataCell(Text(
                          fL.formatCantidad(informe.sumCartonesDevueltos))),
                      const DataCell(Text('')),
                      DataCell(Text(fL.currency(informe.sumValorComision))),
                      DataCell(Text(fL.currency(informe.sumTotalVentas))),
                      DataCell(Text(fL.currency(informe.sumFaltante))),
                      DataCell(Text(fL.currency(informe.sumGastoCortesia))),
                      DataCell(Text(fL.currency(informe.sumTotalRecibido))),
                    ])
              ]),
            ),
          ))
        ]));
  }

  Widget ingresosGenerales(
      BuildContext context, InformeCajaUsuarioDto informe) {
    List<IngresosprogramacionjuegosDto> dataInforme =
        informe.listaIngresosJuego;
    return AppContainer(
        variant: 'secondary',
        child: Column(children: [
          const Text(
            'INGRESOS DEL JUEGO',
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
                          DataCell(Text(fL.formatDate(row.fechaHora))),
                          DataCell(Text(row.nombre)),
                          DataCell(Text(row.descripcion)),
                          DataCell(Text(fL.currency(row.valor))),
                        ]);
                      }),
                    ]),
            ),
          ))
        ]));
  }

  Widget gastosGenerales(BuildContext context, InformeCajaUsuarioDto informe) {
    List<GastosprogramacionjuegosDto> dataInforme = informe.listaGastosJuego;
    return AppContainer(
        variant: 'secondary',
        child: Column(children: [
          const Text(
            'GASTOS DEL JUEGO',
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
                          DataCell(Text(fL.formatDate(row.fechaHora))),
                          DataCell(Text(row.nombre)),
                          DataCell(Text(row.descripcion)),
                          DataCell(Text(fL.currency(row.valor))),
                        ]);
                      }),
                    ]),
            ),
          ))
        ]));
  }

  void filter(BuildContext context, InformeUsuarioBloc iuBloc,
      InformeUsuarioState state) async {
    List<DropdownMenuItem<int>>? usersItems;
    int idUsuario = 0;
    int idProgramacionJuego = juego.idProgramacionJuego;

    if (state is InformeUsuarioLoaded) {
      usersItems = state.informe.listaUsuarios
          .map<DropdownMenuItem<int>>((UsuarioDto u) {
        return DropdownMenuItem<int>(
          value: u.idUsuario,
          child: Text(u.nombreCompleto),
        );
      }).toList();
      idUsuario = state.informe.idUsuario;
    }
    List<Widget> content = [
      DropdownButton<int>(
        value: idUsuario,
        elevation: 16,
        underline: Container(
          height: 2,
        ),
        onChanged: (int? idUsuario) {
          _onSelectUsuario(
              context, idProgramacionJuego, idUsuario ?? 3, iuBloc);
        },
        items: usersItems,
      )
    ];

    appFilters(context, 'Seleccione Usuario', content);
  }

  void _onSelectUsuario(context, int idProgramacionJuego, int idUsuario,
      InformeUsuarioBloc iuBloc) {
    iuBloc.add(GetInformeUsuario(idProgramacionJuego, idUsuario));
    Navigator.pop(context);
  }
}
