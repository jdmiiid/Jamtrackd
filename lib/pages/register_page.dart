import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/firebase_auth_providers.dart';
import '../services/firebase_auth/firebase_storage_service.dart';
import '../widgets/register_avatar.dart';
import '../widgets/root_app_bar.dart';

class RegisterPage extends ConsumerWidget {
  RegisterPage({Key? key}) : super(key: key);

  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _regEmail = TextEditingController();
  final TextEditingController _regPassword = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
            _registerForm(ref),
            const Expanded(child: SizedBox()),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: () async {
                  _submitForm(ref, context);
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

  Widget _buildTextField({
    required TextEditingController controller,
    String hintText = '',
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
      ),
      obscureText: obscureText,
      autocorrect: false,
      validator: validator,
    );
  }

  Widget _registerForm(WidgetRef ref) {
    return Expanded(
      flex: 7,
      child: Form(
        key: formKey,
        autovalidateMode:
            AutovalidateMode.always, // Enable real-time validation
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: _buildTextField(
                      controller: _firstName,
                      hintText: 'First Name*',
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
                    child: _buildTextField(
                      controller: _lastName,
                      hintText: 'Last Name*',
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "Last Name Required";
                        }
                      },
                    ),
                  )
                ],
              ),
              _buildTextField(
                controller: _username,
                hintText: 'Username*',
                validator: (username) {
                  if (username!.isEmpty || username.length < 3) {
                    return "Username must have 4 characters";
                  } else if (!RegExp(r'^\S+$').hasMatch(username)) {
                    return "Username cannot contain spaces";
                  }
                },
              ),
              _buildTextField(
                controller: _regEmail,
                hintText: 'Email*',
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter email";
                  }
                },
              ),
              Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: _buildTextField(
                      controller: _regPassword,
                      hintText: 'Password*',
                      obscureText: true,
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
                    child: _buildTextField(
                      controller: _confirmPassword,
                      hintText: 'Confirm Password',
                      obscureText: true,
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

  Future<void> _submitForm(WidgetRef ref, BuildContext context) async {
    if (formKey.currentState!.validate()) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );

      final pPicAsset = ref.watch(pPicAssetProvider);

      await ref
          .watch(firebaseAuthServiceProvider)
          .createUserWithEmailAndPassword(
            username: _username.text,
            firstName: _firstName.text.trim(),
            lastName: _lastName.text.trim(),
            email: _regEmail.text,
            password: _regPassword.text,
            pPicAsset: pPicAsset,
          )
          .then(
        (createUserMessage) async {
          if (createUserMessage != null) {
            print(createUserMessage);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(createUserMessage)),
            );
          }
        },
      );
    }
  }
}
