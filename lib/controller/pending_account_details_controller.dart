import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:sntr_banking_management_agent_end/model/pending_account_details_data.dart';

class PendingAccountDetailsController extends GetxController{
  bool get inProgress => _inProgress;
  PendingAccountDetailsData get pendingAccountDataList => _pendingAccountDataList;
  bool _inProgress = false;
  late bool _isSuccess;
  late PendingAccountDetailsData _pendingAccountDataList;
  Future<bool> pendingAccountDetails(String id) async {
    _inProgress = true;
    update();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    Reference profilePicture = FirebaseStorage.instance.ref().child("pending_accounts").child(id).child("profilePicture");
    Reference nidFrontSide = FirebaseStorage.instance.ref().child("pending_accounts").child(id).child("nidFrontSidePicture");
    Reference nidBackSide = FirebaseStorage.instance.ref().child("pending_accounts").child(id).child("nidBackSidePicture");
    String profilePictureUrl = await profilePicture.getDownloadURL();
    String nidFrontSideUrl = await nidFrontSide.getDownloadURL();
    String nidBackSideUrl = await nidBackSide.getDownloadURL();
    DocumentSnapshot snapshot = await firestore.collection("pending_accounts").doc(id).get();

    _isSuccess = true;
    _inProgress = false;
    update();
    return _isSuccess;
  }
}