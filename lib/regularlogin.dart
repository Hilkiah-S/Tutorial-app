import 'package:flutter/material.dart';
import 'package:tutorialapp/startpageregular.dart';


class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState(){
    _passwordVisible=false;
  }
  bool  _passwordVisible=false;
  String Email="";
  String Password="";
  String compareemail="kelkiasselamuyahoocom";
  String comparepassword="reload";
  validator(Email,Password){
      if(Email==compareemail.trim()){
         print("ACCEPTED");
         _showMyDialog();
      }
      else {
        Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>Startreg()));
password.clear();
email.clear();
      }
  }
  Future<void> _showMyDialog() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
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

  // const Login({super.key});

final password = TextEditingController();
final email = TextEditingController();
  bool view=false;
  
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          
          body:
          Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
              color: Colors.grey[900],
                  // image: DecorationImage(
                  //     image: AssetImage("assets/splash/orangenew.jpg"), fit: BoxFit.cover),
                ),child:Stack(
            children: [
               
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: SingleChildScrollView(
                    child: Container(
                      
                      decoration: BoxDecoration(
                      //  color: Color.fromARGB(255, 236, 235, 235).withOpacity(0.5),
                      color:Colors.grey[900],
                       borderRadius: BorderRadius.all(
                        Radius.circular(30),
                       ),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                
                                SizedBox(height:19),
                                 Text("Login",style: TextStyle(color:Color.fromARGB(255, 231, 229, 229),fontWeight: FontWeight.bold,fontSize: 35),),
                                    SizedBox(height:15),   
                                Container(
                                  
                                  child:Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 218, 224, 221),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(60),
                                        ),
                                      ),
                                      child: TextFormField(
                                        controller: email,
                                        decoration: InputDecoration(
                                          border:InputBorder.none,
                                          labelText: "EMAIL",
                                          labelStyle: TextStyle(fontSize:14,
                                          fontWeight:FontWeight.w800,
                                          color: Color.fromARGB(255, 255, 150, 64),
                                          ),
                                          prefixIcon: Icon(Icons.email,color: Color.fromARGB(255, 255, 150, 64),),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height:15),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 218, 224, 221),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(60),
                                        ),
                                      ),
                                      child: TextFormField(
                                        controller: password,
                                        obscureText: !_passwordVisible ,
                                        decoration:InputDecoration(
                                            border:InputBorder.none,
                                            labelText:"PASSWORD",
                                            labelStyle:TextStyle(fontSize:14,
                                            fontWeight:FontWeight.w800,
                                            color:Color.fromARGB(255, 255, 150, 64) ),
                                            prefixIcon: Icon(Icons.lock,color: Color.fromARGB(255, 255, 150, 64),),
                                             suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                               _passwordVisible
                               ? Icons.visibility
                               : Icons.visibility_off,
                               color: Color.fromARGB(255, 255, 150, 64),
                               ),
                            onPressed: () {
                               // Update the state i.e. toogle the state of passwordVisible variable
                               setState(() {
                                   _passwordVisible = !_passwordVisible;
                               });
                             },
                            ),
                                      ),
                                        ),
                                    ),
                                    
                              
                                    SizedBox(
                                      height:10,
                                    ),
                                
                                 SizedBox(
                                  height:20,
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(bottom:20),
                                   child: Container(
                                    height: 55,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 255, 150, 64),
                                      borderRadius: BorderRadius.all(Radius.circular(90)) ),
                                    child: TextButton(
                                      // style: ButtonStyle(backgroundColor:MaterialStatePropertyAll(Color.fromARGB(255, 255, 150, 64)
                                      // )
                                      // ),
                                      child: Text("Login",style:TextStyle(fontSize: 25,color:Colors.white)),
                                      onPressed: (){print("LOGIN");
                                      
                                      
                                        Email =email.text;
                                        Password=password.text;
                                      String newEmail = Email.replaceAll(new RegExp(r'[^\w\s]+'), '');
                                                          // String compareemail= compareemail.replaceAll(new RegExp(r'[^\w\s]+'),
                                    String emailtrim = Email.trim();
                                     String passwordtrim = Password.trim();
                                      validator(newEmail.trim(),passwordtrim);},
                                    ),
                                   ),
                                 ),
                                //  Padding(
                                //    padding: const EdgeInsets.only(left:10.0),
                                //    child: Row(
                                //    children: [ Text("Don't have an account?"),
                                //    TextButton(onPressed:(){
                                    
                                //    }, child:Text("Register",style: TextStyle(color: Colors.blue[400]),) )
                                //     ],
                                // ),
                                //  )
                                ]))], 
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
     ))
     
     
     );
    
  }
}

