import 'package:appwrite/appwrite.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/user_model.dart';
import '../../domain/usecases/authenticate_anonymous.dart';
import '../../domain/usecases/login.dart';
import '../../domain/usecases/logout.dart';
import '../../domain/usecases/register.dart';
import '../../domain/usecases/update_profile.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Login login;
  final Logout logout;
  final Register register;
  final UpdateProfile updateProfile;
  final AuthenticateAnonymous authenticateAnonymous;
  final Account account;

  AuthBloc({
    required this.login,
    required this.logout,
    required this.register,
    required this.updateProfile,
    required this.authenticateAnonymous,
    required this.account,
  }) : super(AuthInitial()) {
    on<LoginEvent>(_onLogin);
    on<LogoutEvent>(_onLogout);
    on<RegisterEvent>(_onRegister);
    on<UpdateProfileEvent>(_onUpdateProfile);
    on<AuthenticateAnonymousEvent>(_onAuthenticateAnonymous);
    on<CheckAuthenticationEvent>(_onCheckAuthentication);
  }

  void _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await login.execute(event.email, event.password);
      emit(AuthAuthenticated(user: user, labels: user.labels));
      final result = await account.get();
      final fuser = UserModel.fromAppwriteUser(result).toEntity();

      //TODO: remove print statement
      print('Login: ${fuser.name}');
    } catch (e) {
      emit(AuthError(message: 'Invalid email or password. Please try again.'));
    }
  }

  void _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await logout.execute();
      emit(AuthInitial());
      //TODO: remove print statement
      print('Logout: ${event.toString()}');
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  void _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await register.execute(event.email, event.password, event.name);
      final user = await login.execute(event.email, event.password);
      emit(AuthAuthenticated(user: user, labels: user.labels));
      //TODO: remove print statement
      print('Register: ${user.toString()}');
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  void _onUpdateProfile(
      UpdateProfileEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await updateProfile.execute(event.name);
      emit(AuthAuthenticated(user: user, labels: user.labels));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  void _onAuthenticateAnonymous(
      AuthenticateAnonymousEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await authenticateAnonymous.execute();
      emit(AuthAuthenticated(user: user, labels: user.labels));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  void _onCheckAuthentication(
      CheckAuthenticationEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final appwriteUser = await account.get();
      if (appwriteUser.email.isEmpty) {
        emit(AuthInitial());
      } else {
        final user = UserModel.fromAppwriteUser(appwriteUser).toEntity();
        emit(AuthAuthenticated(user: user, labels: user.labels));

        //TODO: remove print statement
        print('CheckAuthentication: ${user.email} & ${user.labels.join(',')}');
      }
    } catch (e) {
      emit(AuthInitial());
    }
  }
}
