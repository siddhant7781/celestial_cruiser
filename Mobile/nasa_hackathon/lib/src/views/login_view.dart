import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_hackathon/src/blocs/login_cubit.dart';
import 'package:nasa_hackathon/src/components/main_btn.dart';
import 'package:nasa_hackathon/src/data/validator.dart';
import 'package:nasa_hackathon/src/di/injection_instance.dart';
import 'package:nasa_hackathon/src/res/colors.dart';
import 'package:nasa_hackathon/src/views/home_view.dart';
import 'package:nasa_hackathon/src/views/register_view.dart';
import 'package:nasa_hackathon/src/views/state/auth_state.dart';
import 'package:warped_bloc/warped_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends AuthState<LoginView> {
  _LoginViewState() : super(assetName: "assets/bg.jpg");

  late LoginCubit cubit;
  final unameCtrl = TextEditingController(text: "me@me.com");
  final passCtrl = TextEditingController(text: "me");

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    cubit = g<LoginCubit>();
  }

  @override
  String getHeaderText(BuildContext context) {
    return "Sign In";
  }

  @override
  String getHeaderSubText(BuildContext context) {
    return "\"Your gateway to solar travel: Sign in and let's roll\"";
  }

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            BlocListener<LoginCubit, BlocState>(
              bloc: cubit,
              listener: defaultListener(onData: (c, s) {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (c) => const HomeView()),
                  (r) => false,
                );
              }),
              child: const SizedBox(),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: unameCtrl,
              validator: Validator.validateEmpty,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                isDense: true,
                label: const Text("Email"),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: passCtrl,
              obscureText: true,
              validator: Validator.validateEmpty,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                isDense: true,
                label: const Text("Password"),
              ),
            ),
            const SizedBox(height: 24),
            MainBtn(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  cubit.login(unameCtrl.text, passCtrl.text);
                }
              },
              title: "Sign In",
            ),
            const SizedBox(height: 24),
            RichText(
              text: TextSpan(
                text: "Don't have an account? ",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.005,
                  fontFamily: "Montserrat",
                ),
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (c) => const RegisterView(),
                          ),
                        );
                      },
                    text: "Sign up",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.highlight,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
