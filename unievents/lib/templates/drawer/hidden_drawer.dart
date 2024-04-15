import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:unievents/templates/EventTime/event_time.dart';
import 'package:unievents/templates/registration/auth.dart';
import 'package:unievents/themes/themes.dart';
import 'package:unievents/wigets/card.dart';
import 'package:unievents/templates/Settings/profile.dart';
import '../homePage/homePage.dart';
import 'package:provider/provider.dart';
import 'package:unievents/SQLite/database_helper.dart';


class Hidden_Drawer extends StatefulWidget {
  const Hidden_Drawer({super.key});

  @override
  State<Hidden_Drawer> createState() => _Hidden_DrawerState();
}

class _Hidden_DrawerState extends State<Hidden_Drawer> {
  List<ScreenHiddenDrawer> _pages = [];
  final db = DatabaseHelper();

  void initState() {
    super.initState();

    _pages = [
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: "HOME",
            baseStyle:
                TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 16.0),
            colorLineSelected: Colors.white,
            selectedStyle: const TextStyle(color: Colors.black),
          ),
          const HomePage()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: "EVENTS",
            baseStyle:
                TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 16.0),
            colorLineSelected: Colors.white,
            selectedStyle: const TextStyle(color: Colors.black),
          ),
          const Event_Time()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: "My Participitions",
            baseStyle:
                TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 16.0),
            colorLineSelected: Colors.white,
            selectedStyle: const TextStyle(color: Colors.black),
          ),
          CardPage()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: "Log Out",
            baseStyle:
                TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 16.0),
            colorLineSelected: primaryColor,
            selectedStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
            onTap: () {
              db.logOut();
              Get.to(const AuthScreen());
            },
          ),
          const AuthScreen()),
    ];
  }

   @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DatabaseHelper>(
      create: (context) => DatabaseHelper(), // Provide an instance of DatabaseHelper
      child: Scaffold(
        body: HiddenDrawerMenu(
          elevationAppBar: 0,
          backgroundColorAppBar: primaryColor,
          backgroundColorContent: Colors.white,
          actionsAppBar: [
            Icon(Icons.notifications),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () => Get.to(() => const Profile()),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/default.jpg'),
              ),
            ),
            SizedBox(width: 10),
          ],
          verticalScalePercent: 85.0,
          slidePercent: 50.0,
          screens: _pages,
          backgroundColorMenu: primaryColor,
        ),
      ),
    );
  }
}