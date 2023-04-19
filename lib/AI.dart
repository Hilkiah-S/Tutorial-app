import 'dart:async';
import 'package:flutter/material.dart';

class CountDownTimerPage extends StatefulWidget {
  final int seconds;

  CountDownTimerPage({required this.seconds});

  @override
  _CountDownTimerPageState createState() => _CountDownTimerPageState();
}

class _CountDownTimerPageState extends State<CountDownTimerPage> {
  late int _secondsRemaining;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _secondsRemaining = widget.seconds;
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_secondsRemaining < 1) {
          _timer.cancel();
        } else {
          _secondsRemaining -= 1;
        }
      });
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Countdown Timer'),
      ),
      body: Center(
        child: Text(
          _formatDuration(Duration(seconds: _secondsRemaining)),
          style: TextStyle(fontSize: 36),
        ),
      ),
    );
  }
}
