import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nasa_hackathon/src/core/constants/assets.dart';
import 'package:nasa_hackathon/src/views/login_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(Assets.splash, onLoaded: (c) {
          Future.delayed(c.duration).then((value) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (c) => const LoginView()),
              (route) => false,
            );
          });
        }),
      ),
    );
  }
}
