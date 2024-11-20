import 'package:flutter/material.dart';

class Tabui extends StatefulWidget {
  const Tabui({super.key});

  @override
  State<Tabui> createState() => _TabuiState();
}

class _TabuiState extends State<Tabui> {


  int _selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.none;
  bool showLeading = false;
  bool showTrailing = true;
  double groupAlignment = -1.0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade50,

      body: Row(
        children: <Widget>[
          NavigationRail(
            backgroundColor: Colors.white,
            selectedIndex: _selectedIndex,
            groupAlignment: groupAlignment,
            indicatorShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            indicatorColor: Colors.amberAccent,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: labelType,
            trailing: Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.amber.shade100,
                    child: InkWell(
                      splashColor: Colors.white,
                      onTap: (){},
                    ),
                    backgroundImage: NetworkImage('https://scontent.fbzl5-1.fna.fbcdn.net/v/t39.30808-6/461430012_122191430114074736_7096328490961749264_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeG0CvfLh-6JzSs-M0MxE7wqutIE2kEEm2-60gTaQQSbbx01rm8fBnoD4x15xCmPzjpqsYimBCdKEe9sXDpri4_7&_nc_ohc=BXV3wcHMEdsQ7kNvgHmjqee&_nc_zt=23&_nc_ht=scontent.fbzl5-1.fna&_nc_gid=A3qbFXA9d2Eio9CwqyKdcED&oh=00_AYBXLIypvrc2_MXLcgczqcAWcl3nv2RkHfRgA2Xu_Y11-A&oe=67432E2B'),
                  ),
                ),
              ),
            ),
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.video_call_outlined),
                selectedIcon: Icon(Icons.video_call),
                label: Text('Zoom class'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.book),
                selectedIcon: Icon(Icons.book),
                label: Text('Second'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.play_arrow_outlined),
                selectedIcon: Icon(Icons.play_arrow_rounded),
                label: Text('Third'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.folder_copy_outlined),
                selectedIcon: Icon(Icons.folder_copy_rounded),
                label: Text('Second'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.my_library_books_outlined),
                selectedIcon: Icon(Icons.my_library_books),
                label: Text('Second'),
              ),

            ],
          ),
          // This is the main content.
          Expanded(
            child: Center(child: Text('TAB UI', style: TextStyle(fontSize: 30),),),
          ),
        ],
      ),

    );

  }
}
