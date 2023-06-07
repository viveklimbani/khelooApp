import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_route.gr.dart';
import '../feature/session/session.dart';
import '../repositories/base_repository.dart';
import '../webservice/DioSettings.dart';

GetIt getIt = GetIt.instance;

Future<void> getServices() async {
  /// Async packages
  var preferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(preferences);
  getIt.registerSingleton<Session>(Session());


  ///Sync packages
  getIt.registerFactory(() => Connectivity());
  var dio = Dio();
  var logger = Logger();
  getIt.registerSingleton(dio);
  getIt.registerSingleton(logger);
  getIt.registerSingleton<AppRouter>(AppRouter());

  /// Repositories
  getIt.registerFactory<BaseRepository>(() => BaseRepository());


  /// Init custom DIO settings for network calls
  DioSettings(dio: dio, logger: logger, preferences: preferences);
}
