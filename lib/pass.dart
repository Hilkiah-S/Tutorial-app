import 'package:flutter/material.dart';
import 'package:tutorialapp/main.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Pass extends StatelessWidget {
 var numberofquestions;

 var total;

Pass({Key? mykey,this.numberofquestions,this.total }):super(key:mykey);
 

  @override
  void initState(){
   
   Speaking();
  }
   FlutterTts flutterTts = FlutterTts();
    
  void Speaking(){
flutterTts.setSpeechRate(0.4);
    flutterTts.speak("Great Job!"+" "+"you got ${total} out of ${numberofquestions} ");
  }
  
// QuizPage  any = new QuizPage ();

//const passed = any.correct;
  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
        backgroundColor: Colors.blueGrey[200],
        body: GestureDetector(
          onTap: Speaking,
          child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            const Color(0xFF3366FF),
                            const Color(0xFF00CCFF),
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Icon(Icons.check,color: Colors.green,size: 200.0),
              Text("Great work",style: TextStyle(color: Colors.white,fontSize: 50),),
              Text("You got ${total}/${numberofquestions}",style: TextStyle(color:Colors.white,fontSize:40 ),),],
            ),
          ),
        ),
      );
    // );
  }
}