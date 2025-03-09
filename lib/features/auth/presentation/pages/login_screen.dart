import 'dart:developer' as developer;

import 'package:community/core/theme/app_spacing.dart';
import 'package:community/features/auth/presentation/pages/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../language/presentation/pages/language_page.dart';
import '../../../theme/presentation/bloc/theme_bloc.dart';
import '../../presentation/bloc/auth_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import 'password_reset_screen.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: remove test logout code
    // perform logout
    // context.read<AuthBloc>().add(LogoutEvent());
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
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
                            state is ThemeLoaded && state.theme == AppTheme.dark
                                ? Icons.wb_sunny
                                : Icons.nightlight_round,
                          ),
                          onPressed: () {
                            context.read<ThemeBloc>().add(ChangeThemeEvent(
                                state is ThemeLoaded &&
                                        state.theme == AppTheme.dark
                                    ? AppTheme.light
                                    : AppTheme.dark));
                          },
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.defaultPadding),
                Column(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.login,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    const SizedBox(height: AppSpacing.extraLargePadding),
                    Row(
                      children: [
                        const Spacer(),
                        Expanded(
                          flex: 8,
                          child: SvgPicture.asset("assets/icons/login.svg"),
                        ),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.extraLargePadding),
                  ],
                ),
                Row(
                  children: [
                    const Spacer(),
                    Expanded(
                      flex: 8,
                      child: Form(
                        child: Column(
                          children: [
                            TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.indigo,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText:
                                    AppLocalizations.of(context)!.yourEmail,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(AppSpacing.defaultPadding),
                                  child: Icon(
                                    Icons.email_outlined,
                                    color: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .color,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: AppSpacing.defaultPadding),
                              child: TextFormField(
                                controller: passwordController,
                                textInputAction: TextInputAction.done,
                                obscureText: true,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Colors.indigo,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: AppLocalizations.of(context)!
                                      .yourPassword,
                                  prefixIcon: Padding(
                                    padding:
                                        const EdgeInsets.all(AppSpacing.defaultPadding),
                                    child: Icon(
                                      Icons.lock_outline,
                                      color: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .color,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: AppSpacing.defaultPadding),
                            ElevatedButton(
                              onPressed: () {
                                developer.log(
                                    "Login button pressed: ${emailController.text} ${passwordController.text}");
                                context.read<AuthBloc>().add(LoginEvent(
                                    email: emailController.text,
                                    password: passwordController.text));
                              },
                              child: Text(
                                AppLocalizations.of(context)!
                                    .login
                                    .toUpperCase(),
                              ),
                            ),
                            const SizedBox(height: AppSpacing.defaultPadding),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "${AppLocalizations.of(context)!.dontHaveAnAccount} ",
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return RegisterPage();
                                        },
                                      ),
                                    );
                                  },
                                  child: Text(
                                    AppLocalizations.of(context)!.register,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: AppSpacing.defaultPadding),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ResetPasswordPage(),
                                  ),
                                );
                              },
                              child: Text(
                                AppLocalizations.of(context)!.forgotPassword,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
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
