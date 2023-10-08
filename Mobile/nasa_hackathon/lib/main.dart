import 'package:flutter/material.dart';
import 'package:nasa_hackathon/src/di/injector.dart';
import 'package:nasa_hackathon/src/res/colors.dart';
import 'package:nasa_hackathon/src/views/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependencies();
  runApp(const SpaceTourismApp());
}

class SpaceTourismApp extends StatelessWidget {
  const SpaceTourismApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        fontFamily: "Montserrat",
        scaffoldBackgroundColor: AppColors.background,
      ),
      home: const SplashView(),
    );
  }
}
