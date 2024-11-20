import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mobileui extends StatefulWidget {
  const Mobileui({super.key});

  @override
  State<Mobileui> createState() => _MobileuiState();
}

class _MobileuiState extends State<Mobileui> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Nahid'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: CircleAvatar(
                backgroundImage: NetworkImage('https://scontent.fbzl5-1.fna.fbcdn.net/v/t39.30808-6/461430012_122191430114074736_7096328490961749264_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeG0CvfLh-6JzSs-M0MxE7wqutIE2kEEm2-60gTaQQSbbx01rm8fBnoD4x15xCmPzjpqsYimBCdKEe9sXDpri4_7&_nc_ohc=BXV3wcHMEdsQ7kNvgHmjqee&_nc_zt=23&_nc_ht=scontent.fbzl5-1.fna&_nc_gid=A3qbFXA9d2Eio9CwqyKdcED&oh=00_AYBXLIypvrc2_MXLcgczqcAWcl3nv2RkHfRgA2Xu_Y11-A&oe=67432E2B'),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amberAccent,
        unselectedItemColor: Colors.black45,
        backgroundColor: Colors.white,
        useLegacyColorScheme: true,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_call),
            label: 'Class joining',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow),
            label: 'Recording',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
