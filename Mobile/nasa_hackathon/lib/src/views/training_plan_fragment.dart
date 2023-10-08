// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:nasa_hackathon/src/components/custom_animation_widget.dart';
import 'package:nasa_hackathon/src/core/constants/assets.dart';

class TrainingPlanFragment extends StatefulWidget {
  final void Function() onNextTap;

  const TrainingPlanFragment({
    Key? key,
    required this.onNextTap,
  }) : super(key: key);

  @override
  State<TrainingPlanFragment> createState() => _TrainingPlanFragmentState();
}

class _TrainingPlanFragmentState extends State<TrainingPlanFragment> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final h = width * 0.8;
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          const Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'TRAINING\nPLAN',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Space",
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomAnimationWidget(
            child: Container(
              width: h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.astronaut),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 16,
            child: InkWell(
              onTap: widget.onNextTap,
              child: const Icon(Icons.arrow_forward_ios),
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Text(
              "Anyone who goes to SPACE is\nmandated by the Government to take the\ntraining exercise. Training is done via a special suit.",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
