import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:tutorialapp/questionforreg.dart';
import 'package:tutorialapp/Rinputcode.dart';
import'package:hive/hive.dart';
class Startreg extends StatefulWidget {
  const Startreg({super.key});

  @override
  State<Startreg> createState() => _StartregState();
}

class _StartregState extends State<Startreg> {
  final _mybox = Hive.box('dotBox');
  @override
  Widget build(BuildContext context) {
    return  
    Scaffold(
      body: Container(
        decoration: BoxDecoration(
      
        color: Colors.grey[200],
          
        ),
        child: Stack(
          children: [
            Positioned (
      left:240,
      top:47,
       child: ElevatedButton(
       onPressed: () {
         _mybox.delete(71);
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
     ),
   Positioned(
        top:100,
        left:12,
        child: Container(
            width:335,
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
         image: AssetImage('assets/splash/firstpage.jpg'),
         fit: BoxFit.cover),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
           ),
      ),
      
      Align(
          alignment: Alignment.bottomCenter,
           child: Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    color:Colors.grey[800],
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       AvatarGlow(
                child: ClipOval(
                  child: ElevatedButton(
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>InputcodeRR()));},
                    child: Text("Start",style: TextStyle(fontSize: 30,color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 236, 112, 40),
                      padding: EdgeInsets.all(20.0), // Increase the padding
                      minimumSize: Size(130.0, 130.0), // Set a minimum size for the button
                    ),
                  ),
                ),
                endRadius: 100,
                glowColor: Color.fromARGB(255, 255, 255, 255),
                duration: Duration(milliseconds: 2000),
                repeatPauseDuration: Duration(milliseconds: 100),
              
              ),
                    ],
                  ),
                ),
         ),
 
           
          ],
        ),
          
        
      ),
    );

  }
}