import 'package:flutter/material.dart';
import 'package:nasa_hackathon/src/components/custom_animation_widget.dart';
import 'package:nasa_hackathon/src/extensions/int_extension.dart';
import 'package:nasa_hackathon/src/models/package.dart';

class PackageFragment extends StatelessWidget {
  final Package package;

  const PackageFragment({super.key, required this.package});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final h = width * 0.8;
    final left = h * 0.2;
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'TRAVEL TO\n${package.name}',
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Space",
                    ),
                  ),
                  const SizedBox(height: 6),
                  RichText(
                    text: TextSpan(
                      text: "\$",
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                      children: [
                        TextSpan(
                          text: package.price.amountFormat,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        package.distance,
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        height: 5,
                        width: 5,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const Text(
                        "km",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          CustomAnimationWidget(
            child: Container(
              height: h,
              width: h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(package.planetImage!),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const Positioned(
            top: 0,
            bottom: 0,
            right: 16,
            child: Icon(Icons.arrow_forward_ios),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Text(
              package.description,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
