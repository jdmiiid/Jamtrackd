import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/firebase_auth_providers.dart';
import '../services/firebase_auth/firebase_storage_service.dart';
import '../widgets/register_avatar.dart';
import '../widgets/root_app_bar.dart';

class RegisterPage extends ConsumerWidget {
  RegisterPage({super.key});

  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _regEmail = TextEditingController();
  final TextEditingController _regPassword = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Widget _registerForm() {
    return Expanded(
      flex: 5,
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: TextFormField(
                      controller: _firstName,
                      decoration: const InputDecoration(
                          hintText: 'First Name*', filled: true),
                      validator: (firstname) {
                        if (firstname!.trim().isEmpty) {
                          return "First name required";
                        }
                      },
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Expanded(
                    flex: 6,
                    child: TextFormField(
                      controller: _lastName,
                      decoration: const InputDecoration(hintText: 'Last Name*'),
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "Last Name Required";
                        }
                      },
                    ),
                  )
                ],
              ),
              TextFormField(
                controller: _username,
                decoration: const InputDecoration(hintText: 'Username*'),
                validator: (username) {
                  if (username!.isEmpty || username.length < 3) {
                    return "Username must have 4 characters";
                  } else if (!RegExp(r'^\S+$').hasMatch(username)) {
                    return "Username cannot contain spaces";
                  }
                },
              ),
              TextFormField(
                controller: _regEmail,
                decoration: const InputDecoration(hintText: 'Email*'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter email";
                  }
                },
              ),
              TextFormField(
                controller: _phoneNumber,
                decoration: const InputDecoration(hintText: 'Phone Number'),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: TextFormField(
                      controller: _regPassword,
                      decoration: const InputDecoration(
                          hintText: 'Password*', filled: true),
                      obscureText: true,
                      autocorrect: false,
                      validator: (password) {
                        if (password!.length < 5) {
                          return "Must be at least 6 characters";
                        }
                      },
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 6,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Confirm Password',
                        filled: true,
                      ),
                      obscureText: true,
                      autocorrect: false,
                      validator: (confirmpassword) {
                        if (confirmpassword!.isEmpty) {
                          return "Please confirm pass";
                        } else if (_regPassword.text.trim() !=
                            confirmpassword.trim()) {
                          return "Passwords do not match!";
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: RootNavAppBar(
        ref: ref,
        title: Text(
          'Welcome',
          style: GoogleFonts.pacifico(fontSize: 30),
        ),
        appBar: AppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(child: registerAvatar(context, ref)),
            _registerForm(),
            Expanded(
              child: ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) =>
                            const Center(child: CircularProgressIndicator()));

                    final createUserMessage = await ref
                        .watch(firebaseAuthServiceProvider)
                        .createUserWithEmailAndPassword(
                            username: _username.text,
                            phoneNumber: _phoneNumber.text.trim(),
                            firstName: _firstName.text.trim(),
                            lastName: _lastName.text.trim(),
                            email: _regEmail.text,
                            password: _regPassword.text);

                    if (context.mounted) {
                      if (createUserMessage!.isNotEmpty) {
                        FirebaseStorageService().uploadImageAsset(
                            ref, ref.watch(pPicAssetProvider)!);
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(createUserMessage)));
                      }

                      Navigator.of(context).pop();
                    }
                  }
                },
                style: ElevatedButton.styleFrom(shape: const LinearBorder()),
                child: Text(
                  'Sign up',
                  style: GoogleFonts.robotoCondensed(fontSize: 30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
