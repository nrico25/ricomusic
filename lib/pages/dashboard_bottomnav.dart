import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ricomusic/pages/menu/home_menu.dart';
import 'package:ricomusic/pages/menu/profile_menu.dart';
import 'package:ricomusic/pages/menu/search_menu.dart';
import 'package:ricomusic/pages/menu/library.dart';
import 'package:ricomusic/controlleres/dashboard_controller.dart';
import 'package:ricomusic/widget/mycolor.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    //coneccting controller dengan UI
    final DashboardController dashboardController =
        Get.put(DashboardController());

    final List<Widget> menus = [
      HomeMenu(),
      SearchMenu(),
      LibraryMenu(),
      ProfileMenu()
    ];

    return Obx(() {
  return Scaffold(
    body: menus[dashboardController.selectedIndex.value],
    bottomNavigationBar: Container(
      decoration: BoxDecoration(
        color: darkBlue, 
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1, 
            blurRadius: 5, 
            offset: Offset(0, -2), 
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: dashboardController.selectedIndex.value,
        onTap: dashboardController.changeMenu,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.book_outlined), label: "Library"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Profile"),
        ],
        selectedItemColor: lightBlue,
        unselectedItemColor: const Color.fromARGB(255, 134, 134, 134),
        backgroundColor: darkBlue, // Make sure the background color is consistent
        type: BottomNavigationBarType.fixed, // Ensure background color works with 4+ items
      ),
    ),
  );
});

  }
}
