class UserDataModel {
  final String userID;
  final String fullName;
  final double userRatings;
  final String address;
  final int mobileNumber;
  final String emailAddress;
  final String nicNumber;
  final String imageUrl;
  final String dob;

  UserDataModel(
      {required this.imageUrl,
      required this.userRatings,
      required this.userID,
      required this.fullName,
      required this.address,
      required this.mobileNumber,
      required this.emailAddress,
      required this.nicNumber,
      required this.dob});
}
