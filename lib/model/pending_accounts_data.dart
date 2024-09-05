class PendingAccountsData {
  String? profilePicture;
  String? userId;
  String? firstName;
  String? lastName;

  PendingAccountsData.fromJson(Map<String, dynamic> json, String profilePicture) {
    profilePicture = profilePicture;
    userId = json["accountUserId"];
    firstName = json["firstName"];
    lastName = json["lastName"];
  }
}