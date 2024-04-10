import 'dart:developer';

import 'package:app/features/home/domain/model/user.dart';
import 'package:app/features/home/domain/repository/home_repository.dart';
import 'package:app/util/resource/data_state.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeRepository get homeRepository => Get.find();

  final RxList<User> users = RxList([]);
  final RxBool isLoading = RxBool(true);

  @override
  void onReady() {
    super.onReady();
    getUsers();
  }

  Future<void> getUsers() async {
    final dataState = await homeRepository.getUsers();

    isLoading.value = false;

    if (dataState is DataSuccess) {
      users.value = dataState.data ?? [];
    }

    if (dataState is DataError) {
      log('123123 ${dataState.error?.type}');
    }
  }
}
