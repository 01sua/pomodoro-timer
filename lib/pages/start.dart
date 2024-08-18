// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timer/pages/timer.dart';
// import 'package:flutter/services.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  TextEditingController workcontroller = TextEditingController();
  TextEditingController restcontroller = TextEditingController();
  bool error = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(' Pomodoro Timer')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Title(color: Colors.black, child: const Text('Welcome to Pomodoro Timer')),
            const Text('\n \n \n'),
            const Text('Enter the amount of time you want to work for, then break for'),
            const Text('The work time and break time will run for 3 cycles, then you are done \n'),
            const Text('Work time (minutes)'),
            if (error) const Text('Need to input valid field'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: workcontroller,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
            ),
            const Text('Break time (minutes)'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: restcontroller,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  int workTime;
                  int restTime;
                  try {
                    workTime = int.parse((workcontroller.text)) * 60;
                    restTime = int.parse(restcontroller.text) * 60;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TimerPage(
                                title: 'sup',
                                time: workTime,
                                rest: restTime,
                              )));
                  } on FormatException {
                    error = true;
                    setState(() {});
                  }
                  // var workTime = int.parse((workcontroller.text));
                  // restTime = int.parse(restcontroller.text);
                  // workTime = 20;
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => TimerPage(
                  //               title: 'sup',
                  //               time: workTime,
                  //               rest: restTime,
                  //             )));
                },
                child: const Text('Start Pomodoro'))
          ],
        ),
      ),
    );
  }
}
