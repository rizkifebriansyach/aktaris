import 'package:aktaris_app/data/model/auth/login_model.dart';
import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  User? user;

  LoginEntity({this.user});

  @override
  List<Object?> get props => [user];
}
