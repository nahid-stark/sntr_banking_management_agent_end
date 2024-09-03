import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  bool get inProgress => _inProgress;
  bool _inProgress = false;
  late bool _isSuccess;
  Future<bool> login(String id, String password) async {
    _inProgress = true;
    update();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentSnapshot agentDoc = await firestore.collection("agent_info").doc(id).get();
    if((agentDoc.data() != null) && (agentDoc.get("password") == password)) {
      _isSuccess = true;
    } else {
      _isSuccess = false;
    }
    _inProgress = false;
    update();
    return _isSuccess;
  }
}