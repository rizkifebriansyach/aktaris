import 'package:aktaris_app/domain/entities/auth/login_entity.dart';

class LoginModel extends LoginEntity {
  String? massage;
  User? user;

  LoginModel({
    this.massage,
    this.user,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        massage: json["massage"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "massage": massage,
        "user": user?.toJson(),
      };
}

class User {
  int? userId;
  int? roleId;
  String? email;
  String? phoneNumber;
  String? password;
  DateTime? emailVerifiedAt;
  DateTime? phoneNumberVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic userDetail;
  dynamic userFiles;
  dynamic notarisDetail;

  User({
    this.userId,
    this.roleId,
    this.email,
    this.phoneNumber,
    this.password,
    this.emailVerifiedAt,
    this.phoneNumberVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.userDetail,
    this.userFiles,
    this.notarisDetail,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"],
        roleId: json["role_id"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        password: json["password"],
        emailVerifiedAt: json["email_verified_at"] != null
            ? DateTime.parse(json["email_verified_at"])
            : null,
        phoneNumberVerifiedAt: json["phone_number_verified_at"] != null
            ? DateTime.parse(json["phone_number_verified_at"])
            : null,
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        userDetail: json["user_detail"],
        userFiles: json["user_files"],
        notarisDetail: json["notaris_detail"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "role_id": roleId,
        "email": email,
        "phone_number": phoneNumber,
        "password": password,
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "phone_number_verified_at": phoneNumberVerifiedAt?.toIso8601String,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user_detail": userDetail,
        "user_files": userFiles,
        "notaris_detail": notarisDetail,
      };
}
