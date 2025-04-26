import 'package:equatable/equatable.dart';
import 'package:community/features/auth/domain/entities/user.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final User user;
  final List<String> labels;
  AuthAuthenticated({required this.user, required this.labels});

  @override
  List<Object> get props => [user];
}

class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});

  @override
  List<Object> get props => [message];
}

class AuthResetPasswordSuccess extends AuthState {
  final String message;

  AuthResetPasswordSuccess({required this.message});

  @override
  List<Object> get props => [message];
}