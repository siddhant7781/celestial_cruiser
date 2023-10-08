import 'package:flutter/material.dart';
import 'package:nasa_hackathon/src/core/constants/assets.dart';
import 'package:nasa_hackathon/src/views/booking_history_view.dart';
import 'package:nasa_hackathon/src/views/home_view.dart';
import 'package:nasa_hackathon/src/views/login_view.dart';

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.bg),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.dashboard),
                  title: const Text(
                    'Explore',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (c) => const HomeView(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.history_outlined),
                  title: const Text(
                    'Booking History',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (c) => const BookingHistoryView(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(
              'Logout',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (c) => const LoginView(),
                ),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
