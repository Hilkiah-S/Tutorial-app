import 'package:flutter/material.dart';
import 'package:tutorialapp/finalpage.dart';
import 'dart:async';
import 'package:vibration/vibration.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:tutorialapp/pass.dart';
import 'package:flutter_tts/flutter_tts.dart';
class InternetquestionSight extends StatefulWidget {
  // const InternetquestionSight({super.key});

  List questions;
  int seconds;
  InternetquestionSight({Key? mykey,required this.questions, required this.seconds}):super(key:mykey); 
  @override
  State<InternetquestionSight> createState() => _InternetquestionSightState();
}

class _InternetquestionSightState extends State<InternetquestionSight> {
late int _secondsRemaining;
  late Timer _timer;
  List answers = [];
addanswers(){
  for(int i=0;i<widget.questions.length;i++){
    answers.add(widget.questions[i].answers);
  }
}
String  lastanswer="none";
double gx = 0, gy = 0, gz = 0;
  String anylong = "";
  FlutterTts flutterTts = FlutterTts();
  void speakthewhole() {
    print(useranswers);
    setState(() {
      anylong = widget.questions[currentindex].question +
          "." +
          "   " "A.  " +
          widget.questions[currentindex].choicea +
          "." +
          " " "B.  " +
          widget.questions[currentindex].choiceb+
          "." +
          "  " "C. " +
          widget.questions[currentindex].choicec +
          "." +
          "  " "D.  " +
          widget.questions[currentindex].choiced+
          ".";
    });
    FlutterTts flutterTts = FlutterTts();
    flutterTts.setSpeechRate(0.4);
    flutterTts.speak(anylong);
  }
  
  String anylarge = "Now that you are ready to answer,I am listening";
  @override
  void initState() {
    setState(() {
      anylong = widget.questions[currentindex].question +
          "." +
          "   " "A.  " +
          widget.questions[currentindex].choicea +
          "." +
          " " "B.  " +
          widget.questions[currentindex].choiceb  +
          "." +
          "  " "C. " +
          widget.questions[currentindex].choicec  +
          "." +
          "  " "D.  " +
          widget.questions[currentindex].choiced +
          ".";
    });
    FlutterTts flutterTts = FlutterTts();
    flutterTts.setSpeechRate(0.4);
    flutterTts.speak(anylong);
    super.initState();
    _secondsRemaining = widget.seconds*60;
    _startTimer();
    addanswers();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_secondsRemaining < 1) {
          _timer.cancel();
        } else {
          _secondsRemaining = _secondsRemaining-1;
        }
      });
    });
  }
  

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds';
  }
  static const maxSeconds = 60;
  int seconds = maxSeconds;
  // Timer? timer;
   next(){
       
     setState(() {
                    if (currentindex < widget.questions.length-1) {
                      currentindex++;
                      
                    } else if (currentindex == questions.length-1) {
                      setState(() {
                        currentindex = currentindex;

                      });
          
                   verify(useranswers, answers, questions.length);
                 
                               Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FINALPAGE(answersinternet:answers,answersusers:useranswers)),
          );}});
   }
  List<String> questions = [];
 
  List choose = [];
  List <Icons> imgs=[];
  int totalcorrect=0;
   verify(user,right,total){
   for(int i=0;i<total;i++){
      if(user[i]==right[i]){
       setState(() {
         totalcorrect+=1;
       });
      
      }
   }}
   
  List useranswers = [];
  int Determiner = 0;
  bool floodgate = false;
  int currentindex = 0;
  int c1 = 0, c2 = 1, c3 = 2, c4 = 3;
  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: backIsPressed,
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
                    speakthewhole();
                   
                  },
                  onLongPress: () {
                   
                    setState(() {
                      floodgate = true;
                    });
                    if (floodgate==true) {
                      flutterTts.setSpeechRate(0.4);
                      flutterTts.speak(anylarge);
                      if (true) {
                 
                        gyroscopeEvents.listen((GyroscopeEvent event) {
                          setState(() {
                            // gx = event.x;
                            gy = event.y;
                            gz = event.z;
                          });
                        
                          if (gz >= 2) {
                            flutterTts.setSpeechRate(0.4);
                            flutterTts.speak("You Chose A");
                            Determiner = 1;
                            
                              Vibration.vibrate();
                            setState(() {
                              lastanswer="A";
                            });
                          }
                          if (gz <= -2) {
                            flutterTts.setSpeechRate(0.4);
                            flutterTts.speak("You Chose B");
                            Determiner = 2;
                            
                              Vibration.vibrate();
                            setState(() {
                              lastanswer="B";
                            });
                          }
                          if (gy < -4) {
                            
                              Vibration.vibrate();
                            
                            flutterTts.setSpeechRate(0.4);
                            flutterTts.speak("You Chose C");
                            Determiner = 3;
                            setState(() {
                              lastanswer="C";
                            });
                          } 
                          if (gy > 5) {
                            
                              Vibration.vibrate();
                            
                            flutterTts.setSpeechRate(0.4);
                            flutterTts.speak("You chose D");
                             setState(() {
                              lastanswer="D";
                            });
                            Determiner = 4;
                          }
                        });
                      } else {
                        flutterTts.setSpeechRate(0.4);
                        flutterTts.speak("Please hold your phone still, first");
                      }
                      setState(() {
                        floodgate = false;
                      });
                    }
                  },
                  onLongPressEnd: (details) {
                    
                    setState(() {
                      floodgate = false;
                    });
                    if (Determiner != 0) {
                      flutterTts.speak(
                          "Your answer is set to ${lastanswer}, if you want to change it, longpress again and do so,you can move on to the next question by doubletapping");
                    } else {
                      flutterTts.speak(
                          "You didn't set any answer,Please longpress to give ananswer, if you Doubletap now,it will be considered as you skipped this question ");
                    }
                  },
                   onDoubleTap: () {
                    setState(() {
                      floodgate = false;
                    });
                    useranswers.add(Determiner);
                    setState(() {
                      if (currentindex < widget.questions.length-1) {
                        currentindex++;
                      
                      } else if (currentindex == widget.questions.length-1) {
                        setState(() {
                          currentindex = currentindex;
    
                        });
            
                     verify(useranswers, answers, questions.length);
                     flutterTts.stop();
                                 Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FINALPAGE(answersinternet:answers,answersusers: useranswers)),
            );
    
                      }
                    });
                    speakthewhole();
                  },
          child: Stack(
            children: [
              Container(
                    decoration: new BoxDecoration(
                      color: Colors.grey[900],
                      // gradient: new LinearGradient(
                      //     colors: [
                      //       const Color(0xFF02BB9F),
                      //       const Color(0xFF00CCFF),
                      //     ],
                      //     begin: const FractionalOffset(0.0, 0.0),
                      //     end: const FractionalOffset(1.0, 0.0),
                      //     stops: [0.0, 1.0],
                      //     tileMode: TileMode.clamp),
                    ),
                    child:Padding(
                      padding: const EdgeInsets.only(top:30),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                               Padding(
                                 padding: const EdgeInsets.only(top:90.0),
                                 child: Center(
                                  child: Text(
              _formatDuration(Duration(seconds: _secondsRemaining)),
              style: TextStyle(fontSize: 30,color:Colors.white),
                    ),
                              ),
                               ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top:35,bottom: 20),
                                  child: TweenAnimationBuilder(tween: Tween(begin: 0.0,end: 1.0), duration: Duration(minutes: widget.seconds), builder: ((context,value,_) => SizedBox(
                                    width: 150,
                                    height: 150,
                                    child: CircularProgressIndicator(
                                      value: value,
                                      backgroundColor: Colors.deepOrange,
                                      strokeWidth: 4,
                                    
                                    ),
                                  ))),
                                ),
                              ),
                             
                            ],
                          ),
                          Center(
                                
                                      child: Padding(
                                        padding: const EdgeInsets.only(left:15.0,right: 15,bottom: 8),
                                        child: Container(
                                          width: double.infinity,
                                          height: 400,
                                          decoration:BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(Radius.circular(30))
                                          ) ,
                                          child: Column(
                                           
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(top:15.0, left: 20,right: 10,bottom:20),
                                                child: Text(
                                                  widget.questions[currentindex].question,
                                                  style: TextStyle(
                                                      color: Color.fromARGB(255, 90, 89, 89),
                                                      fontSize: 25,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left:10,right: 10,top:10,bottom: 5),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border.all(
                                                            color:Colors.grey,
                                                          ),
                                                          borderRadius: BorderRadius.all(
                                                            Radius.circular(
                                                              30
                                                            )
                                                          )
                                                        ),
                                                        child: TextButton(
                                                          onPressed: null,
                                                          child: Text(
                                                            widget.questions[currentindex].choicea,
                                                            style: TextStyle(
                                                                color: Color.fromARGB(255, 83, 80, 80),
                                                                
                                                                fontSize: 25),
                                                          ),
                                                          
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left:10,right: 10,top:5,bottom: 5),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border.all(
                                                            color:Colors.grey,
                                                          ),
                                                          borderRadius: BorderRadius.all(
                                                            Radius.circular(
                                                              30
                                                            )
                                                          )
                                                        ),
                                                        child: TextButton(
                                                          onPressed: null,
                                                          child: Text(
                                                             widget.questions[currentindex].choiceb,
                                                            style: TextStyle(
                                                                color: Color.fromARGB(255, 83, 80, 80),
                                                                
                                                                fontSize: 25),
                                                          ),
                                                          
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                             Padding(
                                                padding: const EdgeInsets.only(left:10,right: 10,top:5,bottom: 5),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border.all(
                                                            color:Colors.grey,
                                                          ),
                                                          borderRadius: BorderRadius.all(
                                                            Radius.circular(
                                                              30
                                                            )
                                                          )
                                                        ),
                                                        child: TextButton(
                                                          onPressed: null,
                                                          child: Text(
                                                            widget.questions[currentindex].choicec,
                                                            style: TextStyle(
                                                                color: Color.fromARGB(255, 83, 80, 80),
                                                                
                                                                fontSize: 25),
                                                          ),
                                                          
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left:10,right: 10,top:5,bottom: 5),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border.all(
                                                            color:Colors.grey,
                                                          ),
                                                          borderRadius: BorderRadius.all(
                                                            Radius.circular(
                                                              30
                                                            )
                                                          )
                                                        ),
                                                        child: TextButton(
                                                          onPressed: null,
                                                          
                                                          child: Text(
                                                             widget.questions[currentindex].choiced,
                                                            style: TextStyle(
                                                                color: Color.fromARGB(255, 83, 80, 80),
                                                                
                                                                fontSize: 25),
                                                          ),
                                                          
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
                          
                          ),
                        ],
                      ),
                    )),
            ],
          ),
        ),
      ),
    );
  }
  Future<bool>backIsPressed()async{
   return false;
  }
}