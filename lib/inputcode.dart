// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tutorialapp/sightinternetquestions.dart';
class Inputcode extends StatefulWidget {
  const Inputcode({super.key});

  @override
  State<Inputcode> createState() => _InputcodeState();
}

class _InputcodeState extends State<Inputcode> {
  final _mybox = Hive.box('dotBox');
  late List<Map<String, dynamic>> userData;
  late TextEditingController codetext;
  bool isButtonActive = true;

@override
void initState(){
    super.initState();
    
codetext = TextEditingController();

}
 int? internettime;
 List<Internet> suns=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:Container(
      width:double.infinity,
      height:double.infinity,
      decoration:BoxDecoration(
        color: Colors.grey[800],

      ),
      child:Padding(
        padding: const EdgeInsets.only(top:150.0),
        child: Center(
          child:Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                  ),
                  child: TextFormField(
                        controller: codetext,
                        decoration: new InputDecoration(
   
                          labelText: "Enter code",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                         
                        ),
                        validator: (val) {
                          if (val?.length == 0) {
                            return "Codecannot be empty";
                          } else {
                            return null;
                          }
                        },
                        // keyboardType: TextInputType.emailAddress,
                        style: new TextStyle(
                          fontFamily: "Poppins",
                        ),
                        
                      ),
                ),
              ),
                               Padding(
                                     padding: const EdgeInsets.only(right:20),
                                     child: Container(
                                      height: 55,
                                      width: 250,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 236, 112, 40),
                                        borderRadius: BorderRadius.all(Radius.circular(90)) ),
                                      child: TextButton(
                                        // style: ButtonStyle(backgroundColor:MaterialStatePropertyAll(Color.fromARGB(255, 255, 150, 64)
                                        // )
                                        // ),
                                        child: Text("Submit",style:TextStyle(fontSize: 25,color:Colors.white,fontFamily: "Poppins",)),
                                        onPressed: isButtonActive?  (){print("LOGIN");
                                        if(codetext.text.isNotEmpty){
                                          if(_mybox.get(360)!=null&&_mybox.get(360).contains(codetext.text)){
                                          _showErrorDialog();
                                          }
                                          else{
                                           _sendCode();   
                                          }
                                        }
                                        
                                        }:null,
                                        
                                        
                                          // Email =email.text;
                                          // Password=password.text;
                                        // String newEmail = Email.replaceAll(new RegExp(r'[^\w\s]+'), '');
                                                            // String compareemail= compareemail.replaceAll(new RegExp(r'[^\w\s]+'),
                                      // String emailtrim = Email.trim();
                                      //  String passwordtrim = Password.trim();
                                      //   validator(newEmail.trim(),passwordtrim);},
                                      ),
                                     ),
                                   ),
                  
                  
                  
                  ]
                ),
              ),
      ),
          
        ),
      );
    

    
  }
 void _sendCode() async{
    if(codetext.text.isNotEmpty){
       
    Response<List> response =
        await Dio().post("https://berhan.addisphoenix.com/endpointquestions.php",data: {
          "courseid": codetext.text,
          
        },options: new Options(contentType: "application/x-www-form-urlencoded"));

 
    suns = response.data!.map((e) => Internet.fromMap(e as Map<String, dynamic>)).toList();
    print(suns[0].question);
    
    int? internettime = suns[0].timeall?.isEmpty == true ? null : int.tryParse(suns[0].timeall!);
     print(internettime);
      _mybox.put(57,codetext.text);
     Navigator.of(context).push(MaterialPageRoute(builder: (context) => InternetquestionSight(questions: suns,seconds: internettime!,)));
   }
   
  }
   Future<void> _showErrorDialog() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext fcontext) {
      return AlertDialog(
        title: const Text('Our Records show you took this test,already'),
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

class Internet {
  String? question;
  String? choicea;
  String? choiceb;
  String? choicec;
  String? choiced;
  String? answers;
  String? timeall;
  Internet({required this.question,required this.choicea,required this.choiceb, required this.choicec,required this.choiced, required this.answers,required this.timeall});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'question': question,
      'choicea': choicea,
      'choiceb': choiceb,
      'choicec': choicec,
      'choiced': choiced,
      'answers': answers,
      'timeall': timeall,
    };
  }

  factory Internet.fromMap(Map<String, dynamic> map) {
    return Internet(
      question: map['question'] != null ? map['question'] as String : null,
      choicea: map['choicea'] != null ? map['choicea'] as String : null,
      choiceb: map['choiceb'] != null ? map['choiceb'] as String : null,
      choicec: map['choicec'] != null ? map['choicec'] as String : null,
      choiced: map['choiced'] != null ? map['choiced'] as String : null,
      answers: map['answers'] != null ? map['answers'] as String : null,
      timeall: map['timeall'] != null ? map['timeall'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Internet.fromJson(String source) => Internet.fromMap(json.decode(source) as Map<String, dynamic>);
}
