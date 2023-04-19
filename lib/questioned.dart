import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_tts/flutter_tts.dart';
import 'package:tutorialapp/registerpageforsight.dart';
import 'package:vibration/vibration.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:vibration/vibration.dart';
import 'package:tutorialapp/questioned.dart';
import 'package:tutorialapp/main.dart';
import 'package:flutter/services.dart';
import 'package:swipe/swipe.dart';
import 'package:tutorialapp/pass.dart';


// import 'package:sensors_plus/sensors_plus.dart';
void main() {
  runApp(Redirect());
}

class Listening extends StatefulWidget {
  const Listening({super.key});

  @override
  State<Listening> createState() => _ListeningState();
}

class _ListeningState extends State<Listening> {
  
 String  lastanswer="none";
  List<String> questions = [
    "Which is the largest ocean in the world?",
    "What is the capital of Australia?",
    "Who is the current Prime Minister of the United Kingdom?",
    "Which is the smallest continent in the world?",
    "What is the currency of Japan?",
    "Who is the founder of Microsoft?",
    "Which country is known as the Land of the Rising Sun?",
    "Which of the following is not a programming language?",
    "Which is the largest country by land area?",
    "Which planet is known as the Red Planet?"
  ];
 
  List choose = [
    "Indian Ocean",
    "Atlantic Ocean",
    "Arctic Ocean",
    "Pacific Ocean",
    " Melbourne",
    "Canberra",
    " Sydney",
    "Perth",
    " Theresa May",
    "Boris Johnson",
    "David Cameron",
    "Tony Blair",
    "Asia",
    "Europe",
    "Antarctica",
    "Australia",
    "Yen",
    "Yuan",
    " Euro",
    "Pound",
    "Bill Gates",
    "Mark Zuckerberg",
    "Jeff Bezos",
    "Elon Musk",
    "China",
    "Japan",
    "South Korea",
    "Vietnam",
    "Python",
    "C++",
    "HTML",
    "SAP",
    "Canada",
    "United States",
    "China",
    "Russia",
    "Venus",
    "Earth",
    "Mars",
    "Jupiter"
  ];
  int totalcorrect=0;
  verify(user,right,total){
   for(int i=0;i<total;i++){
      if(user[i]==right[i]){
       setState(() {
         totalcorrect+=1;
       });
      
      }
   }}
  List answers = [4, 2, 2, 4, 1, 1, 2, 4, 4, 3];
  List useranswers = [];
  int Determiner = 0;
  bool floodgate = false;
  int currentindex = 0;
  void addtouserlist() {}
  void SensorManager() {}
  int c1 = 0, c2 = 1, c3 = 2, c4 = 3;
  double x = 0, y = 0, z = 0;
  double gx = 0, gy = 0, gz = 0;
  String anylong = "";
  FlutterTts flutterTts = FlutterTts();
  void speakthewhole() {
    print(useranswers);
    setState(() {
      anylong = questions[currentindex] +
          "." +
          "   " "A.  " +
          choose[c1] +
          "." +
          " " "B.  " +
          choose[c2] +
          "." +
          "  " "C. " +
          choose[c3] +
          "." +
          "  " "D.  " +
          choose[c4] +
          ".";
    });
    FlutterTts flutterTts = FlutterTts();
    flutterTts.setSpeechRate(0.4);
    flutterTts.speak(anylong);
  }
  
  String anylarge = "Now that you are ready to answer,I am listening";
  @override
  void initState() {
    () {
      Vibration.vibrate();
    };
    setState(() {
      anylong = questions[currentindex] +
          "." +
          "   " "A.  " +
          choose[c1] +
          "." +
          " " "B.  " +
          choose[c2] +
          "." +
          "  " "C. " +
          choose[c3] +
          "." +
          "  " "D.  " +
          choose[c4] +
          ".";
    });
    FlutterTts flutterTts = FlutterTts();
    flutterTts.setSpeechRate(0.4);
    flutterTts.speak(anylong);

    super.initState();
     
  }
   

  previous(){
    useranswers.removeLast();
    
    setState(() {
                    if (currentindex > 0) {
                      currentindex--;
                       c1-=4;
                       c2-=4;
                       c3-=4;
                       c4-=4;
                    } else if (currentindex == 0) {
                      setState(() {
                        currentindex = currentindex;
                      });
                    }
                  });
                  speakthewhole();

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(25.0),
              child: Container(
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
                  child: Center(
                      child: Text(
                    "Beta",
                    style: TextStyle(color: Colors.white),
                  ))),
            ),
            body: GestureDetector(
                onTap: () {
                  speakthewhole();
                  HapticFeedback.vibrate();
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
                    if (currentindex < questions.length-1) {
                      currentindex++;
                      c1 += 4;
                      c2 += 4;
                      c3 += 4;
                      c4 += 4;
                    } else if (currentindex == questions.length-1) {
                      setState(() {
                        currentindex = currentindex;

                      });
          
                   verify(useranswers, answers, questions.length);
                   flutterTts.stop();
                               Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Pass(numberofquestions:questions.length,total:totalcorrect)),
          );

                    }
                  });
                  speakthewhole();
                },
                child: Swipe(
                  onSwipeRight: previous,
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
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions[currentindex],
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: SizedBox(
                              width: double.infinity,
                              height: 70,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  choose[c1],
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 83, 80, 80),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 254, 255, 253),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: SizedBox(
                              width: double.infinity,
                              height: 70,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  choose[c2],
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 83, 80, 80),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 254, 255, 253),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: SizedBox(
                              width: double.infinity,
                              height: 70,
                              child: ElevatedButton(
                                onPressed: () {
                                  print('onPressed prcessed');
                              Vibration.vibrate().catchError((e)=> print(e));
                
                                
                                },
                                child: Text(
                                  choose[c3],
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 83, 80, 80),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 254, 255, 253),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: SizedBox(
                              width: double.infinity,
                              height: 70,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  choose[c4],
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 83, 80, 80),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 254, 255, 253),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ))));
  }
}
