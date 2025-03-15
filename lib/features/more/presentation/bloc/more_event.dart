part of 'more_bloc.dart';

abstract class MoreEvent extends Equatable {
  const MoreEvent();

  @override
  List<Object> get props => [];
}

// Event for editing profile
class EditProfile extends MoreEvent {
  final String name;
  final String email;

  const EditProfile(this.name, this.email);

  @override
  List<Object> get props => [name, email];
}

// Event for changing password
class ChangePassword extends MoreEvent {
  final String newPassword;

  const ChangePassword(this.newPassword);

  @override
  List<Object> get props => [newPassword];
}

// Event for deleting account
class DeleteAccount extends MoreEvent {}