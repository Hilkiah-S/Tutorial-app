import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import'package:hive/hive.dart';
import 'package:tutorialapp/sidebar.dart';
import 'package:share_plus/share_plus.dart';

import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
class Sharen extends StatefulWidget {
  const Sharen({super.key});

  @override
  State<Sharen> createState() => _ShareState();
}

class _ShareState extends State<Sharen> {
  final _mybox = Hive.box('dotBox');

  @override
  Widget build(BuildContext context) {
    return Theme(
     
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
           _mybox.delete(71);
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
         drawer: NavBar(),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
             children: [
               QrImage(
        data: "https://berhan.addisphoenix.com/index.html",
        version: QrVersions.auto,
        size: 300.0,
        foregroundColor: Colors.orange,
      ),
             ],
           ),
           SizedBox(height: 40,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
  width: 80,
  height: 80,
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    color: Colors.blue,
  ),
  child: Padding(
    padding: const EdgeInsets.all(3.0),
    child: IconButton(onPressed: () {Share.share("http://berhan.addisphoenix.com/");}, icon: Icon(Icons.share,size: 50,color: Colors.white,)),
  )),
        ],
      ),
        ],
      ),

    ));
  }
}