import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/auth/presentation/bloc/auth_event.dart';
import '../../features/auth/presentation/bloc/auth_state.dart';
import '../../features/auth/presentation/pages/login_screen.dart';
import '../../features/auth/presentation/pages/register_screen.dart';
import '../../features/language/presentation/pages/language_page.dart';
import '../../features/theme/presentation/bloc/theme_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../constants.dart';
import '../theme/app_theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(CheckAuthenticationEvent());

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      color: Theme.of(context).textTheme.headlineSmall!.color,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const LanguagePage();
                        }));
                      },
                      icon: const Icon(Icons.language),
                    ),
                    BlocBuilder<ThemeBloc, ThemeState>(
                      builder: (context, state) {
                        return IconButton(
                          color:
                              Theme.of(context).textTheme.headlineSmall!.color,
                          icon: Icon(
                            state is ThemeLoaded && state.theme == AppTheme.Dark
                                ? Icons.wb_sunny
                                : Icons.nightlight_round,
                          ),
                          onPressed: () {
                            context.read<ThemeBloc>().add(ChangeThemeEvent(
                                state is ThemeLoaded &&
                                        state.theme == AppTheme.Dark
                                    ? AppTheme.Light
                                    : AppTheme.Dark));
                          },
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: defaultPadding),
                Column(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.welcome,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 26),
                    ),
                    const SizedBox(height: defaultPadding),
                    Row(
                      children: [
                        const Spacer(),
                        Expanded(
                          flex: 8,
                          child: SvgPicture.asset(
                            "assets/icons/welcome.svg",
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(height: defaultPadding),
                  ],
                ),
                Row(
                  children: [
                    const Spacer(),
                    Expanded(
                      flex: 8,
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return LoginPage();
                                  },
                                ),
                              );
                            },
                            child: Text(
                              AppLocalizations.of(context)!.login.toUpperCase(),
                            ),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return RegisterPage();
                                  },
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kPrimaryLightColor,
                              elevation: 0,
                            ),
                            child: Text(
                              AppLocalizations.of(context)!
                                  .register
                                  .toUpperCase(),
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
