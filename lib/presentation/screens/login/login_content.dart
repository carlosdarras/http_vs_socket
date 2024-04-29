import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_buttery_life_poc/presentation/blocs/login/login_bloc.dart';

class LoginContent extends StatefulWidget {
  const LoginContent({super.key});

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<LoginBloc>();
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
      children: [
        const Text(
          'Welcome to HTTP Request POC',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
            "in this POC we are gonna to check the Battery Performance when using HTTP request with background services"),
        const SizedBox(
          height: 30,
        ),
        const Text("Email"),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: TextEditingController(),
          decoration: InputDecoration(
            hintText: "Email",
            filled: true,
            fillColor: const Color(0xFFF1F2F6),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Text("Password"),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: TextEditingController(),
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            hintText: "password",
            filled: true,
            fillColor: const Color(0xFFF1F2F6),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        ElevatedButton(
          onPressed: () {
            int d = 0;
            Timer.periodic(const Duration(seconds: 15), (timer) {
              d += 15;
              if (d == 900) {
                timer.cancel();
              } else {
                context.read<LoginBloc>().add(StartLoginProcess());
              }
            });
            // context.read<SocketBloc>().add(SendEventSocket());
          },
          child: const Text("Login"),
        ),
        const Text(
          'Current battery state:',
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 8),
        Text(
          bloc.batteryStatus,
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 8),
        Text(
          bloc.batteryStatus,
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 8),
        Text(
          '${bloc.batteryLevel}',
          style: const TextStyle(fontSize: 24),
        ),
      ],
    );
  }
}
