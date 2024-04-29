import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_buttery_life_poc/presentation/screens/login/login_view.dart';

import 'presentation/blocs/socket/socket_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SocketBloc()..add(SendEventSocket()),
      lazy: false,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const LoginView(),
      ),
    );
  }
}
