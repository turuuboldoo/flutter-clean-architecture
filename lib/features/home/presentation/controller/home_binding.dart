import 'package:app/features/home/data/repository/home_repository_impl.dart';
import 'package:app/features/home/domain/repository/home_repository.dart';
import 'package:app/features/home/presentation/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    HomeRepository homeRepository = HomeRepositoryImpl();
    Get.lazyPut(() => homeRepository);

    Get.lazyPut(() => HomeController());
  }
}
