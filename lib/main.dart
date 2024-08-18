// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timer/pages/start.dart';
import 'package:timer/pages/timer.dart';

// import 'src/app.dart';
// import 'src/settings/settings_controller.dart';
// import 'src/settings/settings_service.dart';

// void main() async {
//   // Set up the SettingsController, which will glue user settings to multiple
//   // Flutter Widgets.
//   final settingsController = SettingsController(SettingsService());

//   // Load the user's preferred theme while the splash screen is displayed.
//   // This prevents a sudden theme change when the app is first displayed.
//   await settingsController.loadSettings();

//   // Run the app and pass in the SettingsController. The app listens to the
//   // SettingsController for changes, then passes it further down to the
//   // SettingsView.
//   runApp(MyApp(settingsController: settingsController));
// }

// class MyApp extends StatelessWidget {

// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomodoro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromARGB(0, 146, 198, 221))),
      home: const StartPage(),
      routes: {
        '/start' : (context) => const StartPage(),
        'timer' : (context) => const TimerPage(title: 'help me', time: 10, rest: 1,),
      },
    );
  }
}









// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int time = 1500;
//   int pause = 1;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Pomodoro')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text('Timer'),
//             Text(currTime()),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(onPressed: timer, child: Text(state())),
//                 ElevatedButton(onPressed: reset, child: const Text('reset'))
//               ],
//             ),
//           ],
//         ),
//       )
//     );
//   }

//   String currTime() {
//     int temp = time;
//     int hours = (temp / 3600).toInt();
//     int mins = ((temp % 3600) / 60).toInt();
//     int seconds = ((temp % 60)).toInt();
//     if (hours != 0) {
//       return '${hours}h ${mins}m ${seconds}s';
//     }
//     if (mins != 0) {
//       return '${mins}m ${seconds}s';
//     }
//     return '${seconds}s'; 
//   }

//   void timer() {
//     pause == 1 ? pause = 0 : pause = 1;
//     Timer.periodic(Duration(seconds: 1), (timer) {
//       if (pause == 1) {
//         timer.cancel();
//         setState(() {});
//       } else if (time == 0) {
//         timer.cancel();
//         setState(() {
//           pause = 2;
//         });
//       } else {
//         setState(() {
//           time--;
//         });
//       }
//     });
//   }

//   void reset() {
//     setState(() {
//       pause = 1;
//       time = 1500;
//     });
//   }

//   String state() {
//     if (pause == 0) {
//       return 'pause';
//     } else if (pause == 1) {
//       return 'start';
//     } else {
//       return 'done';
//     }
//   }
// }
