import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:community/features/more/presentation/bloc/more_bloc.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final ValueNotifier<bool> isDarkModeNotifier = ValueNotifier(false);
  final ValueNotifier<String> languageNotifier = ValueNotifier("English");

  Map<String, Map<String, String>> localizedStrings = {
    "English": {
      "profile": "Profile Management",
      "name": "Name",
      "email": "Email",
      "password": "Enter Current Password to Update Email",
      "save": "Save Changes",
      "changePassword": "Change Password",
      "about": "About",
      "aboutContent": "This app helps communities stay connected and informed.",
      "safety": "Safety",
      "darkMode": "Dark Mode",
      "help": "Help",
      "helpContent": "For support, contact support@communityapp.com.",
      "report": "Report an Issue",
      "reportContent": "Email us at bugs@communityapp.com or visit our support center.",
      "delete": "Delete Account",
      "language": "Language",
    },
    "Finnish": {
      "profile": "Profiilin hallinta",
      "name": "Nimi",
      "email": "Sähköposti",
      "password": "Anna nykyinen salasana päivittääksesi sähköpostin",
      "save": "Tallenna muutokset",
      "changePassword": "Vaihda salasana",
      "about": "Tietoa",
      "aboutContent": "Tämä sovellus auttaa yhteisöjä pysymään yhteydessä ja ajan tasalla.",
      "safety": "Turvallisuus",
      "darkMode": "Tumma tila",
      "help": "Apua",
      "helpContent": "Ota yhteyttä osoitteeseen support@communityapp.com.",
      "report": "Ilmoita ongelmasta",
      "reportContent": "Lähetä sähköpostia osoitteeseen bugs@communityapp.com tai vieraile tukikeskuksessamme.",
      "delete": "Poista tili",
      "language": "Kieli",
    },
    "Swedish": {
      "profile": "Profilhantering",
      "name": "Namn",
      "email": "E-post",
      "password": "Ange nuvarande lösenord för att uppdatera e-post",
      "save": "Spara ändringar",
      "changePassword": "Byt lösenord",
      "about": "Om",
      "aboutContent": "Denna app hjälper samhällen att hålla kontakten och informerade.",
      "safety": "Säkerhet",
      "darkMode": "Mörkt läge",
      "help": "Hjälp",
      "helpContent": "Kontakta support@communityapp.com för support.",
      "report": "Rapportera ett problem",
      "reportContent": "Maila oss på bugs@communityapp.com eller besök vårt supportcenter.",
      "delete": "Radera konto",
      "language": "Språk",
    },
  };

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDarkMode, _) {
        final theme = Theme.of(context);
        final textColor = isDarkMode ? Colors.white : Colors.black;

        return Scaffold(
          backgroundColor: isDarkMode ? Colors.black : Colors.white,
          appBar: AppBar(
            title: ValueListenableBuilder<String>(
              valueListenable: languageNotifier,
              builder: (_, lang, __) => Text(localizedStrings[lang]!["profile"]!, style: TextStyle(color: Colors.white)),
            ),
            backgroundColor: isDarkMode ? Colors.grey[900] : theme.primaryColor,
            iconTheme: IconThemeData(color: Colors.white),
          ),
          body: ValueListenableBuilder<String>(
            valueListenable: languageNotifier,
            builder: (_, lang, __) {
              final strings = localizedStrings[lang]!;

              return SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: DefaultTextStyle(
                  style: TextStyle(color: textColor),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/default_avatar.png'),
                      ),
                      SizedBox(height: 20),
                      _buildTextField(nameController, strings["name"]!, isDarkMode),
                      _buildTextField(emailController, strings["email"]!, isDarkMode),
                      _buildTextField(passwordController, strings["password"]!, isDarkMode, obscure: true),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          context.read<MoreBloc>().add(EditProfile(
                                nameController.text,
                                emailController.text,
                                passwordController.text,
                              ));
                        },
                        child: Text(strings["save"]!),
                      ),
                      SizedBox(height: 20),
                      Divider(color: isDarkMode ? Colors.grey : null),

                      ListTile(
                        leading: Icon(Icons.lock, color: textColor),
                        title: Text(strings["changePassword"]!, style: TextStyle(color: textColor)),
                        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: textColor),
                        onTap: () => _showChangePasswordDialog(context, isDarkMode),
                      ),

                      Divider(color: isDarkMode ? Colors.grey : null),

                      ListTile(
                        leading: Icon(Icons.info_outline, color: textColor),
                        title: Text(strings["about"]!, style: TextStyle(color: textColor)),
                        onTap: () => _showInfoDialog(isDarkMode, strings["about"]!, strings["aboutContent"]!),
                      ),
                      ListTile(
                        leading: Icon(Icons.shield_outlined, color: textColor),
                        title: Text(strings["safety"]!, style: TextStyle(color: textColor)),
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Safety settings coming soon!")),
                          );
                        },
                      ),
                      SwitchListTile(
                        title: Text(strings["darkMode"]!, style: TextStyle(color: textColor)),
                        secondary: Icon(Icons.dark_mode, color: textColor),
                        value: isDarkMode,
                        onChanged: (value) {
                          isDarkModeNotifier.value = value;
                        },
                      ),
                      ListTile(
                        key: Key('help_tile'),
                        leading: Icon(Icons.help_outline, color: textColor),
                        title: Text(strings["help"]!, style: TextStyle(color: textColor)),
                        onTap: () => _showInfoDialog(isDarkMode, strings["help"]!, strings["helpContent"]!),
                      ),
                      ListTile(
                        leading: Icon(Icons.bug_report_outlined, color: textColor),
                        title: Text(strings["report"]!, style: TextStyle(color: textColor)),
                        onTap: () => _showInfoDialog(isDarkMode, strings["report"]!, strings["reportContent"]!),
                      ),

                      Divider(color: isDarkMode ? Colors.grey : null),

                      Row(
                        children: [
                          Icon(Icons.language, color: textColor),
                          SizedBox(width: 8),
                          Text(strings["language"]!, style: TextStyle(color: textColor)),
                          Spacer(),
                          DropdownButton<String>(
                            value: lang,
                            dropdownColor: isDarkMode ? Colors.grey[900] : Colors.white,
                            onChanged: (value) => languageNotifier.value = value!,
                            items: ["English", "Finnish", "Swedish"]
                                .map((lang) => DropdownMenuItem<String>(
                                      value: lang,
                                      child: Text(lang, style: TextStyle(color: textColor)),
                                    ))
                                .toList(),
                          ),
                        ],
                      ),

                      SizedBox(height: 16),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                        onPressed: () {
                          context.read<MoreBloc>().add(DeleteAccount());
                        },
                        child: Text(strings["delete"]!, style: TextStyle(color: Colors.white)),
                      ),

                      BlocBuilder<MoreBloc, MoreState>(
                        builder: (context, state) {
                          if (state is ProfileUpdated) {
                            return Text("Profile updated successfully!", style: TextStyle(color: Colors.green));
                          } else if (state is PasswordChanged) {
                            return Text("Password changed successfully!", style: TextStyle(color: Colors.green));
                          } else if (state is AccountDeleted) {
                            return Text("Account deleted successfully!", style: TextStyle(color: Colors.red));
                          } else if (state is ProfileUpdateFailed) {
                            return Text(state.message, style: TextStyle(color: Colors.red));
                          }
                          return Container();
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, bool isDarkMode, {bool obscure = false}) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: isDarkMode ? Colors.grey[300] : null),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: isDarkMode ? Colors.grey : Colors.grey),
        ),
      ),
    );
  }

  void _showChangePasswordDialog(BuildContext context, bool isDarkMode) {
    TextEditingController currentPasswordController = TextEditingController();
    TextEditingController newPasswordController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
        title: Text("Change Password", style: TextStyle(color: isDarkMode ? Colors.white : Colors.black)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: currentPasswordController, decoration: InputDecoration(labelText: "Current Password"), obscureText: true),
            TextField(controller: newPasswordController, decoration: InputDecoration(labelText: "New Password"), obscureText: true),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text("Cancel", style: TextStyle(color: isDarkMode ? Colors.white : Colors.black))),
          ElevatedButton(
            onPressed: () {
              context.read<MoreBloc>().add(ChangePassword(
                    currentPasswordController.text,
                    newPasswordController.text,
                  ));
              Navigator.pop(context);
            },
            child: Text("Change Password"),
          ),
        ],
      ),
    );
  }

  void _showInfoDialog(bool isDarkMode, String title, String content) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
        title: Text(title, style: TextStyle(color: isDarkMode ? Colors.white : Colors.black)),
        content: Text(content, style: TextStyle(color: isDarkMode ? Colors.white70 : Colors.black87)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK", style: TextStyle(color: isDarkMode ? Colors.white : Colors.black)),
          ),
        ],
      ),
    );
  }
}
