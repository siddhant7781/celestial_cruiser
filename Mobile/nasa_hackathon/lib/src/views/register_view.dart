import 'package:flutter/material.dart';
import 'package:nasa_hackathon/src/blocs/register_cubit.dart';
import 'package:nasa_hackathon/src/components/main_btn.dart';
import 'package:nasa_hackathon/src/data/validator.dart';
import 'package:nasa_hackathon/src/di/injection_instance.dart';
import 'package:nasa_hackathon/src/views/state/auth_state.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends AuthState<RegisterView> {
  _RegisterViewState() : super(assetName: "assets/bg2.jpg");

  final unameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final RegisterCubit cubit = g();

  @override
  String getHeaderText(BuildContext context) {
    return "Sign Up";
  }

  @override
  String getHeaderSubText(BuildContext context) {
    return "\"Your gateway to solar travel: Sign up and let's roll\"";
  }

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(height: 16),
            TextFormField(
              validator: Validator.validateEmpty,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                isDense: true,
                label: const Text("Username"),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              validator: Validator.validateEmail,
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
              validator: Validator.validatePassword,
              obscureText: true,
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
                  cubit.register(unameCtrl.text, emailCtrl.text, passCtrl.text);
                }
              },
              title: "Sign Up",
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
