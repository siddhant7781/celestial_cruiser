import 'package:flutter/material.dart';
import 'package:nasa_hackathon/src/components/main_btn.dart';
import 'package:nasa_hackathon/src/views/state/auth_state.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends AuthState<RegisterView> {
  _RegisterViewState() : super(assetName: "assets/bg2.jpg");

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
      child: Column(
        children: [
          const SizedBox(height: 16),
          TextFormField(
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
            onTap: () {},
            title: "Sign Up",
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
