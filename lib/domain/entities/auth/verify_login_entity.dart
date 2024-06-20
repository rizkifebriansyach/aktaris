import 'package:equatable/equatable.dart';

import '../../../data/model/auth/auth_model.dart';

class VerifyLoginEntity extends Equatable {
  // List<dynamic>? accessibleMenus;
  User? user;
  String? message;
  Token? token;

  @override
  List<Object?> get props => [ user, message, token];
}
