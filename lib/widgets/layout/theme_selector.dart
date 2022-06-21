import 'package:flutter/material.dart' hide Theme;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socio/models/theme.dart';
import 'package:socio/blocs/preferences/preferences_bloc.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      builder: (context, state) {
        if (state is PreferenceLoaded) {
          return IconButton(
            color: Colors.white,
            icon: Icon(state.theme == Theme.ligth
                ? Icons.dark_mode
                : Icons.light_mode),
            onPressed: () {
              BlocProvider.of<PreferencesBloc>(context).add(UpdateTheme(
                  (state.theme == Theme.ligth) ? Theme.dark : Theme.ligth));
            },
          );
        } else {
          return Icon(Icons.light_mode_sharp);
        }
      },
    );
  }
}
