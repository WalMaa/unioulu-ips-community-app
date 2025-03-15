import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:appwrite/appwrite.dart';

part 'more_event.dart';
part 'more_state.dart';

class MoreBloc extends Bloc<MoreEvent, MoreState> {
  final Account account;

  MoreBloc(this.account) : super(MoreInitial()) {
    
    // Handle profile edit event (requires password to update email)
    on<EditProfile>((event, emit) async {
      try {
        await account.updateEmail(email: event.email, password: event.password);
        await account.updateName(name: event.name);

        emit(ProfileUpdated());
      } catch (e) {
        emit(ProfileUpdateFailed("Incorrect current password for email update."));
      }
    });


on<ChangePassword>((event, emit) async {
  try {
    // Directly use updatePassword with both current and new password
    await account.updatePassword(
      oldPassword: event.currentPassword,
      password: event.newPassword,
    );

    emit(PasswordChanged());
  } catch (e) {
    emit(ProfileUpdateFailed("Incorrect current password or weak new password."));
  }
});


    // Handle delete account event
    on<DeleteAccount>((event, emit) async {
      try {
        await account.deleteSession(sessionId: 'current');
        emit(AccountDeleted());
      } catch (e) {
        emit(ProfileUpdateFailed(e.toString()));
      }
    });
  }
}
