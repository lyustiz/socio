import 'package:flutter/material.dart' hide Theme;
import 'package:socio/models/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//lenguage
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
// repository
import 'package:socio/repository/preferences_repository.dart';
// blocs
import 'package:socio/blocs/preferences/preferences_bloc.dart';
import 'package:socio/blocs/auth/auth_bloc.dart';
import 'package:socio/blocs/juego/juego_bloc.dart';
import 'package:socio/blocs/items/items_bloc.dart';
import 'package:socio/blocs/sync/sync_bloc.dart';
//theme
import 'theme.data.dart';
//rutes
import 'package:socio/routes/routes.dart';

class App extends StatelessWidget {
  final PreferencesRepository preferencesRepository;
  final PreferencesBloc preferencesBloc;

  const App(
      {Key? key,
      required this.preferencesRepository,
      required this.preferencesBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<PreferencesRepository>.value(
              value: preferencesRepository),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<PreferencesBloc>.value(value: preferencesBloc),
            BlocProvider<AuthBloc>(
              create: (BuildContext context) => AuthBloc(),
            ),
            BlocProvider<JuegoBloc>(
              create: (BuildContext context) => JuegoBloc(),
            ),
            BlocProvider<ItemsBloc>(
              create: (BuildContext context) => ItemsBloc(),
            ),
            BlocProvider<AuthBloc>(
              create: (BuildContext context) => AuthBloc(),
            ),
            BlocProvider<SyncBloc>(
              create: (BuildContext context) => SyncBloc(),
            ),
          ],
          child: BlocBuilder<PreferencesBloc, PreferencesState>(
            builder: (context, themeState) {
              return BlocBuilder<AuthBloc, AuthState>(
                builder: (context, authState) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    theme: themesData[Theme.dark],
                    title: 'Socio',
                    initialRoute: 'login',
                    routes: appRoutes,
                    onUnknownRoute: (settings) {
                      return MaterialPageRoute<void>(
                        settings: settings,
                        builder: appRoutes['home']!,
                      );
                    },
                    onGenerateRoute: (settings) =>
                        _getRoute(settings, authState),
                    supportedLocales: const [
                      Locale('en'),
                      Locale('es'),
                    ],
                    localizationsDelegates: const [
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      FormBuilderLocalizations.delegate,
                    ],
                  );
                },
              );
            },
          ),
        ));
  }

  Route<dynamic> _getRoute(RouteSettings settings, AuthState authState) {
    if (authState is! AuthLogged) {
      if (settings.name != 'login') {
        return MaterialPageRoute<void>(
          settings: settings,
          builder: appRoutes['login']!,
        );
      }
    }

    if (appRoutes[settings.name] == null) {
      return MaterialPageRoute<void>(
        settings: settings,
        builder: appRoutes['home']!,
      );
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: appRoutes[settings.name]!,
    );
  }
}
