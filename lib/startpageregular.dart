import 'package:flutter/material.dart';
import 'dart:async';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:tutorialapp/questionforreg.dart';
import 'package:tutorialapp/Rinputcode.dart';
import'package:hive/hive.dart';
import 'package:tutorialapp/sidebar.dart';
import 'package:dio/dio.dart';
class Startreg extends StatefulWidget {
  const Startreg({super.key});

  @override
  State<Startreg> createState() => _StartregState();
}

class _StartregState extends State<Startreg> {
  final _mybox = Hive.box('dotBox');
  @override
 void initState(){

    super.initState();
     _getImg();

  }
  @override
  Widget build(BuildContext context) {
    return  
    Theme(
     
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

    ],
          backgroundColor: Colors.grey[200],
         
        ),
         drawer: NavBar(),
        body: Container(
          decoration: BoxDecoration(
        
          color: Colors.white,
            
          ),
          child: Stack(
            children: [
      //         Positioned (
      //   left:260,
      //   top:47,
      //    child: ElevatedButton(
      //    onPressed: () {
      //      _mybox.delete(71);
      //     Navigator.of(context).pop();
      //    },
      //    style: ElevatedButton.styleFrom(
      //      backgroundColor: Colors.red,
      //      shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(10),
      //      ),
      //    ),
      //    child: Text('Logout'),
      //  ),
      //  ),
      //  Align(
      //     alignment: Alignment.center,
      //     child: Padding(
      //       padding: const EdgeInsets.only(bottom:190.0,right: 15,left: 15),
      //       child: Container(
      //             width:double.infinity,
      //             height: 250,
      //             decoration: BoxDecoration(
      //               image: DecorationImage(
      //          image: AssetImage('assets/splash/firstpage.jpg'),
      //          fit: BoxFit.cover),
      //             borderRadius: BorderRadius.all(Radius.circular(20)),
      //             ),
      //            ),
      //     ),
      //   ),
        Align(
          alignment: Alignment.topCenter,
          child:Padding(
            padding: const EdgeInsets.only(top:150.0),
            child: Column(
              children: [
                Text("Berhan Testing platform",style:TextStyle(fontSize: 25,color: Colors.black)),
                Text("Fast, Easy",style:TextStyle(fontSize: 22,color: Colors.black)),
                Text("Realiable",style:TextStyle(fontSize: 18,color: Colors.black)),
              ],
            ),
          )
        ),
        Align(
            alignment: Alignment.bottomCenter,
             child: Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      color:Color.fromARGB(255, 204, 200, 200),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),
      topRight: Radius.circular(10.0),),
                     
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
                  glowColor: Colors.black,
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
      ),
    );

  }
  void _getImg() async{
    print("Img called");
    Response<Map<String, dynamic>> response =
        await Dio().post("https://berhan.addisphoenix.com/getImg.php",data: {
          "email": _mybox.get(100),
          "password":  _mybox.get(110),
        },options: new Options(contentType: "application/x-www-form-urlencoded"));

    var Imag = response.data;
    
    String nameimg = Imag?["Img"];
    print(nameimg);
    _mybox.put(2000, nameimg);
  
     
   }
  }
