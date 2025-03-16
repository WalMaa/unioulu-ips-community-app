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
  final String password; // Add this line


  const EditProfile(this.name, this.email, this.password);

  @override
  List<Object> get props => [name, email, password];
}

// Event for changing password
class ChangePassword extends MoreEvent {
  final String currentPassword; // Add current password field
  final String newPassword;

  const ChangePassword(this.currentPassword, this.newPassword);

  @override
  List<Object> get props => [currentPassword, newPassword];
}

// Event for deleting account
class DeleteAccount extends MoreEvent {}