import'package:flutter/material.dart';
import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:dio/dio.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:tutorialapp/firstpage.dart';
import 'package:tutorialapp/sidebarsight.dart';
class FINALPAGE extends StatefulWidget {
   List answersinternet;

 List answersusers;
 int total;
FINALPAGE({Key? mykey,required this.answersinternet,required this.answersusers,required this.total }):super(key:mykey);

  @override
  State<FINALPAGE> createState() => _FINALPAGEState();
}

class _FINALPAGEState extends State<FINALPAGE> {
   final _mybox = Hive.box('dotBox');
int numberofquestions=0;

int correct=0;
List newanswers=[];
compute(){
for (int j = 0; j < widget.answersinternet.length; j++) {
  try {
    newanswers.add(int.parse(widget.answersinternet[j]));
  } catch (e) {
    print("Error parsing ${widget.answersinternet[j]}: $e");
  }
}
  for(int i=0;i<widget.answersinternet.length;i++){
    if(newanswers[i]==widget.answersusers[i]){
       setState(() {
         correct+=1;
       });
    }
  }
    
  print("New Useranswer");
  
}


  FlutterTts flutterTts = FlutterTts();

@override
void initState(){
_sendCode();
flutterTts.speak("You got ${widget.total} out of ${widget.answersinternet.length} ");
// _sendCode();
}
@override
void dispose(){
  flutterTts.stop();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: backIsPressed,
      child:Theme(
     
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
        body: Scaffold(
        body: GestureDetector(
          onTap: (){
          flutterTts.speak("You got ${widget.total} out of ${widget.answersinternet.length} ");
          },
          child: Container(
            decoration:BoxDecoration(
                  image:  DecorationImage(
                  image: AssetImage("assets/splash/thumbs-up.jpg"),
                  fit: BoxFit.cover,
                ),
                  color: Colors.grey[900],
                  
                ) ,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child:Container(
      decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30),
      ),
      child: IconButton(
      icon: Icon(Icons.home),
      onPressed: () {
       Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Choosepage(),
            )); 
      },
      splashRadius: 20,
      tooltip: 'Home',
      iconSize: 40,
      color: Colors.black,
      ),
    )
    ),
                ),
                 Align(
                  alignment: Alignment.bottomCenter,
                   child: Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: Container(
                              height: 200,
                              width:double.infinity,
                               decoration: BoxDecoration(
                      
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      ),
                      color: Colors.white.withOpacity(0.8),
                               ),
                               child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom:8.0),
                            child: Icon(Icons.check_circle_outline,size: 40,color: Colors.green,),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom:15.0),
                            child: Text("You got ${widget.total}/${widget.answersinternet.length} ",style: TextStyle(color:Colors.black,fontSize: 40),),
                          ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                           ElevatedButton(
      style: ElevatedButton.styleFrom(
      backgroundColor: Colors.green, // specify the background color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(90), // specify the border radius
      ),
      minimumSize: Size(290, 40), // specify the minimum width and height of the button
      ),
      onPressed: () {
       _sendCode();
      },
      child: Text('Complete',style: TextStyle(fontSize: 20),),
    ),
    
    
                              ],
                            ),
                        ],
                      ),
                               )),
                   ),
                 ),
        
       
              ],
            ),
          ))
          ),
    )));
  }
  void _sendCode() async{
   print(_mybox.get(57));
    print(correct);
   print(_mybox.get(80));
    print(_mybox.get(90));
    Response<Map<String, dynamic>> response =
        await Dio().post("https://berhan.addisphoenix.com/finalscore.php",data: {
          "courseid":_mybox.get(57),
          "score":widget.total,
          "email": _mybox.get(80),
          "password": _mybox.get(90),
        },options: new Options(contentType: "application/x-www-form-urlencoded"));

    var success = response.data;
    print(success);
    
    
    if(!success?["error"]){
     _showMyDialog();
      return;
    }else if(success?["error"]){
_showErrorDialog();
    }
   
     
    
    
   
  }
  Future<bool>backIsPressed()async{
   return false;
  }
  Future<void> _showMyDialog() async {
    
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext fcontext) {
      return AlertDialog(
        title: const Text('Successfully Submitted to Web'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              
              Icon(Icons.check_box_rounded,color: Colors.green,size: 120,),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
Future<void> _showErrorDialog() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext fcontext) {
      return AlertDialog(
        title: const Text('Something went Wrong'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              
              Icon(Icons.warning,color: Colors.red,size: 120,),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

}
