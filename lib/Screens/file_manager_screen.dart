
import 'package:file_manager_ui/Screens/files_pages_screen.dart';
import 'package:file_manager_ui/Screens/home_screen.dart';
import 'package:file_manager_ui/Screens/profile_screen.dart';
import 'package:file_manager_ui/Screens/trash_screen.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class FileManagerScreen extends StatefulWidget {
  const FileManagerScreen({super.key});

  @override
  State<FileManagerScreen> createState() => _FileManagerScreenState();
}

class _FileManagerScreenState extends State<FileManagerScreen> {
  List<Widget> screenList = [
    HomeScreen(),
    FilesPage(),
    TrashScreen(),
    ProfileScreen()
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: SalomonBottomBar(
        items: [
          SalomonBottomBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.blue[900],
              ),
              title: Text(
                'Home',
                style: TextStyle(
                  color: Colors.blue[900],
                ),
              )),
          SalomonBottomBarItem(
              icon: Icon(
                Icons.drive_file_move_sharp,
                color: Colors.blue,
              ),
              title: Text('Files')),
          SalomonBottomBarItem(
              icon: Icon(
                Icons.delete_forever,
                color: Colors.red,
              ),
              title: Text(
                'Trash',
                style: TextStyle(
                  color: Colors.red,
                ),
              )),
          SalomonBottomBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.green,
              ),
              title: Text(
                'Profile',
                style: TextStyle(
                  color: Colors.green,
                ),
              )),
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
      ),body: Column(
        children: [
          Expanded(child: screenList[currentIndex]),
        ],
      ),
      ),
    );
  }
}
