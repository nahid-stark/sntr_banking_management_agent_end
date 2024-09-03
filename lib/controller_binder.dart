import 'package:get/get.dart';
import 'package:sntr_banking_management_agent_end/controller/login_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}