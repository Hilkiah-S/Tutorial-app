import 'package:flutter/material.dart';
import'package:hive/hive.dart';
import 'package:tutorialapp/sidebarsight.dart';
class SightAboutus extends StatefulWidget {
  const SightAboutus({super.key});

  @override
  State<SightAboutus> createState() => _AboutusState();
}

class _AboutusState extends State<SightAboutus> {
  String fromweb="Education has undergone a significant transformation with the rise of computerized and online systems. Information technology has emerged as a crucial player in modern education, bringing about remarkable changes to the traditional methods of teaching and learning. With the advent of computers and the internet, educational institutions can now deliver education conveniently and efficiently, without the constraints of time or location.However, one major drawback of these systems is their limited accessibility for visually impaired individuals. Without the necessary accessibility features, visually impaired students may struggle to participate in online exams, which can put them at a disadvantage. That's why we, as a team, are working a project to develop a system that addresses this issue by providing appropriate accessibility features. Our system is designed to cater to the needs of visually impaired individuals, enabling them to participate in online exams with ease. We incorporate features such as text-to-speech functionality, screen readers, making it more accessible for visually impaired individuals.";
final _mybox = Hive.box('dotBox');
  @override
  Widget build(BuildContext context) {
    return Theme(
     
  data: ThemeData(
    iconTheme: IconThemeData(
      color: Color.fromARGB(255, 236, 112, 40) // set the desired color here
    ),
  ),
      child: Scaffold(
                appBar: AppBar(
         
          iconTheme: IconThemeData(
      color: Color.fromARGB(255, 236, 112, 40), // set the desired color here
    ),
    actions: [
      ElevatedButton(
         onPressed: () {
           _mybox.delete(70);
          Navigator.of(context).pop();
         },
         style: ElevatedButton.styleFrom(
           backgroundColor: Colors.red,
           shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
           ),
         ),
         child: Text('Logout'),
       ),

    ],
          backgroundColor: Colors.grey[200],
         
        ),
         drawer: NavBarSS(),
        backgroundColor: Colors.white,
      body: SingleChildScrollView(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top:15.0,right: 30,left: 30,bottom: 20),
            child: Image.asset("assets/splash/logoin.JPG"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("ABOUT",style: TextStyle(fontSize: 20),),
              SizedBox(width: 7,),
              Text("BERHAN",style: TextStyle(fontSize: 20, color: Colors.orange),)
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top:15.0,left:30,right: 30,bottom: 15),
            child: Text(fromweb,style: TextStyle(color:Colors.grey,fontSize: 15),),
          )
        ],
      )),
      ));
  }
}