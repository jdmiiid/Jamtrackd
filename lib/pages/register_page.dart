import 'package:Jamtrackd/widgets/bottom_nav_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/firebase_firestore_providers.dart';
import '../models/special_user_data.dart';
import '../providers/firebase_auth_providers.dart';
import '../services/firebase_auth/firebase_storage_service.dart';
import '../widgets/register_avatar.dart';
import '../widgets/root_app_bar.dart';

class ProfileInfoPage extends ConsumerWidget {
  ProfileInfoPage({super.key});

  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _regEmail = TextEditingController();
  final TextEditingController _regPassword = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(firebaseAuthCurrentUserProvider) != null) {
      final SpecialUserData? tappedUser = ref.watch(tappedUserDataProvider);
      final List<String> names = tappedUser!.displayName!.split(' ');
      return Scaffold(
        appBar: RootNavAppBar(
          ref: ref,
          title: Text(
            'Edit Profile',
            style: GoogleFonts.pacifico(fontSize: 30),
          ),
          appBar: AppBar(),
        ),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
              sliver: SliverToBoxAdapter(
                child: _buildWidgetWithLabel(
                  labelText: 'Profile Picture',
                  child: Stack(children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundImage:
                          CachedNetworkImageProvider(tappedUser.photoURL!),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ))
                  ]),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              sliver: SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildWidgetWithLabel(
                      labelText: 'Bio',
                      child: const TextField(
                        maxLines: null,
                        decoration: InputDecoration(
                            hintText:
                                'A brief summary of you and your tastes...'),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(children: [
                            Expanded(
                                flex: 4,
                                child: _buildWidgetWithLabel(
                                  labelText: 'First Name',
                                  child: _buildEditTextField(
                                      controller: _firstName, name: names[0]),
                                )),
                            const Expanded(child: SizedBox()),
                            Expanded(
                              flex: 4,
                              child: _buildWidgetWithLabel(
                                labelText: 'Last Name',
                                child: _buildEditTextField(
                                    controller: _lastName, name: names[1]),
                              ),
                            ),
                          ]),
                          _buildWidgetWithLabel(
                            labelText: 'Email',
                            child: _buildEditTextField(controller: _regEmail),
                          ),
                          _buildWidgetWithLabel(
                              labelText: 'Username',
                              child: IntrinsicHeight(
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                        flex: 15,
                                        child: _buildEditTextField(
                                            controller: _username,
                                            name: tappedUser.username)),
                                    const Expanded(child: SizedBox()),
                                    Expanded(
                                      flex: 11,
                                      child: TextButton(
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .surface),
                                        child: const Row(
                                          children: [
                                            Text(
                                              'Edit Password',
                                            ),
                                            Icon(
                                              Icons.chevron_right_rounded,
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: TextButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).colorScheme.primary)),
                        onPressed: () {
                          print('update specialuserdata here');
                        },
                        child: Text(
                          'Update Profile',
                          style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavBar(),
      );
    } else {
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
  }

  Widget _buildWidgetWithLabel(
      {required String labelText, required Widget child}) {
    return Column(
      children: [
        Align(alignment: Alignment.centerLeft, child: Text(labelText)),
        child,
      ],
    );
  }

  Widget _buildEditTextField(
      {required TextEditingController controller, String? name}) {
    return TextFormField(
      controller: controller..text = name ?? '',
      decoration: const InputDecoration(
        filled: true,
        border: OutlineInputBorder(
            gapPadding: 0, borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
      autocorrect: false,
    );
  }

  Widget _buildRegisterTextField({
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
                    child: _buildRegisterTextField(
                      controller: _firstName,
                      hintText: 'First Name*',
                      validator: (firstname) {
                        if (firstname!.trim().isEmpty) {
                          return "First name required";
                        }
                        return null;
                      },
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Expanded(
                    flex: 6,
                    child: _buildRegisterTextField(
                      controller: _lastName,
                      hintText: 'Last Name*',
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "Last Name Required";
                        }
                        return null;
                      },
                    ),
                  )
                ],
              ),
              _buildRegisterTextField(
                controller: _username,
                hintText: 'Username*',
                validator: (username) {
                  if (username!.isEmpty || username.length < 3) {
                    return "Username must have 4 characters";
                  } else if (!RegExp(r'^\S+$').hasMatch(username)) {
                    return "Username cannot contain spaces";
                  }
                  return null;
                },
              ),
              _buildRegisterTextField(
                controller: _regEmail,
                hintText: 'Email*',
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter email";
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: _buildRegisterTextField(
                      controller: _regPassword,
                      hintText: 'Password*',
                      obscureText: true,
                      validator: (password) {
                        if (password!.length < 5) {
                          return "Must be at least 6 characters";
                        }
                        return null;
                      },
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 6,
                    child: _buildRegisterTextField(
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
                        return null;
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
