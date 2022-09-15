import 'package:get/get.dart';

import '../data/repository/colicoli_repository.dart';
import '../data/repository/colicoli_repository_impl.dart';

class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ColiColiRepository>(
      () => ColiColiRepositoryImpl(),
      tag: (ColiColiRepository).toString(),
    );
  }
}
