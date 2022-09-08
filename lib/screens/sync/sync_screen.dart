import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socio/blocs/sync/sync_bloc.dart';
import 'package:socio/screens/sync/widgets/sync_button.dart';
import 'package:socio/utils/route_helper.dart';
import 'package:socio/widgets/layout/app_scaffold.dart';
import 'package:socio/widgets/layout/app_title_bar_variant.dart';
import 'package:socio/utils/db/db_manager.dart';
import './sync_menu.dart';
import 'package:socio/utils/format/format_data.dart' as FT;

class SyncScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        titleBar: AppTitleBarVariant(
          title: "Sincronizacion",
          leading: IconButton(
              onPressed: () => navigateTo(context, 'home'),
              icon: Icon(Icons.chevron_left)),
          helpScreen: 'Sincronizar',
        ),
        drawer: SyncMenu(),
        child: BlocBuilder<SyncBloc, SyncState>(
          builder: (context, stateSync) {
            if (stateSync is SyncInitial) {
              context.read<SyncBloc>().add(GetAllSincronizados());
            }
            return Container(
                margin: EdgeInsets.only(top: 6),
                padding: EdgeInsets.symmetric(horizontal: 12),
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 4),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  margin: EdgeInsets.all(8),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (stateSync is SyncFinished) {
                              return null;
                            }
                            return sincronizar(
                                context, context.read<SyncBloc>());
                          },
                          child: SyncButton(),
                        ),
                        if (stateSync is SyncLoaded)
                          listSync(context, stateSync),
                        if (stateSync is SyncLoading)
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                Text(stateSync.message,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary)),
                                LinearProgressIndicator(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryVariant,
                                )
                              ],
                            ),
                          )
                      ],
                    ),
                  ),
                ));
          },
        ));
  }

  Widget listSync(BuildContext context, SyncState syncState) {
    List<Sincronizado> items = (syncState is SyncLoaded) ? syncState.items : [];
    return Expanded(
      child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            Sincronizado item = items[index];
            return ListTile(
                dense: true,
                leading: Icon(
                  Icons.change_circle_outlined,
                  color: Theme.of(context).colorScheme.secondaryVariant,
                  size: 40,
                ),
                title: Text('${item.tabla}'.toUpperCase(),
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16)),
                subtitle: Text(
                  '${FT.formatDateTime(item.fechaSincronizado)}',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                trailing: itemState(syncState, item));
          }),
    );
  }

  Widget itemState(SyncState syncState, Sincronizado item) {
    if (syncState is SyncLoading) {
      return CircularProgressIndicator(
        color: Colors.purple,
      );
    }

    if (syncState is SyncFinished) {
      return Icon(
        Icons.check,
        color: Colors.green,
      );
    }

    bool isInDate = item.isSync;

    return Icon(
      (isInDate) ? Icons.check : Icons.warning_amber,
      color: (isInDate) ? Colors.green : Colors.amber,
    );
  }

  sincronizar(BuildContext context, SyncBloc syncBloc) {
    syncBloc.add(Sincronizar());
  }
}
