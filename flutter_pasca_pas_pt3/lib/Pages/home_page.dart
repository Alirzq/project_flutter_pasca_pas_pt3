import 'package:flutter/material.dart';
import 'package:flutter_pasca_pas_pt3/Controller/bottom_nav_controller.dart';
import 'package:flutter_pasca_pas_pt3/Menu/History.dart';
import 'package:flutter_pasca_pas_pt3/Menu/Home.dart';
import 'package:flutter_pasca_pas_pt3/Menu/Profile.dart';
import 'package:get/get.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatelessWidget {
  final BottomNavController bottomNavController = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[50],
        child: Obx(() {
          return IndexedStack(
            index: bottomNavController.selectedIndex.value,
            children: [
              HomeScreen(),
              HistoryPage(),
              ProfilePage(),
            ],
          );
        }),
      ),
      bottomNavigationBar: Obx(() {
        return SlidingClippedNavBar(
          backgroundColor: Colors.white,
          onButtonPressed: bottomNavController.changeIndex,
          iconSize: 30,
          activeColor: Color(0xFF4A4A4A),
          selectedIndex: bottomNavController.selectedIndex.value,
          barItems: [
            BarItem(
              icon: Icons.home_rounded,
              title: 'Home',
            ),
            BarItem(
              icon: Icons.history_rounded,
              title: 'History',
            ),
            BarItem(
              icon: Icons.person_rounded,
              title: 'Profile',
            ),
          ],
        );
      }),
    );
  }
}
