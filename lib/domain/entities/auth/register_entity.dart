import 'package:aktaris_app/data/model/auth/register_model.dart';
import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable {
  User? user;
  // String? message;
  // int? userId;
  // int? roleId;
  // String? email;
  // String? phoneNumber;
  // String? password;
  // DateTime? emailVerifiedAt;
  // DateTime? phoneNumberVerifiedAt;
  // DateTime? createdAt;
  // DateTime? updatedAt;
  // dynamic userDetail;
  // dynamic userFile;
  // dynamic notarisDetail;

  RegisterEntity({
    this.user,
    // this.message,
    // this.userId,
    // this.roleId,
    // this.email,
    // this.phoneNumber,
    // this.password,
    // this.emailVerifiedAt,
    // this.phoneNumberVerifiedAt,
    // this.createdAt,
    // this.updatedAt,
    // this.userDetail,
    // this.userFile,
    // this.notarisDetail,
  });
  
  @override
  List<Object?> get props =>[user];
}
