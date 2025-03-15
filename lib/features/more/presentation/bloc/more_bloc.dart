import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'more_event.dart';
part 'more_state.dart';

class MoreBloc extends Bloc<MoreEvent, MoreState> {
  MoreBloc() : super(MoreInitial()) {
    // Handle profile edit event
    on<EditProfile>((event, emit) async {
      // Here, you would add logic to update the profile data, e.g., call an API or update local storage.
      // For example, let's simulate a delay and emit the ProfileUpdated state
      await Future.delayed(Duration(seconds: 1));
      emit(ProfileUpdated());
    });

    // Handle change password event
    on<ChangePassword>((event, emit) async {
      // Here, add logic for changing the password (e.g., Firebase Auth, API call)
      await Future.delayed(Duration(seconds: 1));
      emit(PasswordChanged());
    });

    // Handle delete account event
    on<DeleteAccount>((event, emit) async {
      // Here, you would call the logic to delete the account (e.g., Firebase Auth, API call)
      await Future.delayed(Duration(seconds: 1));
      emit(AccountDeleted());
    });
  }
}