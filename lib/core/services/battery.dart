// // Import package
// import 'package:battery/battery_info.dart';
// import 'package:battery_info/model/android_battery_info.dart';
// import 'package:battery_info/enums/charging_status.dart';
// import 'package:battery_info/model/iso_battery_info.dart';
//
// // Access current battery health - Android
// print("Battery Health: ${(await BatteryInfoPlugin().androidBatteryInfo).health}");
//
// // Access current battery level - IOS
// print("Battery Level: ${(await BatteryInfoPlugin().iosBatteryInfo).batteryLevel}");
//
// // Calculate estimated charging time
// BatteryInfoPlugin().androidBatteryInfoStream.listen((AndroidBatteryInfo batteryInfo) {
// print("Charge time remaining: ${(batteryInfo.chargeTimeRemaining / 1000 / 60).truncate()} minutes");
// });