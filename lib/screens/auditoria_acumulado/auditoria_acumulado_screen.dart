import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:socio/blocs/auditoria_acumulado/auditoria_acumulado_bloc.dart';
import 'package:socio/providers/dto/auditoria_acumulado_dto.dart';
import 'package:socio/utils/route_helper.dart';
import 'package:socio/screens/juego/juego_menu.dart';
import 'package:socio/widgets/layout/app_container.dart';
import 'package:socio/widgets/layout/app_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socio/blocs/items/items_bloc.dart';
import 'package:socio/utils/db/db_manager.dart';
import 'package:socio/widgets/layout/app_title_bar_variant.dart';

import 'package:socio/utils/format/format_data.dart' as Fd;

class AuditoriaAcumuladoScreen extends StatelessWidget {
  AuditoriaAcumuladoScreen({Key? key}) : super(key: key);

  late Juego juego;
  late Fd.FormatLocale fL;

  @override
  Widget build(BuildContext context) {
    juego = context.read<ItemsBloc>().state.juegoSelected.juego;
    fL = Fd.FormatLocale(locale: juego.moneda);

    return BlocProvider(
      create: (context) => AuditoriaAcumuladoBloc(),
      child: BlocBuilder<AuditoriaAcumuladoBloc, AuditoriaAcumuladoState>(
        builder: (context, state) {
          return AppScaffold(
              color: 'white',
              titleBar: AppTitleBarVariant(
                title: 'Acumulado Juego ${juego.idProgramacionJuego}',
                leading: IconButton(
                    onPressed: () => navigateTo(context, 'juego_list'),
                    icon: const Icon(Icons.chevron_left)),
                helpScreen: null,
              ),
              drawer: const JuegoMenu(),
              child: informeHolder(context, state));
        },
      ),
    );
  }

  Widget informeHolder(BuildContext context, AuditoriaAcumuladoState state) {
    if (state is AuditoriaAcumuladoInitial) {
      context
          .read<AuditoriaAcumuladoBloc>()
          .add(GetAuditoriaAcumulado(juego.idProgramacionJuego));
    }
    if (state is AuditoriaAcumuladoLoaded) {
      return Column(
        children: [Expanded(child: informeContent(context, state.auditoria))],
      );
    }
    if (state is AuditoriaAcumuladoError) {
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
      BuildContext context, List<AuditoriaAcumuladoDto> auditoria) {
    return AppContainer(
        variant: 'secondary',
        child: Column(children: [
          const SizedBox(height: 10),
          Expanded(
              child: SingleChildScrollView(
            controller: ScrollController(),
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(columns: const [
                DataColumn(label: Text('Figura')),
                DataColumn(label: Text('Acum')),
                DataColumn(label: Text('Mult')),
                DataColumn(label: Text('Carton')),
                DataColumn(label: Text('Usuario')),
                DataColumn(label: Text('Fecha')),
              ], rows: [
                ...auditoria.map((row) {
                  return DataRow(cells: [
                    DataCell(Text(row.figura)),
                    DataCell(Text(row.acumula)),
                    DataCell(Text(row.multiple)),
                    DataCell(
                        Text('${row.cartonAnterior} -> ${row.cartonNuevo}')),
                    DataCell(Text(row.usuario)),
                    DataCell(Text(Fd.formatDateTime(row.fechaAuditoria))),
                  ]);
                }),
              ]),
            ),
          ))
        ]));
  }
}
