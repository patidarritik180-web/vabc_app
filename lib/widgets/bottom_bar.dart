import 'package:flutter/material.dart';
import 'package:vabc_app/screens/home_screen/home_page.dart';
import 'package:vabc_app/screens/libraryscreen/library_page.dart';
import 'package:vabc_app/screens/profilescreen/profile_page.dart';
import 'package:vabc_app/screens/searchscreen/search_page.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    const HomePage(),
    const LibraryPage(),
    const SearchPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,

      body: pages[selectedIndex],

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: Container(
        height: 72,
        width: 72,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),

          gradient: const LinearGradient(
            colors: [Color(0xFFFF7A30), Color(0xFFFF6B00)],
          ),

          boxShadow: [
            BoxShadow(
              color: Colors.orange.withOpacity(0.35),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),

        child: FloatingActionButton(
          elevation: 0,
          backgroundColor: Colors.transparent,

          onPressed: () {},

          child: Image.asset('assets/images/askai.png', fit: BoxFit.cover),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 18),

        child: Container(
          height: 72,

          decoration: BoxDecoration(
            color: Colors.white,

            borderRadius: BorderRadius.circular(32),

            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [
              navItem(index: 0, image: 'assets/images/homeicon.png'),

              navItem(index: 1, image: 'assets/images/Libraryicon.png'),

              const SizedBox(width: 55),

              navItem(index: 2, image: 'assets/images/Searchicon.png'),

              navItem(index: 3, image: 'assets/images/profileicon.png'),
            ],
          ),
        ),
      ),
    );
  }

  Widget navItem({
    required int index,
    required String image,
    // required String label,
  }) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Image.asset(
            image,
            height: 37,
            width: 33,

            color: isSelected
                ? const Color(0xFFFF6B35)
                : const Color(0xFF94A3B8),
          ),

          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
