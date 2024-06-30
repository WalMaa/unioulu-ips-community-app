// Splash Page that will also check if the user is logged in or not under the hood using the AuthBloc.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/auth/presentation/bloc/auth_event.dart';
import '../../features/auth/presentation/bloc/auth_state.dart';
import '../../features/language/presentation/pages/language_page.dart';
import '../../features/theme/presentation/bloc/theme_bloc.dart';
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
        } else if (state is AuthInitial || state is AuthError) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/login', (route) => false);
        }
      },
      child: const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),

      // Scaffold(
      //   appBar: AppBar(
      //     title: Text(AppLocalizations.of(context)!.name),
      //     actions: [
      //       IconButton(
      //           color: Theme.of(context).textTheme.headlineSmall!.color,
      //           onPressed: () {
      //             Navigator.push(context, MaterialPageRoute(builder: (context) {
      //               return const LanguagePage();
      //             }));
      //           },
      //           icon: const Icon(Icons.language)),
      //       BlocBuilder<ThemeBloc, ThemeState>(
      //         builder: (context, state) {
      //           return IconButton(
      //             color: Theme.of(context).textTheme.headlineSmall!.color,
      //             icon: Icon(
      //               state is ThemeLoaded && state.theme == AppTheme.Dark
      //                   ? Icons.wb_sunny
      //                   : Icons.nightlight_round,
      //             ),
      //             onPressed: () {
      //               context.read<ThemeBloc>().add(ChangeThemeEvent(
      //                   state is ThemeLoaded && state.theme == AppTheme.Dark
      //                       ? AppTheme.Light
      //                       : AppTheme.Dark));
      //             },
      //           );
      //         },
      //       ),
      //     ],
      //   ),
      //   body: Container(
      //     width: double.infinity,
      //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
      //     child: const Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         CircularProgressIndicator(),
      //         SizedBox(height: 16.0),
      //         Text('Checking authentication...'),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
