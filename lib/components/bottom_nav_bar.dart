import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  final void Function(int)? onTabChange;
  const MyBottomNavBar({
    super.key,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      padding: const EdgeInsets.all(10),
      child: GNav(
        onTabChange: onTabChange,
        padding: const EdgeInsets.all(25),
        mainAxisAlignment: MainAxisAlignment.center,
        tabBackgroundColor: Colors.white,
        activeColor: Colors.grey[900],
        color: Colors.grey[700],
        tabBorderRadius: 25,
        gap: 5,
        tabs: [
          GButton(
            icon: Icons.home_outlined,
            text: 'Home',
            textStyle: GoogleFonts.outfit(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          GButton(
            icon: Icons.shopping_bag_outlined,
            text: 'Cart',
            textStyle: GoogleFonts.outfit(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
