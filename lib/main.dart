import 'package:flutter/material.dart';
import 'package:week_six/component/custom_card.dart';
import 'package:week_six/component/custom_counter.dart';
import 'package:week_six/component/custom_profile_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Widget',
      // theme: ThemeData(
      //     primarySwatch: Colors.red,
      //     textTheme: const TextTheme(
      //       bodyMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //     ),
      //     elevatedButtonTheme: ElevatedButtonThemeData(
      //       style: ElevatedButton.styleFrom(
      //         backgroundColor: Colors.deepPurple,
      //         foregroundColor: Colors.white,
      //       ),
      //     )
      //     ),
      home: TestTheme(),
    );
  }
}

class TestTheme extends StatelessWidget {
  const TestTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ThemeMode Demo',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.black)),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.deepPurple),
      ),
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.blueGrey[900],
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
        appBarTheme: AppBarTheme(backgroundColor: Colors.grey[800]),
      ),
      themeMode: ThemeMode.dark,
      home: const ProfileWidget(),
    );
  }
}

class ProfileWidget extends StatefulWidget {  
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  Icon currentIcon = Icon(Icons.sunny);

  void setTheme() {
    setState(() {
      if(currentIcon == Icon(Icons.sunny)){
        currentIcon = Icon(Icons.dark_mode);
      } else {
        currentIcon = Icon(Icons.sunny);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Widget"),
        actions: <Widget>[
          IconButton(onPressed: (){
            setTheme();
          }, icon: currentIcon)
        ]
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfileCard(
                name: "Danudeth Ninkuha",
                position: "Student",
                email: "ninkuha_d@silpakorn.edu",
                phoneNumber: "0878011648",
                imageUrl:
                    "https://i.pinimg.com/736x/b7/b6/bb/b7b6bb2c53f083ca7beb2acab7ee8a29.jpg")
          ],
        ),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  Color winColor = Colors.white;

  void setWinColor(Color winColor) {
    setState(() {
      this.winColor = winColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Card"),
      ),
      backgroundColor: winColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // CustomCard(text: "Red", backgroundColor: Colors.red, isCircle: true,),
          // SizedBox(height: 10,),
          // CustomCard(text: "Green", backgroundColor: Colors.green,),
          // SizedBox(height: 10,),
          // CustomCard(text: "Blue", backgroundColor: Colors.blue, isCircle: true,),
          CustomCounterWidget(
            title: "Team A",
            backgroundColor: Colors.red,
            onPlayerWin: setWinColor,
          ),
          SizedBox(
            height: 10,
          ),
          CustomCounterWidget(
            title: "Team B",
            backgroundColor: Colors.blue,
            onPlayerWin: setWinColor,
          ),
          // //test func with button
          // ElevatedButton(onPressed: (){
          //   setWinColor(Colors.red);
          // }, child: Text("Set Win Color"))
        ],
      )),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme"),
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Hello World'),
        ElevatedButton(
          onPressed: () {},
          child: const Text("Press Me!"),
        )
      ])),
    );
  }
}