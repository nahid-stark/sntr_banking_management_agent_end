import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sntr_banking_management_agent_end/model/pending_accounts_data.dart';
import 'package:sntr_banking_management_agent_end/model/pending_accounts_model.dart';

class PendingAccountsController extends GetxController {
  bool get inProgress => _inProgress;
  List<PendingAccountsData> get pendingAccountDataList => _pendingAccountDataList;
  bool _inProgress = false;
  late bool _isSuccess;
  List<PendingAccountsData> _pendingAccountDataList = [];
  Future<bool> pendingAccountDataController() async {
    _inProgress = true;
    update();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot snapshot = await firestore.collection("pending_accounts").get();
    _pendingAccountDataList = PendingAccountsModel.fromCollection(snapshot).pendingAccountDataList;
    _isSuccess = true;
    _inProgress = false;
    update();
    return _isSuccess;
  }
}