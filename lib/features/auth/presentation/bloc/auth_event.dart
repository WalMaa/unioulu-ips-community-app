import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class LogoutEvent extends AuthEvent {}

class RegisterEvent extends AuthEvent {
  final String email;
  final String password;
  final String name;

  RegisterEvent(
      {required this.email, required this.password, required this.name});

  @override
  List<Object?> get props => [email, password, name];
}

class UpdateProfileEvent extends AuthEvent {
  final String name;

  UpdateProfileEvent({required this.name});

  @override
  List<Object?> get props => [name];
}

class AuthenticateAnonymousEvent extends AuthEvent {}
