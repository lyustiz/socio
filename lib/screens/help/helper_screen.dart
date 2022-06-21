import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socio/blocs/help/help_bloc.dart';
import 'package:socio/widgets/layout/app_container.dart';
import 'package:socio/widgets/layout/app_icon.dart';
import 'package:socio/widgets/layout/app_scaffold.dart';
import 'package:socio/widgets/layout/app_title_bar_variant.dart';
import 'package:socio/widgets/layout/help_icon.dart';
import 'package:socio/utils/db/db_manager.dart';
import 'package:socio/models/iconos.dart' as ico;

class HelperScreen extends StatelessWidget {
  final String? screen;
  const HelperScreen({Key? key, this.screen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      color: 'purple',
      titleBar: AppTitleBarVariant(
        color: 'white',
        title: 'Ayuda $screen',
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.chevron_left,
              color: Theme.of(context).colorScheme.primary,
            )),
      ),
      child: BlocProvider(
        create: (context) => HelpBloc(),
        child: BlocBuilder<HelpBloc, HelpState>(
          builder: (context, state) {
            if (state is HelpInitial) {
              context.read<HelpBloc>().add(GetHelp(screen!));
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  if (state is HelpLoaded)
                    AppContainer(
                        child: Column(
                      children: [
                        ListTile(
                          leading: const HelpIcon(radius: 40),
                          title: Text('$screen'.toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 2),
                          child: Text(
                            state.help.texto,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              fontSize: 16,
                              shadows: [
                                Shadow(
                                  offset: Offset(0.1, 0.1),
                                  blurRadius: 3.0,
                                  color: Color.fromARGB(200, 0, 0, 0),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            ...state.help.items
                                .map((e) => itemContainer(context, e))
                          ],
                        )
                      ],
                    ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget itemContainer(context, HelpItem helpItem) {
    Map<String, Color> itemColor = {
      'info': Theme.of(context).colorScheme.secondary,
      'warning': Colors.amber,
      'success': Colors.green,
      'error': Colors.redAccent
    };

    return Stack(
      children: [
        AppContainer(
          variant: 'secondary',
          margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
          padding:
              const EdgeInsets.only(top: 8, bottom: 10, left: 50, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${helpItem.titulo}:',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
              Text(helpItem.texto, textAlign: TextAlign.justify),
            ],
          ),
        ),
        Positioned(
            left: 8,
            top: 12,
            child: AppIcon(
              icon: ico.iconData[helpItem.icono] ?? ico.iconData['warning']!,
              color: itemColor[helpItem.tipo]!,
            ))
      ],
    );
  }
}
