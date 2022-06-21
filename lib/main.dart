import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:socio/blocs/preferences/preferences_bloc.dart';
import 'package:socio/repository/preferences_repository_impl.dart';

import 'app.dart';
import 'blocs/my_bloc_observer.dart';

//database singleton
import 'package:socio/utils/db/db_init.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  // solucion a bug en llamadas asincronicas antes de llamar a runApp
  WidgetsFlutterBinding.ensureInitialized();

  await dbLocator();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  final preferencesRepository = PreferenceRepositoryImpl();
  final preferencesBloc =
      PreferencesBloc(preferencesRepository: preferencesRepository);

  preferencesBloc.stream
      .firstWhere((state) => state is PreferenceLoaded)
      .then((_) => runApp(App(
            preferencesRepository: preferencesRepository,
            preferencesBloc: preferencesBloc,
          )));

  preferencesBloc.add(LoadPreferences());
}
