import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tutorialapp/inputcode.dart';
import 'package:tutorialapp/main.dart';
import 'package:tutorialapp/sidebar.dart';
import 'package:dio/dio.dart';
import 'package:tutorialapp/sidebarsight.dart';
import 'package:flutter_tts/flutter_tts.dart';
class Debuding extends StatefulWidget {
  const Debuding({super.key});

  @override
  State<Debuding> createState() => _DebudingState();
}

class _DebudingState extends State<Debuding> {
  final _mybox = Hive.box('dotBox');
  FlutterTts flutterTts = FlutterTts();
  @override
   void initState(){
     flutterTts.setSpeechRate(0.4);
    flutterTts.speak("You have successfully logged in, you are now at your dashboard page, here you have two options you can either take a practice test by swiping to the left, or you can moveon to the internet questions by swiping to the right");
    super.initState();
     _getImg();

  }
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
        body:GestureDetector(
          onTap: () {
             flutterTts.setSpeechRate(0.4);
    flutterTts.speak("You are now at your dashboard page, here you have two options you can either take a practice test by swiping to the left, or you can moveon to the internet questions by swiping to the right");
    
          },
          onHorizontalDragEnd: (DragEndDetails details) {
    if (details.velocity.pixelsPerSecond.dx > 0) {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Inputcode()));
    };
     if (details.velocity.pixelsPerSecond.dx < 0) {
       Navigator.of(context).push(MaterialPageRoute(builder:(context)=>Redirect()));
    };
    },
          child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
          color:Colors.white,
              ),
              child: Stack(
          children: [
               
              Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom:190.0,right:40 ,left: 40,top: 15),
            child: Container(
                  width:230,
                  height: 300,
                  
                  decoration: BoxDecoration(
                    image: DecorationImage(
               image: AssetImage('assets/splash/par.png'),
               scale: 0.5,
               fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                 ),
          ),
              ),
           Align(
            alignment: Alignment.bottomCenter,
             child: Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      color:Color.fromARGB(255, 204, 200, 200),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left:10.0,right:10.0,top:40,bottom: 40 ),
                            child: Row(
                              
                              children: [
                               
                                Expanded(
                                  child: Container(
                                   height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      
                                      
                                        //              
                                    ),
                                    child: TextButton(onPressed: (){
                                       flutterTts.setSpeechRate(0.4);
    flutterTts.speak("You are now at your dashboard page, here you have two options you can either take a practice test by swiping to the left, or you can moveon to the internet questions by swiping to the right");
    
                                      }, child: Text("Start Exam",style: TextStyle(color: Colors.black,fontSize: 20),)),
                                  ),
                                ),
                                SizedBox(
                                  width: 17,
                                ),
                                 
                                 Expanded(
                                   child: Container(
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 236, 112, 40),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      // border: Border.all(
                                      //    color: Colors.white,
                                      // ),
                                    ),
                                    child: TextButton(onPressed: (){
                                      flutterTts.setSpeechRate(0.4);
    flutterTts.speak("You are now at your dashboard page, here you have two options you can either take a practice test by swiping to the left, or you can moveon to the internet questions by swiping to the right");
    
                                    }, child: Text("Practice Test",style: TextStyle(color: Colors.white,fontSize: 20),)),
                                                       ),
                                 ),
                                        
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
           ),
          ],
              ),
            ),
        )));

  }
   void _getImg() async{
    print("Img called");
    Response<Map<String, dynamic>> response =
        await Dio().post("https://berhan.addisphoenix.com/getImg.php",data: {
          "email": _mybox.get(80),
          "password":  _mybox.get(90),
        },options: new Options(contentType: "application/x-www-form-urlencoded"));

    var Imag = response.data;
    
    String nameimg = Imag?["Img"];
    print(nameimg);
    _mybox.put(2100, nameimg);
  
     
   }

}