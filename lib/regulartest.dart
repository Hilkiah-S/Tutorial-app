import 'package:flutter/material.dart';
import 'package:tutorialapp/finalpageforRegular.dart';
import 'dart:async';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:tutorialapp/pass.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:hive/hive.dart';
import 'package:dio/dio.dart';
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
  late Timer _timer;
  List answers = [];
addanswers(){
  for(int i=0;i<widget.questions.length;i++){
    answers.add(widget.questions[i].answers);
  }
}
  Future<void> disableScreenshot() async {
  await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
}

  @override
  void initState() {
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
     WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  backgroundcalled(){
     AwesomeNotifications().createNotification(content: NotificationContent(
        id:10,
        channelKey: 'basic_channel',
        title: 'You can not exit, in the middle of exam',
        body: 'You have 15 secs to return',
      ),);
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
     backgroundcalled();
      print('App is in background!');
    }
   if (state == AppLifecycleState.detached) {
     AwesomeNotifications().createNotification(content: NotificationContent(
        id:12,
        channelKey: 'basic_channel',
        title: 'You have exited!',
        body: ', your result so far will be sent to the Web',
      ),);
      print('App is in background!');
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

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FINALPAGERR(answersinternet:answers,answersusers:useranswers)),
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
                          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FINALPAGERR(answersinternet:answers,answersusers:useranswers)),
          );
                        // setState(() {
                        //   currentindex = currentindex;
                        // });
                          
                   
                  //  verify(useranswers, answers, widget.questions.length);
                 
                             };
   }
  
  List<String> questions = [];
 
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
                                                          onPressed: () {
                                                            useranswers.add(1);
                                                          
                                                            next();
                                                          },
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
                                                          onPressed: () {
                                                            useranswers.add(2);
                                                            
                                                            
                                                            next();
                                                          },
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
                                                          onPressed: () {
                                                            useranswers.add(3);
                                                            
                                                            
                                                            next();
                                                          },
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
                                                          onPressed: () {
                                                            useranswers.add(4);
                                                            next();
                                                          },
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
  for(int i=0;i<answers.length;i++){
    if(newanswers[i]==useranswers[i]){
       setState(() {
         correct+=1;
       });
    }
  }
    

void _sendCode() async{
   print(correct);
    Response<Map<String, dynamic>> response =
        await Dio().post("https://berhan.addisphoenix.com/finalscore.php",data: {
          "courseid":_mybox.get(58),
          "score":correct,
          "email": _mybox.get(100),
          "password": _mybox.get(110),
        },options: new Options(contentType: "application/x-www-form-urlencoded"));

    var success = response.data;
    print(success);
    
    
    if(!success?["error"]){
    //  _showMyDialog();
      return;
    }
    else if(success?["error"]){
    // _showErrorDialog();
    }
   
     
    
    
   
  }
}}