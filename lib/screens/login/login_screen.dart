import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socio/blocs/auth/auth_bloc.dart';
import 'package:socio/blocs/preferences/preferences_bloc.dart';
import 'package:socio/models/endpoint.dart';
import 'package:socio/utils/route_helper.dart';
import 'package:socio/widgets/layout/app_scaffold.dart';
import 'package:socio/widgets/layout/logo.dart';
import 'package:socio/screens/login/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(buildWhen: (previous, current) {
      final bool logged = (current is AuthLogged);
      if (logged) navigateTo(context, 'home');
      return !logged;
    }, builder: (context, state) {
      return AppScaffold(
        color: 'purple',
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () => pushScreen(context, 'setup'),
                        icon: const Icon(Icons.settings)),
                  ],
                ),
                const Logo(
                  titulo: 'Bingo JL',
                  fontSize: 22,
                ),
                Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    alignment: Alignment.center,
                    height: 18,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: BlocBuilder<PreferencesBloc, PreferencesState>(
                      builder: (context, state) {
                        EndPoint endpoint = EndPoint(0, '', '');

                        if (state is PreferenceLoaded) {
                          endpoint = endpoints
                              .firstWhere((ep) => ep.url == state.endpoint);
                        }
                        return ListTile(
                          dense: true,
                          leading: const Icon(
                            Icons.apartment_rounded,
                            size: 32,
                          ),
                          title: Text(
                            endpoint.nombre,
                            style: const TextStyle(fontSize: 16),
                          ),
                          subtitle: Text(endpoint.url,
                              overflow: TextOverflow.ellipsis),
                        );
                      },
                    )),
                const SizedBox(
                  height: 5,
                ),
                LoginForm(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () => navigateTo(context, 'condiciones'),
          child: Container(
            height: 35,
            padding: const EdgeInsets.all(3),
            alignment: Alignment.center,
            child: const Text(
              'Términos y condiciones de uso',
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
          ),
        ),
      );
    });
  }
}
