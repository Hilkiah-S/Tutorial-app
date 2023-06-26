import 'package:flutter/material.dart';
import 'package:tutorialapp/modregularlogin.dart';
import 'package:tutorialapp/registerpageforsight.dart';
import 'package:tutorialapp/regularlogin.dart';
import 'package:flutter_tts/flutter_tts.dart';
class Choosepage extends StatefulWidget {
  const Choosepage({super.key});

  @override
  State<Choosepage> createState() => _ChoosepageState();
}

class _ChoosepageState extends State<Choosepage> {
   FlutterTts flutterTts = FlutterTts();
    
  @override 
  void initState(){
    flutterTts.setSpeechRate(0.4);
    flutterTts.speak("Selam, Welcome to Berhan,......this is the first Page, you can Navigate to our special sections page by swiping to the left, or continue as regular by swiping to the right ");
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: backIsPressed,
      child: Scaffold(
        body: GestureDetector(
            onHorizontalDragEnd: (DragEndDetails details) {
    if (details.velocity.pixelsPerSecond.dx > 0) {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Regregular()));
    };
     if (details.velocity.pixelsPerSecond.dx < 0) {
       Navigator.of(context).push(MaterialPageRoute(builder:(context)=>Regsight()));
    };
    },
          child: Column(
            children: [
              Expanded(
                flex:3,
                child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/splash/sums.jpg"), fit: BoxFit.cover),
                          ),
                          child: Align(
                            alignment:Alignment.bottomCenter,
                            child: Stack(
                              children: [Padding(
                                padding: const EdgeInsets.only(left:5.0,right: 5,bottom: 20),
                                child: Container(
                                   width: 100,
                                   height: 110,
                                   decoration: BoxDecoration(
                                    // border: Border.all(
                                    //   color: Colors.white,
                                    // ),
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                   ),
                                  child: Image.asset("assets/splash/ber.png",fit: BoxFit.cover,)),
                              ),
                            ]),
                          ),
                          ),
              ),
                        Expanded(
                          flex: 2,
                          child: Container(
                          color:Colors.grey[900],
                   child: Column(
                    children: [
                      Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: SizedBox(
                                          height: 100,
                                        
                                          child: Padding(
                                            padding: const EdgeInsets.only(left:50.0,right: 50,top: 10,bottom:5),
                                            child: ElevatedButton(onPressed: 
                                            (){
                                          
                                            }, child: Text("Regular Student",style: TextStyle(fontSize: 23,color: Colors.black),),style:ElevatedButton.styleFrom(
                                              
                                              backgroundColor: Color.fromARGB(255, 221, 220, 220),
                                              shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(20),
                                                      )
                                            ),),
                                          ),
                                        ),
                                      ),
                                      
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                              child: SizedBox(
                                                height: 90,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left:50,right: 50,top: 5),
                                                  child: ElevatedButton(onPressed: (){}, child: Padding(
                                                    padding: const EdgeInsets.all(4.0),
                                                    child: Text("Special Student",style: TextStyle(fontSize: 23,color: Colors.white),),
                                                  ),style:ElevatedButton.styleFrom(
                                                    
                                                    backgroundColor: Color.fromARGB(255, 236, 112, 40),
                                                    
                                                    shape: RoundedRectangleBorder(
                                                                            borderRadius: BorderRadius.circular(20),
                                                            )
                                                  ),),
                                                ),))])),
                    ],
                   ),
                          ])))]),
        )),
    );}
    Future<bool>backIsPressed()async{
   return false;
  }
}