import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
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
import 'features/language/presentation/pages/language_page.dart';
import 'core/theme/app_theme.dart';
import 'features/language/data/models/language_model.dart';
import 'features/theme/data/models/theme_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Client client = Client();
  client
      .setEndpoint('http://localhost/v1')
      .setProject('community-app')
      .setSelfSigned(
          status:
              true); // For self signed certificates, only use for development

  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open([LanguageModelSchema, ThemeModelSchema],
      directory: dir.path);

  final themeLocalDataSource = ThemeLocalDataSourceImpl(isar);
  final themeRepository = ThemeRepositoryImpl(themeLocalDataSource);
  final getTheme = GetTheme(themeRepository);
  final setTheme = SetTheme(themeRepository);

  final languageLocalDataSource = LanguageLocalDataSourceImpl(isar);
  final languageRepository = LanguageRepositoryImpl(languageLocalDataSource);
  final getLanguages = GetLanguages(languageRepository);
  final setLanguage = SetLanguage(languageRepository);
  final getSavedLanguage = GetSavedLanguage(languageRepository);

  runApp(MyApp(
    getTheme: getTheme,
    setTheme: setTheme,
    getLanguages: getLanguages,
    setLanguage: setLanguage,
    getSavedLanguage: getSavedLanguage,
  ));
}

class MyApp extends StatelessWidget {
  final GetTheme getTheme;
  final SetTheme setTheme;
  final GetLanguages getLanguages;
  final SetLanguage setLanguage;
  final GetSavedLanguage getSavedLanguage;

  const MyApp({
    super.key,
    required this.getTheme,
    required this.setTheme,
    required this.getLanguages,
    required this.setLanguage,
    required this.getSavedLanguage,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc(getTheme: getTheme, setTheme: setTheme)
            ..add(LoadThemeEvent()),
        ),
        BlocProvider(
          create: (context) => LocalizationBloc(
              getLanguages: getLanguages,
              setLanguage: setLanguage,
              getSavedLanguage: getSavedLanguage)
            ..add(LoadSavedLocalization()),
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
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.name),
        actions: [
          IconButton(
              color: Theme.of(context).textTheme.headlineSmall!.color,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const LanguagePage();
                }));
              },
              icon: const Icon(Icons.language)),
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return IconButton(
                color: Theme.of(context).textTheme.headlineSmall!.color,
                icon: Icon(
                  state is ThemeLoaded && state.theme == AppTheme.Dark
                      ? Icons.wb_sunny
                      : Icons.nightlight_round,
                ),
                onPressed: () {
                  context.read<ThemeBloc>().add(ChangeThemeEvent(
                      state is ThemeLoaded && state.theme == AppTheme.Dark
                          ? AppTheme.Light
                          : AppTheme.Dark));
                },
              );
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.hello_world,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              AppLocalizations.of(context)!.hello_world,
              style: TextStyle(
                color: Theme.of(context).textTheme.headlineMedium!.color,
                fontSize: 28.0,
              ),
            ),
            Text(
              AppLocalizations.of(context)!.example_text,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              AppLocalizations.of(context)!.example_text,
              style: TextStyle(
                color: Theme.of(context).textTheme.titleMedium!.color,
                fontSize: 16.0,
              ),
            ),
            Text(
              AppLocalizations.of(context)!.world_text,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              AppLocalizations.of(context)!.world_text,
              style: TextStyle(
                color: Theme.of(context).textTheme.titleMedium!.color,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
