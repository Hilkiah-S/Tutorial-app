import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tutorialapp/inputcode.dart';
import 'package:tutorialapp/main.dart';

class Firstsight extends StatefulWidget {
  const Firstsight({super.key});

  @override
  State<Firstsight> createState() => _FirstsightState();
}

class _FirstsightState extends State<Firstsight> {
  
  final _mybox = Hive.box('dotBox');
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height:double.infinity,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 207, 205, 205),
            
           
          ),
          child: Padding(
            padding: const EdgeInsets.only(left:1,right:1.0,top:420),
            child: Positioned(
              top:440.0,
              child: Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  color:Colors.grey[800],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    Container(
                      width: 140,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        
                        
                          //              
                      ),
                      child: TextButton(onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>Inputcode()));
                      }, child: Text("Start Exam",style: TextStyle(color: Colors.black,fontSize: 20),)),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                     
                     Container(
                      width: 140,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 236, 112, 40),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        // border: Border.all(
                        //    color: Colors.white,
                        // ),
                      ),
                      child: TextButton(onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>Redirect()));
                      }, child: Text("Practice Test",style: TextStyle(color: Colors.white,fontSize: 20),)),
                    ),
            
                  ],
                ),
              ),
            ),
          ),


        ),
     Positioned (
      left:240,
      top:60,
       child: ElevatedButton(
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
     ),
     Padding(
       padding: const EdgeInsets.only(left:15.0,right: 15.0,top:150),
       child: Positioned(
        top:100,
        
         child: Container(
          width:double.infinity,
          height: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
       image: AssetImage('assets/splash/firstpage.jpg'),
       fit: BoxFit.cover),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
         ),
       ),
     ),
      ],

    );
  }
}