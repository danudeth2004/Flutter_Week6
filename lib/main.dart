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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ProfileWidget(),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom Widget"),),
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ProfileCard(
            name: "Danudeth Ninkuha", 
            position: "Student", 
            email: "ninkuha_d@silpakorn.edu", 
            phoneNumber: "0878011648", 
            imageUrl: "https://i.pinimg.com/736x/b7/b6/bb/b7b6bb2c53f083ca7beb2acab7ee8a29.jpg"
          )
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

  void setWinColor(Color winColor){
    setState(() {
      this.winColor = winColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom Card"),),
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
            CustomCounterWidget(title: "Team A", backgroundColor: Colors.red, onPlayerWin: setWinColor,),
            SizedBox(height: 10,),
            CustomCounterWidget(title: "Team B", backgroundColor: Colors.blue, onPlayerWin: setWinColor,),
            // //test func with button
            // ElevatedButton(onPressed: (){
            //   setWinColor(Colors.red);
            // }, child: Text("Set Win Color"))
          ],
        )
      ),
    );
  }
}
