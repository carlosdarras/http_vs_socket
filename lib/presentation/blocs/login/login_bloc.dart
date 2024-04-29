import 'dart:async';
import 'dart:developer';

import 'package:battery_plus/battery_plus.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:http_buttery_life_poc/domain/usecase/login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this.loginUsecase) : super(LoginInitial()) {
    on<StartLoginProcess>(_onStartLoginProcess);
  }

  LoginUsecase loginUsecase;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final Battery _battery = Battery();

  BatteryState? _batteryState;
  StreamSubscription<BatteryState>? _batteryStateSubscription;

  int time = 0;
  int countOfRequest = 0;
  double batteryLevel = 0;
  String batteryStatus = '';

  void _onStartLoginProcess(
    StartLoginProcess event,
    Emitter emit,
  ) async {
    emit(StartLoginProcessLoadingState());
    final result =
        await loginUsecase.call(emailController.text, passwordController.text);
    result.fold((l) {
      log("FAIL TO LOGIN ::::: ${l.message}");
      emit(StartLoginProcessSuccessState());
    }, (r) {
      _battery.batteryState.then((state) {
        if (_batteryState == state) return;
        _batteryState = state;
        batteryStatus = _batteryState!.name;
      });
      _batteryStateSubscription =
          _battery.onBatteryStateChanged.listen((state) {
        if (_batteryState == state) return;
        _batteryState = state;

      });

      _battery.batteryLevel.then((value) {
        batteryLevel = value.toDouble();
      });
      log("SUCCESS TO LOGIN ^^^^^^^^^^^ $r");

      emit(StartLoginProcessFailState());
    });
  }
}
