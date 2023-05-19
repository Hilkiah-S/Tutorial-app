import 'package:flutter/material.dart';
import 'package:tutorialapp/finalpageforRegular.dart';
import 'dart:async';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:tutorialapp/pass.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:hive/hive.dart';
import 'package:dio/dio.dart';
import 'dart:math';
class InternetquestionSightRR extends StatefulWidget {
  // const InternetquestionSight({super.key});

  List questions;
  int seconds;
  InternetquestionSightRR({Key? mykey,required this.questions, required this.seconds}):super(key:mykey); 
  @override
  State<InternetquestionSightRR> createState() => _InternetquestionSightState();
}

class _InternetquestionSightState extends State<InternetquestionSightRR> with WidgetsBindingObserver  {
  int correct=0;
   final _mybox = Hive.box('dotBox');
late int _secondsRemaining;
int _returnsecondsRemaining=15;
  late Timer _timer;
  late Timer _returntimer;
  List answers = [];
addanswers(){
  for(int i=0;i<widget.questions.length;i++){
    answers.add(widget.questions[i].answers);
  }
}
  Future<void> disableScreenshot() async {
  await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
}
List indexes=[];
List indexescopy=[];
List randomized=[];
late int secstoreturn;
  @override
  void initState() {
     for(int net=0;net<widget.questions.length;net++){
     indexes.add(net);
   }
   indexescopy=List.from(indexes);
    
  var ran = Random();
  while(indexescopy.isNotEmpty){
    var enter = ran.nextInt(indexescopy.length);
    randomized.add(indexescopy[enter]);
    indexescopy.removeAt(enter);
  }
  print(indexes);
  print(indexescopy);
  print(randomized);

    secstoreturn = 15;
     AwesomeNotifications().isNotificationAllowed().then(
   (isAllowed){
    if(!isAllowed){
      AwesomeNotifications().requestPermissionToSendNotifications(); 
    }
   }
    );
    disableScreenshot();
   
    super.initState();
     WidgetsBinding.instance.addObserver(this);
    _secondsRemaining = widget.seconds*60;
    _startTimer();
    addanswers();
  }

  @override
  void dispose() {
    _timer.cancel();
    _returntimer.cancel();
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    
  }
  backgroundcalled(){
     AwesomeNotifications().createNotification(content: NotificationContent(
        id:10,
        channelKey: 'basic_channel',
        title: 'You can not exit, in the middle of exam',
        body: 'You have $_returnsecondsRemaining secs to return',
      ),);
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state)async {
    if (state == AppLifecycleState.paused) {
    await backgroundcalled();
     const returnoneSec = Duration(seconds: 1);
    _returntimer = Timer.periodic(returnoneSec, (timer) {
if (_returnsecondsRemaining == 0) {
          if(useranswers.length==null){
               for(int n=useranswers.length-1;n<answers.length-1;n++){
useranswers.add(0);
          }
          }
         if(useranswers.length<answers.length){
          for(int n=useranswers.length-1;n<answers.length-1;n++){
useranswers.add(0);
          }
          
         }
          compute();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FINALPAGERR(answersusers:correct,numberinternet: widget.questions.length,)),
          );
          _timer.cancel();
          
        } else {
          setState((){
            _returnsecondsRemaining = _returnsecondsRemaining-1;
          });
          backgroundcalled();
        }


    });
      print('App is in background!');
    
  }
   if (state == AppLifecycleState.resumed) {
    setState(() {
      _returnsecondsRemaining=15;
    });
    _returntimer.cancel();
    }
    
  }
  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
     
        if (_secondsRemaining < 1) {
          if(useranswers.length==null){
               for(int n=useranswers.length-1;n<answers.length-1;n++){
useranswers.add(0);
          }
          }
         if(useranswers.length<answers.length){
          for(int n=useranswers.length-1;n<answers.length-1;n++){
useranswers.add(0);
          }
          
         }
        compute();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FINALPAGERR(answersusers:correct,numberinternet: widget.questions.length,)),
          );
          _timer.cancel();
          
        } else {
          setState((){
            _secondsRemaining = _secondsRemaining-1;
          });
        }
         
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
   int totalcorrect=0;
   late int newtotal =0;
   List useranswers = [];
  eachstepverify(){
    print("Useranswer");
    print(useranswers[currentindex]);
    // print(useranswers[currentindex]);
    print("answers");
    print(answers[currentindex]);
    if(useranswers[currentindex]==answers[currentindex]){
        setState(() {
          newtotal+=1;
        });
        
     
    }
    print(newtotal);
  }
   next(){
      print("NEXT IS ENTERED");
          print(useranswers);
          print(answers);
          print(widget.questions.length);
          print(currentindex);
     
                    if (currentindex < widget.questions.length-1) {
                      print("If is Entered");
                      currentindex++;
                    } else if (currentindex == widget.questions.length-1) {
                        print("Else is Entered");
                        compute();
                          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FINALPAGERR(answersusers:correct,numberinternet: widget.questions.length,)),
          );
                        // setState(() {
                        //   currentindex = currentindex;
                        // });
                          
                   
                  //  verify(useranswers, answers, widget.questions.length);
                 
                             };
   }
  
  
 
  List choose = [];
  List <Icons> imgs=[];
 
   
 List newanswers=[];
  int Determiner = 0;
  bool floodgate = false;
  int currentindex = 0;
  int c1 = 0, c2 = 1, c3 = 2, c4 = 3;
  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop:backIsPressed,
      child: Scaffold(
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
                                        child: SingleChildScrollView(
                                          child: Column(
                                           
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(top:15.0, left: 20,right: 10,bottom:20),
                                                child: Text(
                                                  widget.questions[randomized[currentindex]].question,
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
                                                            widget.questions[randomized[currentindex]].choicea,
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
                                                             widget.questions[randomized[currentindex]].choiceb,
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
                                                            widget.questions[randomized[currentindex]].choicec,
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
                                                             widget.questions[randomized[currentindex]].choiced,
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
                        
                        ),
                      ],
                    ),
                  )),
          ],
        ),
      ),
    );
  }
   verify(user,right,total){
   print("VERIFY ENTERED");
  //  for(int i=0;i<total;i++){
    
  //     if(user[i]==right[i]){
  //         print(totalcorrect);
  //        setState(() {
  //           totalcorrect+=1;
  //        });
        
  //        print(totalcorrect);
       
  //     print(totalcorrect);
  //     }
  //  }
   
    
   }
 Future<bool> backIsPressed() async {
  return await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("You can't exit in the Middle of exam"),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Container(
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                       Radius.circular(20),
                  ),
                  border:Border.all(
                    color:Color.fromARGB(255, 242, 155, 40),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("OK",style: TextStyle(color:Color.fromARGB(255, 242, 155, 40), fontSize: 20),),
                  ],
                )),
            ),
          ],
        ),
      ],
    ),
  );
  
}
compute(){
for (int j = 0; j < answers.length; j++) {
  try {
    newanswers.add(int.parse(answers[j]));
  } catch (e) {
    print("Error parsing ${answers[j]}: $e");
  }
}
print("compare the two");
for(int l=0;l<widget.questions.length;l++){
  print("comparing");
print(newanswers[randomized[l]]);
print(useranswers[l]);
}

  for(int i=0;i<answers.length;i++){
    if(newanswers[randomized[i]]==useranswers[i]){
       setState(() {
         correct+=1;
       });
    }
  }
}

// void _sendCode() async{
//    print(correct);
//     Response<Map<String, dynamic>> response =
//         await Dio().post("https://berhan.addisphoenix.com/finalscore.php",data: {
//           "courseid":_mybox.get(58),
//           "score":correct,
//           "email": _mybox.get(100),
//           "password": _mybox.get(110),
//         },options: new Options(contentType: "application/x-www-form-urlencoded"));

//     var success = response.data;
//     print(success);
    
    
//     if(!success?["error"]){
//     //  _showMyDialog();
//       return;
//     }
//     else if(success?["error"]){
//     // _showErrorDialog();
//     }
   
     
    
    
   
//   }
}