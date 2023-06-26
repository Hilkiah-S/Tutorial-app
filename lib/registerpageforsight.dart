import 'dart:async';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

import 'package:local_auth/local_auth.dart';
import 'package:tutorialapp/debugpage.dart';
import 'dart:convert';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:tutorialapp/firstpageforsight.dart';

 class Regsight extends StatefulWidget {
  const Regsight({super.key});
 
  @override
  State<Regsight> createState() => _RegsightState();
}

class _RegsightState extends State<Regsight> {

  late bool timefingerprint;
  bool text1 =false;
  bool text2=false;
 final _mybox = Hive.box('dotBox');
late TextEditingController emailtext;
late TextEditingController password;
 LocalAuthentication authentication = LocalAuthentication();
 Future authenticate()async{
  final bool isBiometricAvailable= await authentication.isDeviceSupported();
  if(!isBiometricAvailable){return false;}
  try{
    return await authentication.authenticate(localizedReason: "Login with Fingerprint to Berhan Account",
    options: const AuthenticationOptions(
      biometricOnly: true,
      useErrorDialogs: true,
      stickyAuth: true,
    ));
  }on PlatformException catch(e){
    return;
  }
 }
  // String val="";

  Color colortt=Colors.white;
  Color changeColor=Colors.deepOrange;
  String change(value){
    setState(() {
      colortt=changeColor;
    });
    return value;
  }
  Future<void> _showMyDialog() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext fcontext) {
      return AlertDialog(
        title: const Text('Either username or password is incorrect'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              
              Icon(Icons.error,color: Colors.red,size: 120,),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Try again'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

  bool isButtonActive=true;
  // late TextEditingController password;
  // late TextEditingController emailtext;
  FlutterTts flutterTts = FlutterTts();
   @override
void initState(){
    
    super.initState();
        
    flutterTts.setSpeechRate(0.4);
    flutterTts.speak("you are now on the login page, you can long press and use fingerprint to login");
    if(_mybox.get(70)!=null){
      setState(() {
        timefingerprint=true;
      });
    }else{
      setState(() {
        timefingerprint=false;
      });
    }
    _passwordVisible=false;
emailtext = TextEditingController();
emailtext.addListener(() { 
    final text1=emailtext.text.isNotEmpty;
});
password = TextEditingController();
password.addListener(() { 
   final text2=emailtext.text.isNotEmpty;
});

if(text1==true&&text2==true){

  isButtonActive=true;

}
// if(_mybox.get(35)==1){
// setState(() {
//   timefingerprint=true;
// });
// }
  }
  // @override
  // void dispose(){
  //   emailtext.dispose();
  //   password.dispose();
  //   super.dispose();
  // }
  bool  _passwordVisible=false;


@override
void dispose(){
  flutterTts.stop();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: GestureDetector(
        onTap: ()async{timefingerprint?
          ()async {
                 bool isAuthenticated = await authenticate();
                  if(isAuthenticated){
                    print("Verified");
                   Navigator.of(context).push(MaterialPageRoute(builder: (context) => Firstsight()));
                  }
                  else{
                    print("Not verified");
                  }
                 }: () {flutterTts.setSpeechRate(0.4);
    flutterTts.speak("Looks like this is your firsttime loging in, you need to login with your login details atleast once, before you can use fingerprint");}; },
        child: Stack(children: [
          Container(
            width: double.infinity,
            height: double.infinity,  
            decoration: BoxDecoration(
              color: Colors.grey[700],
            ),
          ),
          Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              Padding(
                padding: const EdgeInsets.only(left:20.0,right: 20.0,bottom:20,top: 10),
                child: Container(
                  // height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // border:Border.all(
                    //  color: colortt,
                    // ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                    
                  ),
                  child: TextFormField(
                    controller: emailtext,
                    decoration: new InputDecoration(
         
                      labelText: "Enter Email",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                     
                    ),
                    validator: (val) {
                      if (val?.length == 0) {
                        return "Email cannot be empty";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                    
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:20.0,right: 20.0,bottom:20,top: 10),
                child: Container(
                                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.0)
                    ),),
                  child: TextFormField(
                    controller: password,
                    obscureText: !_passwordVisible ,
                      decoration: new InputDecoration(
                        suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                 _passwordVisible
                                 ? Icons.visibility
                                 : Icons.visibility_off,
                                 color: Color.fromARGB(255, 236, 112, 40),
                                 ), onPressed: () {
                                 // Update the state i.e. toogle the state of passwordVisible variable
                                 setState(() {
                                     _passwordVisible = !_passwordVisible;
                                 });}),
                        labelText: "password",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(),
                        ),
                        //fillColor: Colors.green
                      ),
                      validator: (val) {
                        if (val?.length == 0) {
                          return "Name cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      style: new TextStyle(
                        fontFamily: "Poppins",
                      ),
                    ),
                ),
              ),
               
               SizedBox(height: 15),
               Padding(
                                     padding: const EdgeInsets.only(right:20),
                                     child: Container(
                                      height: 55,
                                      width: 170,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 236, 112, 40),
                                        borderRadius: BorderRadius.all(Radius.circular(90)) ),
                                      child: TextButton(
                                        // style: ButtonStyle(backgroundColor:MaterialStatePropertyAll(Color.fromARGB(255, 255, 150, 64)
                                        // )
                                        // ),
                                        child: Text("Login",style:TextStyle(fontSize: 25,color:Colors.white,fontFamily: "Poppins",)),
                                        onPressed: isButtonActive?  (){print("LOGIN");
                                        _loginUser();
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
                                   
                                   Padding(
                                     padding: const EdgeInsets.only(right:50.0,top:20,bottom:20,left:50),
                                     child: Row(children: <Widget>[
                                          Expanded(
              child: Divider(
                height: 36,
                thickness: 2,
                color: Colors.white,
              )
          ),       
      
          Padding(
            padding: const EdgeInsets.only(left:8.0,right: 8),
            child: Text("Or",style: TextStyle(color: Colors.white,fontSize: 17),),
          ),        
      
          Expanded(
              child: Divider(
                thickness: 2,
                color: Colors.white,
              )
          ),
                                     ],),
                                   ),
                                   Padding(
                 padding: const EdgeInsets.only(right:55.0),
                 child: IconButton(onPressed:
                  timefingerprint? ()async {
                    flutterTts.speak("Now place your hand on the fingerprint sensor");
                 bool isAuthenticated = await authenticate();
                  if(isAuthenticated){
                    print("Verified");
                   Navigator.of(context).push(MaterialPageRoute(builder: (context) => Debuding()));
                  }
                  else{
                    print("Not verified");
                  }
                 }: null,
        icon: Icon(Icons.fingerprint,size: 70,color: Color.fromARGB(255, 236, 112, 40),)),
               ),
               Container(
                color: Color.fromARGB(255, 238, 180, 55),
                  
               ),
              
            ],
          ),
          ),
          
        ],),
      ),
    );
  }
  
  void _loginUser() async{
    if(password.text.isNotEmpty
   && emailtext.text.isNotEmpty ){
    Response<Map<String, dynamic>> response =
        await Dio().post("https://berhan.addisphoenix.com/endpoint.php",data: {
          "email": emailtext.text,
          "password": password.text,
        },options: new Options(contentType: "application/x-www-form-urlencoded"));

    var success = response.data;
    print(success);
    /*
    ['error'=> true/false, 'msg'=>  String]
    */
    
    if(success?["error"]){
     _showMyDialog();
      return;
    }
    _mybox.put(70, 1);
    _mybox.put(80,emailtext.text);
     _mybox.put(90,password.text); 
     
     Navigator.of(context).push(MaterialPageRoute(builder: (context) => Debuding()));
    //logined in 
    //Naviage erlvome
   }
  }
}