import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:community/features/more/presentation/bloc/more_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController(); // For verifying email change

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile Management")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/default_avatar.png'),
            ),
            SizedBox(height: 20),

            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Enter Current Password to Update Email"),
              obscureText: true,
            ),

            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context.read<MoreBloc>().add(EditProfile(
                  nameController.text,
                  emailController.text,
                  passwordController.text, // Required for email update verification
                ));
              },
              child: Text("Save Changes"),
            ),

            SizedBox(height: 30),
            Divider(),

            // Button to Open Change Password Dialog
            ElevatedButton(
              onPressed: () => _showChangePasswordDialog(context),
              child: Text("Change Password"),
            ),

            SizedBox(height: 30),
            Divider(),

            // Delete Account Section
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                context.read<MoreBloc>().add(DeleteAccount());
              },
              child: Text("Delete Account", style: TextStyle(color: Colors.white)),
            ),

            // BlocBuilder to show success/error messages
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
  }

  void _showChangePasswordDialog(BuildContext context) {
    TextEditingController currentPasswordController = TextEditingController();
    TextEditingController newPasswordController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Change Password"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: currentPasswordController,
                decoration: InputDecoration(labelText: "Current Password"),
                obscureText: true,
              ),
              TextField(
                controller: newPasswordController,
                decoration: InputDecoration(labelText: "New Password"),
                obscureText: true,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
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
        );
      },
    );
  }
}
