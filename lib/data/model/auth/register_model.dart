import 'package:aktaris_app/domain/entities/auth/register_entity.dart';

class RegisterModel extends RegisterEntity {
  //Chat? chat;
  String? message;
  User? user;

  RegisterModel({
    //this.chat,
    this.message,
    this.user,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        //chat: Chat.fromJson(json["chat"]),
        message: json["message"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        //"chat": chat?.toJson(),
        "message": message,
        "user": user?.toJson(),
      };
}

class Chat {
  //int? chatId;
  int? userId;
  String? authToken;
  String? chatRocketId;
  bool? active;
  String? name;
  String? username;
  String? rid;
  DateTime? createAt;
  DateTime? updateAt;

  Chat({
    //this.chatId,
    this.userId,
    this.authToken,
    this.chatRocketId,
    this.active,
    this.name,
    this.username,
    this.rid,
    this.createAt,
    this.updateAt,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        // chatId: json["chat_id"],
        userId: json["user_id"],
        authToken: json["auth_token"],
        chatRocketId: json["chat_rocket_id"],
        active: json["active"],
        name: json["name"],
        username: json["username"],
        rid: json["rid"],
        createAt: DateTime.parse(json["create_at"]),
        updateAt: DateTime.parse(json["update_at"]),
      );

  Map<String, dynamic> toJson() => {
        //"chat_id": chatId,
        "user_id": userId,
        "auth_token": authToken,
        "chat_rocket_id": chatRocketId,
        "active": active,
        "name": name,
        "username": username,
        "rid": rid,
        "create_at": createAt?.toIso8601String(),
        "update_at": updateAt?.toIso8601String(),
      };
}

class User extends RegisterEntity {
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
        phoneNumberVerifiedAt: json["phone_number_verified_at"],
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
        "email_verified_at": emailVerifiedAt,
        "phone_number_verified_at": phoneNumberVerifiedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user_detail": userDetail,
        "user_files": userFiles,
        "notaris_detail": notarisDetail,
      };
}
