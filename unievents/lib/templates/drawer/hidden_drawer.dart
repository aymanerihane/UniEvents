import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import '../homePage/homePage.dart';

class Hidden_Drawer extends StatefulWidget {
  const Hidden_Drawer({super.key});

  @override
  State<Hidden_Drawer> createState() => _Hidden_DrawerState();
}

class _Hidden_DrawerState extends State<Hidden_Drawer> {

  List<ScreenHiddenDrawer> _pages = [];

  void initState(){
    super.initState();
    
    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "HOME",
          baseStyle: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 16.0),
          colorLineSelected: Colors.white,
          selectedStyle: TextStyle(color: Colors.black),
        ),
        HomePage()
      ),
      
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      verticalScalePercent: 85.0,
      slidePercent : 50.0,
      screens: _pages, 
      backgroundColorMenu: Color.fromARGB(255, 51, 182, 160));
      
  }
}