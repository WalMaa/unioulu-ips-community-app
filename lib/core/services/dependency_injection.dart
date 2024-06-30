import 'package:appwrite/appwrite.dart';
import 'package:isar/isar.dart';
import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/usecases/authenticate_anonymous.dart';
import '../../features/auth/domain/usecases/login.dart';
import '../../features/auth/domain/usecases/logout.dart';
import '../../features/auth/domain/usecases/register.dart';
import '../../features/auth/domain/usecases/update_profile.dart';
import '../../features/language/data/datasources/language_local_data_source.dart';
import '../../features/language/data/repositories/language_repository_impl.dart';
import '../../features/language/domain/usecases/get_languages.dart';
import '../../features/language/domain/usecases/get_saved_language.dart';
import '../../features/language/domain/usecases/set_language.dart';
import '../../features/theme/data/datasources/theme_local_data_source.dart';
import '../../features/theme/data/repositories/theme_repository_impl.dart';
import '../../features/theme/domain/usecases/get_theme.dart';
import '../../features/theme/domain/usecases/set_theme.dart';
import '../../main.dart';

void setupLocator() {
  // Register dependencies
  locator.registerLazySingleton<GetTheme>(() {
    final themeLocalDataSource = ThemeLocalDataSourceImpl(locator<Isar>());
    final themeRepository = ThemeRepositoryImpl(themeLocalDataSource);
    return GetTheme(themeRepository);
  });

  locator.registerLazySingleton<SetTheme>(() {
    final themeLocalDataSource = ThemeLocalDataSourceImpl(locator<Isar>());
    final themeRepository = ThemeRepositoryImpl(themeLocalDataSource);
    return SetTheme(themeRepository);
  });

  locator.registerLazySingleton<GetLanguages>(() {
    final languageLocalDataSource =
        LanguageLocalDataSourceImpl(locator<Isar>());
    final languageRepository = LanguageRepositoryImpl(languageLocalDataSource);
    return GetLanguages(languageRepository);
  });

  locator.registerLazySingleton<SetLanguage>(() {
    final languageLocalDataSource =
        LanguageLocalDataSourceImpl(locator<Isar>());
    final languageRepository = LanguageRepositoryImpl(languageLocalDataSource);
    return SetLanguage(languageRepository);
  });

  locator.registerLazySingleton<GetSavedLanguage>(() {
    final languageLocalDataSource =
        LanguageLocalDataSourceImpl(locator<Isar>());
    final languageRepository = LanguageRepositoryImpl(languageLocalDataSource);
    return GetSavedLanguage(languageRepository);
  });

  final authRemoteDataSource = AuthRemoteDataSource(locator<Account>());
  final authRepository = AuthRepositoryImpl(
    authRemoteDataSource,
    locator<Isar>(),
  );

  locator.registerSingleton<AuthRemoteDataSource>(authRemoteDataSource);
  locator.registerSingleton<AuthRepositoryImpl>(authRepository);

  locator.registerSingleton<Login>(Login(authRepository));
  locator.registerSingleton<Logout>(Logout(authRepository));
  locator.registerSingleton<Register>(Register(authRepository));
  locator.registerSingleton<UpdateProfile>(UpdateProfile(authRepository));
  locator.registerSingleton<AuthenticateAnonymous>(
      AuthenticateAnonymous(authRepository));
}
