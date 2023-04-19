// import 'dart:js_util';
import 'dart:async';
import 'package:flutter/material.dart';

class Startquestionforreg extends StatefulWidget {
  // const Startquestionforreg({super.key});
   final int seconds;

  Startquestionforreg({required this.seconds});
  @override
  State<Startquestionforreg> createState() => _StartquestionforregState();
}

class _StartquestionforregState extends State<Startquestionforreg> {
   late int _secondsRemaining;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _secondsRemaining = widget.seconds;
    _startTimer();
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
          _secondsRemaining -= 1;
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
       currentindex++;
                                  c1+=4;
                                  c2+=4;
                                  c3+=4;
                                  c4+=4;
     });   
   }
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
   List answers = [4, 2, 2, 4, 1, 1, 2, 4, 4, 3];
  List useranswers = [];
  int Determiner = 0;
  bool floodgate = false;
  int currentindex = 0;
  int c1 = 0, c2 = 1, c3 = 2, c4 = 3;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
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
                              child: TweenAnimationBuilder(tween: Tween(begin: 0.0,end: 1.0), duration: Duration(minutes: 20), builder: ((context,value,_) => SizedBox(
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
                                              questions[currentindex],
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
                                                      onPressed: () {
                                                        useranswers.add(1);
                                                        next();
                                                      },
                                                      child: Text(
                                                        choose[c1],
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
                                                      onPressed: () {
                                                        useranswers.add(2);
                                                        next();
                                                      },
                                                      child: Text(
                                                        choose[c2],
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
                                                      onPressed: () {
                                                        useranswers.add(3);
                                                        next();
                                                      },
                                                      child: Text(
                                                        choose[c3],
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
                                                      onPressed: () {
                                                        useranswers.add(4);
                                                        next();
                                                      },
                                                      child: Text(
                                                        choose[c4],
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
    );
  }
}