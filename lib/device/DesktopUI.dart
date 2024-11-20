import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Desktopui extends StatefulWidget {
  const Desktopui({super.key});

  @override
  State<Desktopui> createState() => _DesktopuiState();
}

class _DesktopuiState extends State<Desktopui> {

  int _selectinder= 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Row(
        children: [
          SizedBox(
            width: 250,
            child: ColoredBox(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [

                    Container(
                      child: ListTile(
                        title: Text('Class Joining', style: TextStyle( fontWeight: _selectinder ==0 ? FontWeight.w500 : FontWeight.w400),),
                        leading: _selectinder == 0 ? Icon(Icons.video_call):Icon(Icons.video_call_outlined),
                        onTap: (){
                          _selectinder =0;
                        setState(() {});
                        }
                      ),
                      decoration: BoxDecoration(
                          color: _selectinder == 0 ? Colors.amberAccent : Colors.transparent,
                          borderRadius: BorderRadius.circular(8)
                      ),
                    ),



                    Container(
                      child: ListTile(
                        title: Text('My Courses',style: TextStyle( fontWeight: _selectinder ==1 ? FontWeight.w500 : FontWeight.w400),),
                        leading: _selectinder == 1 ? Icon(Icons.book):Icon(Icons.book),
                          onTap: (){
                            _selectinder =1;
                            setState(() {});
                          }
                      ),
                      decoration: BoxDecoration(
                          color: _selectinder == 1 ? Colors.amberAccent : Colors.transparent,
                          borderRadius: BorderRadius.circular(8)
                      ),
                    ),

                    Container(
                      child: ListTile(
                        title: Text('Recordings',style: TextStyle( fontWeight: _selectinder ==2 ? FontWeight.w500 : FontWeight.w400),),
                        leading: _selectinder == 2 ? Icon(Icons.play_arrow):Icon(Icons.play_arrow_outlined),
                          onTap: (){
                            _selectinder =2;
                            setState(() {});
                          }
                      ),
                      decoration: BoxDecoration(
                          color: _selectinder == 2 ? Colors.amberAccent : Colors.transparent,
                          borderRadius: BorderRadius.circular(8)
                      ),
                    ),

                    Container(
                      child: ListTile(
                          title: Text('Resources',style: TextStyle( fontWeight: _selectinder ==3 ? FontWeight.w500 : FontWeight.w400),),
                          leading: _selectinder == 3 ? Icon(Icons.folder_copy_rounded):Icon(Icons.folder_copy_outlined),
                          onTap: (){
                            _selectinder =3;
                            setState(() {});
                          }
                      ),
                      decoration: BoxDecoration(
                          color: _selectinder == 3 ? Colors.amberAccent : Colors.transparent,
                          borderRadius: BorderRadius.circular(8)
                      ),
                    ),

                    Container(
                      child: ListTile(
                          title: Text('Build My CV',style: TextStyle( fontWeight: _selectinder ==4 ? FontWeight.w500 : FontWeight.w400),),
                          leading: _selectinder == 4 ? Icon(Icons.my_library_books):Icon(Icons.library_books_outlined),
                          onTap: (){
                            _selectinder =4;
                            setState(() {});
                          }
                      ),
                      decoration: BoxDecoration(
                          color: _selectinder == 4 ? Colors.amberAccent : Colors.transparent,
                          borderRadius: BorderRadius.circular(8)
                      ),
                    ),
                    
                    Expanded(child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage('https://scontent.fbzl5-1.fna.fbcdn.net/v/t39.30808-6/461430012_122191430114074736_7096328490961749264_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeG0CvfLh-6JzSs-M0MxE7wqutIE2kEEm2-60gTaQQSbbx01rm8fBnoD4x15xCmPzjpqsYimBCdKEe9sXDpri4_7&_nc_ohc=BXV3wcHMEdsQ7kNvgHmjqee&_nc_zt=23&_nc_ht=scontent.fbzl5-1.fna&_nc_gid=A3qbFXA9d2Eio9CwqyKdcED&oh=00_AYBXLIypvrc2_MXLcgczqcAWcl3nv2RkHfRgA2Xu_Y11-A&oe=67432E2B'),
                          ),
                          title: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            child: Text('My Profile',style: TextStyle(fontWeight: FontWeight.w700),),
                          ),
                        ),
                      ),
                    ))

                  ],
                ),
              ),
            ),
          ),

          Expanded(
            child: Center(child: Text('Desktop UI', style: TextStyle(fontSize: 30),),),
          ),
        ],
      ),
    );
  }
}
