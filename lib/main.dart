import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tutorialapp/AI.dart';
import 'package:tutorialapp/debugpage.dart';
import 'package:tutorialapp/firstpageforsight.dart';
import 'package:tutorialapp/firstpage.dart';
import 'package:tutorialapp/registerpageforsight.dart';
import 'package:vibration/vibration.dart';
import 'package:tutorialapp/questioned.dart';
import 'package:tutorialapp/splashscreen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:tutorialapp/register.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tutorialapp/regularlogin.dart';

import 'package:awesome_notifications/awesome_notifications.dart';

void main()async{
  
  await Hive.initFlutter();
  await AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: 'basic_channel', 
        channelName: 'Berhane_Notifier', 
        channelDescription: 'Berhane channel for displaying time sensetive information',
        )
    ],
    debug: true,
  );
  var box = Hive.openBox('dotBox');
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      home:MyApp()));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
            duration: 2000,
            splash: Image.asset('assets/splash/icon.png'),
            splashIconSize: 200,
            nextScreen: Choosepage(),
            splashTransition: SplashTransition.fadeTransition,
            // pageTransitionType: PageTransitionType.scale,
            backgroundColor: Color.fromARGB(255, 26, 25, 25));
  }
}
class Redirect extends StatefulWidget {
  const Redirect({super.key});

  @override
  State<Redirect> createState() => _RedirectState();
}

class _RedirectState extends State<Redirect> {
  String long =''' Welcome to the practice test, I am here to give you instructions how to proceed, I will read the following questions out loud ,Including the corresponding choices, after hearing the question if you are ready to answer, long press anywhere on the screen , for next question double tap the screen, to give an answer first hold your phone in the Stable position preferably, upright position , try to make it as still as possible, then long press on the screen to give an answer, now comes the most important part. Turn your phone to the left if the answer is A,
turn you phone to the right if the answer is B, rotate your phone in the clockwise direction if the answer is C and finally rotate your phone in the anti-clockwise direction, if the answer is D, I must note, we use your phone's acceleration  to get the value needed, which means the faster you turn your phone the easier it is for us to detect. whenever you are choosing an answer by rotating your phone if you feel the vibration from your phone, that means we got the value we wanted and Now you can release the long press, and continue to the next question by double tapping, if you double tap without setting an answer, we are going to assume that you skipped the question, which may reflect badly in your evaluation. If you skipped the page by accident you can go to the previous question by swiping to the right.
 If in fact you chose the wrong answer by accident you can resubmit an answer with a long press and setting the new value as did before, to hear this again Single tap, to proceed to next page Double tap,
Do the following 10 questions, so you get a better hang of this..you can navigate back to any screen by swiping to the right.
''';
  FlutterTts flutterTts = FlutterTts();
// () {Vibration.vibrate();},
  void again() {
    flutterTts.setSpeechRate(0.4);
    flutterTts.speak(long);
  }

  void changepage() {
    {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Listening()),
      );
    }
  }

  @override
  void initState() {
    FlutterTts flutterTts = FlutterTts();
    flutterTts.setSpeechRate(0.4);
    flutterTts.speak(long);
    super.initState();
  }
  @override
  void dispose(){
    flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
         onHorizontalDragEnd: (DragEndDetails details) {
    if (details.velocity.pixelsPerSecond.dx > 0) {
        Navigator.pop(context);
    };},
        onTap: again,
        onDoubleTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Listening()),
          );
        },
        child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    const Color(0xFF3366FF),
                    const Color(0xFF00CCFF),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            child: Column(
              children: [
                // Text("Swipe to the right to Start"),
                //               GestureDetector(onTap:again,onDoubleTap:() { Navigator.push(
                // context,
                // MaterialPageRoute(builder: (context) => const Listening()),
                // );}
                Expanded(child: Image.asset('assets/moana.png')),
              ],
            )),
      ),
    );
  }
}
