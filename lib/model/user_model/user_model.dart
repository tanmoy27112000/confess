class UserModel {
  UserModel({
    required this.uid,
    required this.email,
    required this.displayName,
    required this.photoUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] as String,
      email: json['email'] as String,
      displayName: json['displayName'] as String,
      photoUrl: json['photoUrl'] as String,
    );
  }
  final String uid;
  final String email;
  final String displayName;
  final String photoUrl;

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'photoUrl': photoUrl,
    };
  }
}
