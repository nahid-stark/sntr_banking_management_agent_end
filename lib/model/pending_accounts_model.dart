import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sntr_banking_management_agent_end/model/pending_accounts_data.dart';

class PendingAccountsModel {
  List<PendingAccountsData> pendingAccountDataList = [];

  PendingAccountsModel.fromCollection(QuerySnapshot snapshot) {
    for (QueryDocumentSnapshot doc in snapshot.docs) {
      pendingAccountDataList.add(
        PendingAccountsData.fromJson(doc.data() as Map<String, dynamic>, "profilePicture"),
      );
    }
  }
}