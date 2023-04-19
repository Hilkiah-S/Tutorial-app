import'package:flutter/material.dart';
import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:dio/dio.dart';
// import 'package:flutter_tts/flutter_tts.dart';
class FINALPAGERR extends StatefulWidget {
   List answersinternet;

 List answersusers;

FINALPAGERR({Key? mykey,required this.answersinternet,required this.answersusers }):super(key:mykey);

  @override
  State<FINALPAGERR> createState() => _FINALPAGEState();
}

class _FINALPAGEState extends State<FINALPAGERR> {
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
    print(newanswers[3].runtimeType);
  print("New Useranswer");
  print(widget.answersusers[3].runtimeType);
}


  

@override
void initState(){
compute();
// flutterTts.speak("You got ${correct} out of ${widget.answersinternet.length} ");
// _sendCode();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){_sendCode();},
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration:BoxDecoration(
            color: Colors.grey[900],
          
          ) ,
        child: Center(
          child: Text("You got ${correct}/${widget.answersinternet.length} ",style: TextStyle(color:Colors.white,fontSize: 40),),
        ),
        ),
      ),
    );
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
     _showMyDialog();
      return;
    }
    else if(success?["error"]){
    _showErrorDialog();
    }
   
     
    
    
   
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
