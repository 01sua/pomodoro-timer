import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

class TimerPage extends StatefulWidget {
  const TimerPage(
      {super.key, required this.title, required this.time, required this.rest});

  final String title;
  final int time;
  final int rest;

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  late int time = widget.time;
  late int rest = widget.rest;
  int reps = 3;
  int pause = 1;
  int resting = 1;
  String title = 'timer';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Pomodoro Timer')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title),
              Text(currTime()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: timer, child: Text(state())),
                  ElevatedButton(onPressed: reset, child: const Text('reset'))
                ],
              ),
            ],
          ),
        ));
  }

  String currTime() {
    int temp = time;
    int hours = (temp / 3600).toInt();
    int mins = ((temp % 3600) / 60).toInt();
    int seconds = ((temp % 60)).toInt();
    if (hours != 0) {
      return '${hours}h ${mins}m ${seconds}s';
    }
    if (mins != 0) {
      return '${mins}m ${seconds}s';
    }
    return '${seconds}s';
  }

  void timer() {
    pause == 1 ? pause = 0 : pause = 1;
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (resting == 0) {
        if (time == 0) {
          setState(() {
            log('help');
            resting = 1;
            title = 'Timer';
            time = widget.time;
          });
        } else {
          setState(() {
            time--;
          });
        }
      } else {
        if (pause == 1) {
          timer.cancel();
          setState(() {});
        } else if (time == 0 && reps != 0) {
          setState(() {
            title = 'break';
            resting = 0;
            time = widget.rest;
            reps--;
          });
        } else if (time == 0 && reps == 0) {
          timer.cancel();
          setState(() {
            pause = 2;
          });
        } else {
          setState(() {
            time--;
          });
        }
      }
    });
  }

  void reset() {
    setState(() {
      pause = 1;
      reps = 3;
      time = widget.time;
      rest = widget.rest;
    });
  }

  String state() {
    if (pause == 0) {
      return 'pause';
    } else if (pause == 1) {
      return 'start';
    } else {
      return 'done';
    }
  }
}
