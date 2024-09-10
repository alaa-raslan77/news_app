import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:news_app/bloc/observer.dart';
import 'package:permission_handler/permission_handler.dart';

import 'my_app.dart';

bool isConnected = false;
Future<bool> requestPermission() async {
  var status = await Permission.storage.request();
  return status.isGranted;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await requestPermission();
  final connectionChecker = InternetConnectionChecker();

  final subscription = connectionChecker.onStatusChange.listen(
    (InternetConnectionStatus status) {
      if (status == InternetConnectionStatus.connected) {
        isConnected = true;
        print('Connected to the internet');
      } else {
        isConnected = false;
        print('Disconnected from the internet');
      }
    },
  );

  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      startLocale: Locale('en'),
      child: myApp()));
}
