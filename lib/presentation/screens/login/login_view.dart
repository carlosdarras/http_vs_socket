import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_buttery_life_poc/core/services/service_locator.dart';
import 'package:http_buttery_life_poc/domain/usecase/login_usecase.dart';
import 'package:http_buttery_life_poc/presentation/blocs/login/login_bloc.dart';
import 'package:http_buttery_life_poc/presentation/blocs/socket/socket_bloc.dart';
import 'package:http_buttery_life_poc/presentation/screens/login/login_content.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: context.read<SocketBloc>().channel.stream,
        builder: (context, snapshot) {
          return BlocProvider(
            create: (context) => LoginBloc(sl<LoginUsecase>()),
            child: const Scaffold(
              body: LoginContent(),
            ),
          );
        });
  }
}
