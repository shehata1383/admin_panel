import 'package:admin_panel/features/home/home_page.dart';
import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  static final List<Widget> _widgetOption = [HomePage()];

  int selectedIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: _widgetOption.elementAt(selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
        currentIndex: selectedIndex,
        selectedItemColor: AppColors.themApp,
        unselectedItemColor: Colors.grey,
        onTap: onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: selectedIndex == 0 ? AppColors.themApp : Colors.grey,
            ),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              color: selectedIndex == 1 ? AppColors.themApp : Colors.grey,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
              color: selectedIndex == 2 ? AppColors.themApp : Colors.grey,
            ),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
              color: selectedIndex == 3 ? AppColors.themApp : Colors.grey,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
