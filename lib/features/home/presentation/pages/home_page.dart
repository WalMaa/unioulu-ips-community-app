import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_event.dart';
import '../../../auth/presentation/bloc/auth_state.dart';
import '../../../language/presentation/pages/language_page.dart';
import '../../../theme/presentation/bloc/theme_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            icon: const Icon(Icons.language),
          ),
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
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthInitial) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/login', (route) => false);
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
            ));
          }
        },
        child: Container(
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
              const SizedBox(height: 16.0),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(LogoutEvent());
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/login', (route) => false);
                    },
                    child: const Text('Logout'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
