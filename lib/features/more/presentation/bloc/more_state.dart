part of 'more_bloc.dart';

abstract class MoreState extends Equatable {
  const MoreState();

  @override
  List<Object> get props => [];
}

class MoreInitial extends MoreState {}

class ProfileUpdated extends MoreState {}

class PasswordChanged extends MoreState {}

class AccountDeleted extends MoreState {}

class ProfileUpdateFailed extends MoreState {
  final String message;
  const ProfileUpdateFailed(this.message);

  @override
  List<Object> get props => [message];
}