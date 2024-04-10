import 'package:app/config/database/app_database.dart';
import 'package:app/config/http/api_service.dart';
import 'package:app/config/http/dio_interceptor.dart';
import 'package:app/util/const/constants.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static Future<void> inject() async {
    _injectDatabase();
    _injectApiService();
  }

  static Future<void> _injectDatabase() async {
    final database = await $FloorAppDatabase
        .databaseBuilder(Constants.databaseName)
        .build();

    Get.putAsync(() async => database.userDao, permanent: true);
  }

  static Future<void> _injectApiService() async {
    Dio mDio = Dio();
    mDio.interceptors.add(DioInterceptor());

    Get.putAsync(() async => ApiService(mDio), permanent: true);
  }
}
