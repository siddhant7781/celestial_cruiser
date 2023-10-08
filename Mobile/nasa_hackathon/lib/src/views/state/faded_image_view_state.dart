// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:nasa_hackathon/src/res/colors.dart';
import 'package:nasa_hackathon/src/res/styles.dart';

abstract class FadedImageViewState<T extends StatefulWidget> extends State<T> {
  final double height;
  final String assetName;

  FadedImageViewState({
    this.height = 545.0,
    required this.assetName,
  });

  Widget getHeader(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0, left: 16, right: 16),
        child: Text(
          getHeaderText(context),
          textAlign: TextAlign.center,
          style: Styles.header,
        ),
      ),
    );
  }

  String getHeaderText(BuildContext context) {
    return 'Welcome to\nBYSST Music';
  }

  Widget body(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: height,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(assetName),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          AppColors.background,
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                  getHeader(context),
                ],
              ),
            ),
            body(context),
          ],
        ),
      ),
    );
  }
}
