import 'package:flutter/material.dart';
import 'package:particles_flutter/particles_flutter.dart';
import'package:hive/hive.dart';

import 'package:tutorialapp/sidebarsight.dart';
class Contact {
  final String name;
  final String avatarUrl;
  final String details;

  Contact({required this.name, required this.avatarUrl, required this.details});
}

class SightContact extends StatelessWidget {
  final _mybox = Hive.box('dotBox');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Theme(
     
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
        body: CircularParticleScreen(),
      ),
    ));
  }
}


class CircularParticleScreen extends StatelessWidget {
  const CircularParticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            key: UniqueKey(),
            child: Column(
              children: [
              
          // Add more contacts here
    
                CircularParticle(
                  // key: UniqueKey(),
                  awayRadius: 80,
                  numberOfParticles: 200,
                  speedOfParticles: 0.5,
                  height: screenHeight,
                  width: screenWidth,
                  onTapAnimation: true,
                  particleColor: Color.fromARGB(255, 252, 89, 60).withAlpha(150),
                  awayAnimationDuration: Duration(milliseconds: 600),
                  maxParticleSize: 8,
                  isRandSize: true,
                  isRandomColor: true,
                  randColorList: [
                    Colors.red.withAlpha(210),
                    
                  ],
                  awayAnimationCurve: Curves.easeInOutBack,
                  enableHover: true,
                  hoverColor: Colors.white,
                  hoverRadius: 90,
                  connectDots: true, //not recommended
                ),
              ],
            ),
          ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top:80.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right:8.0,left:8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 212, 208, 208).withOpacity(0.8),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                  ),
                              //
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CircleAvatar(
                                    radius: 40.0,
                                    backgroundImage:  NetworkImage("https://berhan.addisphoenix.com/img/img.jpg"),
                                  ),
                                  SizedBox(height: 16.0),
                                  Text(
                                    "Dawit .M",
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    "dawitm777@gmail.com",
                                    style: TextStyle(fontSize: 14.0),
                                  ),
                                  SizedBox(height: 8.0),
                                  
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 20,),
                          Expanded(
                            child: Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 212, 208, 208).withOpacity(0.8),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                  ),
                              //
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CircleAvatar(
                                    radius: 40.0,
                                    backgroundImage: NetworkImage("https://berhan.addisphoenix.com/img/img1.jpg"),
                                  ),
                                  SizedBox(height: 16.0),
                                  Text(
                                    "Eman .S",
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    "emanmohammedseid@gmail.com",
                                    style: TextStyle(fontSize: 14.0),
                                  ),
                                  SizedBox(height: 8.0),
                                 
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40,),
                     Padding(
                       padding: const EdgeInsets.only(right:8.0,left:8.0),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                            
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 212, 208, 208).withOpacity(0.8),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                  ),
                              //
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CircleAvatar(
                                    radius: 40.0,
                                    backgroundImage:  NetworkImage("https://berhan.addisphoenix.com/img/img2.jpg"),
                                  ),
                                  SizedBox(height: 16.0),
                                  Text(
                                    "Eyuel .M",
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    "eyuelmamuye1@gmail.com",
                                    style: TextStyle(fontSize: 14.0),
                                  ),
                                  SizedBox(height: 8.0),
                                 
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 20,),
                          Expanded(
                            child: Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 212, 208, 208).withOpacity(0.8),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                  ),
                              //
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CircleAvatar(
                                    radius: 40.0,
                                    backgroundImage:  NetworkImage("https://berhan.addisphoenix.com/img/img3.jpg"),
                                  ),
                                  SizedBox(height: 16.0),
                                  Text(
                                    "Kelkias .S",
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    "kelkiasselamu@yahoo.com",
                                    style: TextStyle(fontSize: 14.0),
                                  ),
                                  SizedBox(height: 8.0),
                                 
                                ],
                              ),
                            ),
                          ),
                        ],
                    ),
                     ),
                  ],
    
                ),
              ),
            ),
        ],
      ),
    );
  }
}