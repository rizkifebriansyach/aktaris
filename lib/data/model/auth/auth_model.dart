import 'package:aktaris_app/domain/entities/auth/login_entity.dart';
import 'package:aktaris_app/domain/entities/auth/verify_login_entity.dart';

class AuthModel extends VerifyLoginEntity {
  // List<dynamic>? accessibleMenus;
  String? message;
  Token? token;
  User? user;

  AuthModel({
    // this.accessibleMenus,
    this.message,
    this.token,
    this.user,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        // accessibleMenus: json["accessible_menus"] != null
        //     ? List<dynamic>.from(json["accessible_menus"].map((x) => x)).toList()
        //     : [],
        message: json["message"],
        token: Token.fromJson(json["token"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        // "accessible_menus": accessibleMenus != null
        //     ? List<dynamic>.from(accessibleMenus!.map((x) => x.toJson()))
        //     : [],
        "message": message,
        "token": token?.toJson(),
        "user": user?.toJson(),
      };
}

class Token {
  String? accessToken;
  String? refreshToken;

  Token({
    this.accessToken,
    this.refreshToken,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "refresh_token": refreshToken,
      };
}

class User {
  String? message;
  int? userId;
  int? roleId;
  String? email;
  String? phoneNumber;
  String? password;
  DateTime? emailVerifiedAt;
  DateTime? phoneNumberVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  UserDetail? userDetail;
  dynamic userFile;
  dynamic notarisDetail;

  User({
    this.message,
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
    this.userFile,
    this.notarisDetail,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        message: json["message"],
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
        userDetail: json["user_detail"] != null
            ? UserDetail.fromJson(json["user_detail"])
            : null,
        userFile: json["user_files"],
        notarisDetail: json["notaris_detail"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "user_id": userId,
        "role_id": roleId,
        "email": email,
        "phone_number": phoneNumber,
        "password": password,
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "phone_number_verified_at": phoneNumberVerifiedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user_detail": userDetail?.toJson(),
        "user_files": userFile,
        "notaris_detail": notarisDetail,
      };
}

class UserDetail {
  int? id;
  int? userId;
  String? name;
  String? placeOfBirth;
  String? dateOfBirth;
  String? gender;
  String? marriageStatus;
  String? noNik;
  String? noNpwp;
  String? address;
  String? agama;
  String? ibuKandung;
  int? districtId;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserDetail({
    this.id,
    this.userId,
    this.name,
    this.placeOfBirth,
    this.dateOfBirth,
    this.gender,
    this.marriageStatus,
    this.noNik,
    this.noNpwp,
    this.address,
    this.agama,
    this.ibuKandung,
    this.districtId,
    this.createdAt,
    this.updatedAt,
  });

  factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        placeOfBirth: json["place_of_birth"],
        dateOfBirth: json["date_of_birth"],
        gender: json["gender"],
        marriageStatus: json["marriage_status"],
        noNik: json["no_nik"],
        noNpwp: json["no_npwp"],
        address: json["address"],
        agama: json["agama"],
        ibuKandung: json["ibu_kandung"],
        districtId: json["District_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "place_of_birth": placeOfBirth,
        "date_of_birth": dateOfBirth,
        "gender": gender,
        "marriage_status": marriageStatus,
        "no_nik": noNik,
        "no_npwp": noNpwp,
        "address": address,
        "agama": agama,
        "ibu_kandung": ibuKandung,
        "District_id": districtId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
