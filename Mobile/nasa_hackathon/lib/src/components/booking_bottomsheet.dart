import 'package:flutter/material.dart';
import 'package:nasa_hackathon/src/components/main_btn.dart';
import 'package:nasa_hackathon/src/core/constants/assets.dart';

class BookingBottomsheet extends StatelessWidget {
  const BookingBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                height: 5,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Congratulations !!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "You'll receive a message from our team regarding other details of the booking",
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LayoutBuilder(builder: (context, box) {
                        return Image.asset(
                          Assets.astronaut,
                          height: box.maxHeight,
                        );
                      }),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                MainBtn(
                  onTap: () {
                    Navigator.of(context).popUntil((r) => r.isFirst);
                  },
                  title: "Done",
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Future<void> showBookingBottomsheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(16),
        topLeft: Radius.circular(16),
      ),
    ),
    builder: (c) => const BookingBottomsheet(),
  );
}
