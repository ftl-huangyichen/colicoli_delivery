import 'package:colicoli_delivery/data/remote/colicoli_remote_data_source.dart';
import 'package:get/get.dart';

import '../data/remote/colicoli_remote_data_source_impl.dart';



class RemoteSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ColiColiRemoteDataSource>(
      () => ColiColiRemoteDataSourceImpl(),
      tag: (ColiColiRemoteDataSource).toString(),
    );
  }
}
