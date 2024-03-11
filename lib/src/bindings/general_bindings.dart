import 'package:get/get.dart';
import 'package:residential_manager/src/data/services/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies(){
    Get.put(NetworkManager());
  }
  
}