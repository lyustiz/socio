import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:socio/blocs/auditoria_configuracion/auditoria_configuracion_bloc.dart';
import 'package:socio/providers/dto/auditoria_configuracion_dto.dart';
import 'package:socio/utils/route_helper.dart';
import 'package:socio/screens/juego/juego_menu.dart';
import 'package:socio/widgets/layout/app_container.dart';
import 'package:socio/widgets/layout/app_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socio/blocs/items/items_bloc.dart';
import 'package:socio/utils/db/db_manager.dart';
import 'package:socio/widgets/layout/app_title_bar_variant.dart';

import 'package:socio/utils/format/format_data.dart' as Fd;

class AuditoriaConfiguracionScreen extends StatelessWidget {
  AuditoriaConfiguracionScreen({Key? key}) : super(key: key);

  late Juego juego;
  late Fd.FormatLocale fL;

  @override
  Widget build(BuildContext context) {
    juego = context.read<ItemsBloc>().state.juegoSelected.juego;
    fL = Fd.FormatLocale(locale: juego.moneda);

    return BlocProvider(
      create: (context) => AuditoriaConfiguracionBloc(),
      child:
          BlocBuilder<AuditoriaConfiguracionBloc, AuditoriaConfiguracionState>(
        builder: (context, state) {
          return AppScaffold(
              color: 'white',
              titleBar: AppTitleBarVariant(
                title: 'Configuracion Juego ${juego.idProgramacionJuego}',
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

  Widget informeHolder(
      BuildContext context, AuditoriaConfiguracionState state) {
    if (state is AuditoriaConfiguracionInitial) {
      context
          .read<AuditoriaConfiguracionBloc>()
          .add(GetAuditoriaConfiguracion(juego.idProgramacionJuego));
    }
    if (state is AuditoriaConfiguracionLoaded) {
      return Column(
        children: [Expanded(child: informeContent(context, state.auditoria))],
      );
    }
    if (state is AuditoriaConfiguracionError) {
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
      BuildContext context, List<AuditoriaConfiguracionDto> auditoria) {
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
                DataColumn(label: Text('Carton')),
                DataColumn(label: Text('Balota')),
                DataColumn(label: Text('Usuario')),
                DataColumn(label: Text('Fecha')),
              ], rows: [
                ...auditoria.map((row) {
                  return DataRow(cells: [
                    DataCell(
                        Text('${row.cartonAnterior} -> ${row.cartonNuevo}')),
                    DataCell(
                        Text('${row.balotaAnterior} -> ${row.balotaNuevo}')),
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
