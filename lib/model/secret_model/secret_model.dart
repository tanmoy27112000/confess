class SecretModel {
  SecretModel({
    required this.appwriteProject,
  });
  factory SecretModel.fromJson(Map<String, dynamic> json) {
    return SecretModel(
      appwriteProject: json['APPWRITE_PROJECT'] as String,
    );
  }
  final String appwriteProject;
}
