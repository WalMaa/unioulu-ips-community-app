import 'dart:developer' as developer;

import 'package:community/core/theme/app_spacing.dart';
import 'package:community/features/auth/presentation/pages/login_screen.dart';
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

class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
          ));
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
                      AppLocalizations.of(context)!.register,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    const SizedBox(height: AppSpacing.defaultPadding),
                    Row(
                      children: [
                        const Spacer(),
                        Expanded(
                          flex: 8,
                          child: SvgPicture.asset("assets/icons/signup.svg"),
                        ),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.defaultPadding),
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
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              controller: nameController,
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
                                hintText: AppLocalizations.of(context)!.name,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(AppSpacing.defaultPadding),
                                  child: Icon(
                                    Icons.person_outline,
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
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                controller: emailController,
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
                                  hintText: AppLocalizations.of(context)!.email,
                                  prefixIcon: Padding(
                                    padding:
                                        const EdgeInsets.all(AppSpacing.defaultPadding),
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
                            ),
                            TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.done,
                              obscureText: true,
                              controller: passwordController,
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
                                    AppLocalizations.of(context)!.password,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(AppSpacing.defaultPadding),
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
                            const SizedBox(height: AppSpacing.smallPadding),
                            ElevatedButton(
                              onPressed: () {
                                developer.log("Register Name: ${nameController.text}");
                                developer.log(
                                    "Register Email: ${emailController.text}");
                                developer.log(
                                    "Register Password: ${passwordController.text}");
                                context.read<AuthBloc>().add(
                                      RegisterEvent(
                                        name: nameController.text,
                                        email: emailController.text,
                                        password: passwordController.text,
                                      ),
                                    );
                              },
                              child: Text(AppLocalizations.of(context)!
                                  .register
                                  .toUpperCase()),
                            ),
                            const SizedBox(height: AppSpacing.defaultPadding),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "${AppLocalizations.of(context)!.alreadyHaveAnAccount} ",
                                ),
                                GestureDetector(
                                  onTap: () {
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
                                    AppLocalizations.of(context)!.login,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
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
