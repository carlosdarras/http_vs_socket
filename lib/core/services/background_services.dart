import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

class BackgroundServices {
  final service = FlutterBackgroundService();
  Future<void> initializeService() async {
    final service = FlutterBackgroundService();

    await service.configure(
      androidConfiguration: AndroidConfiguration(
        onStart: onStart,
        autoStart: false,
        isForegroundMode: true,
        // notificationChannelId: 'my_foreground',
        // initialNotificationContent: 'running',
        foregroundServiceNotificationId: 888,
      ),
      iosConfiguration: IosConfiguration(
        autoStart: true,
        onForeground: onStart,
        onBackground: onIosBackground,
      ),
    );
  }
}

@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  print('the bllslslslslslsl ${service}');
  WidgetsFlutterBinding.ensureInitialized();
  // DartPluginRegistrant.ensureInitialized();
  return true;
}
@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  print('Services dkdkdk ${service}');
  // DartPluginRegistrant.ensureInitialized();
  // if (service is AndroidServiceInstance) {
  //   service.on('setAsForeground').listen((event) {
  //     service.setAsForegroundService();
  //   });
  //   service.on('setAsBackground').listen((event) {
  //     service.setAsBackgroundService();
  //   });
  // }
  // service.on('stopService').listen((event) {
  //   service.stopSelf();
  // });


  // // bring to foreground
  Timer.periodic(const Duration(seconds: 1), (timer) async {
    print(' we inii ii ii ${timer}');
    // if (service is AndroidServiceInstance) {
    //   if (await service.isForegroundService()) {
    //
    //   }
    // }
  });
}