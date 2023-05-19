// import 'dart:html';

import 'package:flutter/material.dart';
import'package:hive/hive.dart';

import 'package:tutorialapp/Sightcontactus.dart';
import 'package:tutorialapp/aboutus.dart';
import 'package:tutorialapp/contactus.dart';
import'package:hive/hive.dart';
import 'package:tutorialapp/firstpage.dart';
import 'package:tutorialapp/sidebar.dart';
import 'package:tutorialapp/sightaboutus.dart';
import 'package:tutorialapp/sightshare.dart';
class NavBarSS extends StatelessWidget {
  final _mybox = Hive.box('dotBox');
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Berhan'),
            accountEmail: Text(_mybox.get(80)),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://berhan.addisphoenix.com/uploads/clientimg/${_mybox.get(2100)}',
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                  
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 243, 93, 33),
              // image: DecorationImage(
              //     fit: BoxFit.fill,
              //    image: AssetImage('assets/splash/class.jpg'),),
            ),
          ),
         
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Choosepage()),
          ),
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>SightSharen())),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Request'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About us'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>SightAboutus())),
          ),
          ListTile(
            leading: Icon(Icons.contacts),
            title: Text('Contact us'),
            onTap: () =>  Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SightContact()),
          ),
          ),
          Divider(),
          // ListTile(
          //   title: Text('Exit'),
          //   leading: Icon(Icons.exit_to_app),
          //   onTap: () => null,
          // ),
        ],
      ),
    );}}