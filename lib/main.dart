import 'package:appwrite/appwrite.dart';
import 'package:community/features/auth/presentation/pages/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'features/auth/data/datasources/auth_remote_data_source.dart';
import 'features/auth/data/models/user_model.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/usecases/authenticate_anonymous.dart';
import 'features/auth/domain/usecases/login.dart';
import 'features/auth/domain/usecases/logout.dart';
import 'features/auth/domain/usecases/register.dart';
import 'features/auth/domain/usecases/update_profile.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/pages/login_screen.dart';
import 'features/home/presentation/pages/home_page.dart';
import 'features/language/presentation/bloc/language_event.dart';
import 'features/theme/presentation/bloc/theme_bloc.dart';
import 'features/theme/data/datasources/theme_local_data_source.dart';
import 'features/theme/data/repositories/theme_repository_impl.dart';
import 'features/theme/domain/usecases/get_theme.dart';
import 'features/theme/domain/usecases/set_theme.dart';
import 'features/language/presentation/bloc/language_bloc.dart';
import 'features/language/data/datasources/language_local_data_source.dart';
import 'features/language/data/repositories/language_repository_impl.dart';
import 'features/language/domain/usecases/get_languages.dart';
import 'features/language/domain/usecases/set_language.dart';
import 'features/language/domain/usecases/get_saved_language.dart';
import 'core/theme/app_theme.dart';
import 'features/language/data/models/language_model.dart';
import 'features/theme/data/models/theme_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

GetIt locator = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Isar database
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
      [LanguageModelSchema, ThemeModelSchema, UserModelSchema],
      directory: dir.path);
  locator.registerSingleton<Isar>(isar);

  // Initialize Appwrite client
  final client = Client();
  client
      .setEndpoint('http://192.168.0.221/v1')
      .setProject('community-app')
      .setSelfSigned(
          status:
              true); // For self signed certificates, only use for development
  Account account = Account(client);
  locator.registerSingleton<Account>(account);
  locator.registerSingleton<Client>(client);

  // Register dependencies
  locator.registerLazySingleton<GetTheme>(() {
    final themeLocalDataSource = ThemeLocalDataSourceImpl(isar);
    final themeRepository = ThemeRepositoryImpl(themeLocalDataSource);
    return GetTheme(themeRepository);
  });

  locator.registerLazySingleton<SetTheme>(() {
    final themeLocalDataSource = ThemeLocalDataSourceImpl(isar);
    final themeRepository = ThemeRepositoryImpl(themeLocalDataSource);
    return SetTheme(themeRepository);
  });

  locator.registerLazySingleton<GetLanguages>(() {
    final languageLocalDataSource = LanguageLocalDataSourceImpl(isar);
    final languageRepository = LanguageRepositoryImpl(languageLocalDataSource);
    return GetLanguages(languageRepository);
  });

  locator.registerLazySingleton<SetLanguage>(() {
    final languageLocalDataSource = LanguageLocalDataSourceImpl(isar);
    final languageRepository = LanguageRepositoryImpl(languageLocalDataSource);
    return SetLanguage(languageRepository);
  });

  locator.registerLazySingleton<GetSavedLanguage>(() {
    final languageLocalDataSource = LanguageLocalDataSourceImpl(isar);
    final languageRepository = LanguageRepositoryImpl(languageLocalDataSource);
    return GetSavedLanguage(languageRepository);
  });

  final authRemoteDataSource = AuthRemoteDataSource(account);
  final authRepository = AuthRepositoryImpl(
    authRemoteDataSource,
    isar,
  );

  locator.registerSingleton<AuthRemoteDataSource>(authRemoteDataSource);
  locator.registerSingleton<AuthRepositoryImpl>(authRepository);

  locator.registerSingleton<Login>(Login(authRepository));
  locator.registerSingleton<Logout>(Logout(authRepository));
  locator.registerSingleton<Register>(Register(authRepository));
  locator.registerSingleton<UpdateProfile>(UpdateProfile(authRepository));
  locator.registerSingleton<AuthenticateAnonymous>(
      AuthenticateAnonymous(authRepository));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc(
            getTheme: locator<GetTheme>(),
            setTheme: locator<SetTheme>(),
          )..add(LoadThemeEvent()),
        ),
        BlocProvider(
          create: (context) => LocalizationBloc(
            getLanguages: locator<GetLanguages>(),
            setLanguage: locator<SetLanguage>(),
            getSavedLanguage: locator<GetSavedLanguage>(),
          )..add(LoadSavedLocalization()),
        ),
        BlocProvider(
          create: (context) => AuthBloc(
            login: locator<Login>(),
            logout: locator<Logout>(),
            register: locator<Register>(),
            updateProfile: locator<UpdateProfile>(),
            authenticateAnonymous: locator<AuthenticateAnonymous>(),
            account: locator<Account>(),
          ),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          ThemeData themeData = AppThemeData.lightTheme;
          if (state is ThemeLoaded && state.theme == AppTheme.Dark) {
            themeData = AppThemeData.darkTheme;
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'IPS Community App',
            theme: themeData,
            locale:
                context.select((LocalizationBloc bloc) => bloc.state.locale),
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            initialRoute: '/',
            routes: {
              '/': (context) => LoginPage(),
              '/register': (context) => RegisterPage(),
              '/home': (context) => const HomePage(),
            },
          );
        },
      ),
    );
  }
}
