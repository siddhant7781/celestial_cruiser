// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:nasa_hackathon/src/models/itenary.dart';

class ItenaryFragment extends StatelessWidget {
  final List<Itenary> itenaries;

  const ItenaryFragment({
    Key? key,
    required this.itenaries,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Itinerary',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Space",
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: List.generate(
                  itenaries.length,
                  (i) {
                    final f = itenaries[i];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Day ${f.day}",
                              style: const TextStyle(
                                fontSize: 24,
                                fontFamily: "Space",
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                              f.items.length,
                              (i) {
                                final e = f.items[i];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: ItenaryItem(
                                    duration: e.startTime,
                                    description: e.description,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          // Expanded(
          //   child: ListView.builder(
          //     physics: const BouncingScrollPhysics(),
          //     itemCount: itenaries.length,
          //     itemBuilder: (c, i) {
          //       final e = itenaries[i];
          //       return Padding(
          //         padding: const EdgeInsets.only(bottom: 16.0),
          //         child: ItenaryItem(
          //           duration: e.startTime,
          //           description: e.description,
          //         ),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}

class ItenaryItem extends StatelessWidget {
  final String duration;
  final String description;

  const ItenaryItem({
    Key? key,
    required this.duration,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Transform.rotate(
              angle: pi / 2,
              child: const Icon(Icons.rocket_rounded),
            ),
            // const SizedBox(width: 6),
            // SizedBox(
            //   width: 50,
            //   child: Text(
            //     duration,
            //     style: const TextStyle(
            //       fontFamily: "Montserrat",
            //       fontSize: 16,
            //     ),
            //   ),
            // ),
            const SizedBox(width: 6),
          ],
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: description,
                  style: const TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
