import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http_buttery_life_poc/core/services/background_services.dart';

import 'app.dart';
import 'core/services/dio_helper.dart';
import 'core/services/service_locator.dart';
import 'core/utils/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServicesLocator().init();
  await DioHelper.init();
  await BackgroundServices().initializeService();

  Bloc.observer = MyBlocObserver();
  runApp(const App());
}
