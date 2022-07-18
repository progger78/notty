import 'package:flutter/material.dart';
import '/screens/main_screen/main_screen.dart';
import '/screens/settings/settings.dart';
import '/utils/utils.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> screens = [
    const MainScreen(),
    const Settings(),
  ];
  var _selectedIndex = 0;
  void _onPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onPressed,
        backgroundColor: AppColors.kSecondaryColor,
        selectedItemColor: AppColors.kOrangeColor,
        unselectedItemColor: AppColors.klightGreyColor,
        items: const [
          BottomNavigationBarItem(
              backgroundColor: AppColors.kSecondaryColor,
              icon: Icon(Icons.home),
              label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
        ],
      ),
    );
  }
}
