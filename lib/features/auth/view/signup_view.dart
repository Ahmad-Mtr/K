import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone/common/common.dart';
import 'package:x_clone/constants/constants.dart';
import 'package:x_clone/features/auth/controller/auth_controller.dart';
import 'package:x_clone/features/auth/view/login_view.dart';
import 'package:x_clone/features/auth/widgets/auth_field.dart';
import 'package:x_clone/theme/pallete.dart';

class SignUpView extends ConsumerStatefulWidget { 
  static route() => MaterialPageRoute(
        builder: (context) => const SignUpView(),
      );
  const SignUpView({super.key});

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  final appbar = UIconstants.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void onSignUp() {
    ref.read(authControllerProvider.notifier).signup(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    final isloading = ref.watch(authControllerProvider);
    return Scaffold(
      appBar: appbar,
      body: isloading
          ? Loader()
          : Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      AuthField(
                        controller: emailController,
                        hintText: 'Email',
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      AuthField(
                        controller: passwordController,
                        hintText: 'Password',
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: RoundedSmallButton(
                          onTap: onSignUp,
                          label: 'Done',
                          backgroundColor: Pallete.whiteColor,
                          textColor: Pallete.backgroundColor,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      RichText(
                        text: TextSpan(
                          text: "Already have an account?",
                          style: const TextStyle(
                              color: Pallete.whiteColor, fontSize: 16),
                          children: [
                            TextSpan(
                              text: '  Log in',
                              style: const TextStyle(
                                  color: Pallete.blueColor, fontSize: 16),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    LoginView.route(),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
