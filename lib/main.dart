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
      home: SwitchTraffic(),
    );
  }
}

//homework 4

class SwitchTraffic extends StatefulWidget {
  @override
  _SwitchTrafficState createState() => _SwitchTrafficState();
}

class _SwitchTrafficState extends State<SwitchTraffic> {
  int _currentLight = 0;

  void _changeLight() {
    setState(() {
      _currentLight++;
    });
    if (_currentLight == 3) {
      _currentLight = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Traffic Light Animation",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: _currentLight == 0 ? 1.0 : 0.3,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red,
                      offset: Offset(0, 0),
                      blurRadius: 30,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: _currentLight == 1 ? 1.0 : 0.3,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.yellow,
                      offset: Offset(0, 0),
                      blurRadius: 30,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: _currentLight == 2 ? 1.0 : 0.3,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green,
                      offset: Offset(0, 0),
                      blurRadius: 30,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _changeLight,
              child: const Text("เปลี่ยนไฟ"),
            ),
          ],
        ),
      ),
    );
  }
}

//homework 4

class AnimatedSwitcherExample extends StatefulWidget {
  const AnimatedSwitcherExample({super.key});

  @override
  State<AnimatedSwitcherExample> createState() =>
      _AnimatedSwitcherExampleState();
}

class _AnimatedSwitcherExampleState extends State<AnimatedSwitcherExample> {
  bool _isFirst = true;
  void _switchWidget() {
    setState(() {
      _isFirst = !_isFirst;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Switcher Example"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            child: _isFirst
                ? Container(
                    key: const ValueKey(1),
                    width: 100,
                    height: 100,
                    color: Colors.orange)
                : Container(
                    key: const ValueKey(2),
                    width: 100,
                    height: 100,
                    color: Colors.blue),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _switchWidget,
            child: const Text('Switch Widget'),
          ),
        ],
      ),
    );
  }
}

class AnimatedPositionedExample extends StatefulWidget {
  const AnimatedPositionedExample({super.key});

  @override
  State<AnimatedPositionedExample> createState() =>
      _AnimatedPositionedExampleState();
}

class _AnimatedPositionedExampleState extends State<AnimatedPositionedExample> {
  bool _isLeft = true;
  void _moveBox() {
    setState(() {
      _isLeft = !_isLeft;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animated Positioned Example")),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            left: _isLeft ? 20 : 200,
            top: 100,
            child: Container(width: 100, height: 100, color: Colors.purple),
          ),
          Center(
            child: ElevatedButton(
              onPressed: _moveBox,
              child: const Text('Move Box'),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedPaddingExample extends StatefulWidget {
  const AnimatedPaddingExample({super.key});

  @override
  State<AnimatedPaddingExample> createState() => _AnimatedPaddingExampleState();
}

class _AnimatedPaddingExampleState extends State<AnimatedPaddingExample> {
  double _padding = 10;
  void _increasePadding() {
    setState(() {
      _padding = _padding == 10 ? 50 : 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Animated Padding Example")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedPadding(
              duration: const Duration(seconds: 1),
              padding: EdgeInsets.all(_padding),
              child: Container(width: 100, height: 100, color: Colors.green),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _increasePadding,
              child: const Text('Change Padding'),
            ),
          ],
        ));
  }
}

class AnimatedAlignExample extends StatefulWidget {
  @override
  _AnimatedAlignExampleState createState() => _AnimatedAlignExampleState();
}

class _AnimatedAlignExampleState extends State<AnimatedAlignExample> {
  bool _isLeft = true;

  void _togglePosition() {
    setState(() {
      _isLeft = !_isLeft;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Animated Align Example")),
        body: Stack(
          children: [
            AnimatedAlign(
              duration: const Duration(seconds: 1),
              alignment: _isLeft ? Alignment.centerLeft : Alignment.centerRight,
              child: Container(width: 100, height: 100, color: Colors.red),
            ),
            Center(
              child: ElevatedButton(
                onPressed: _togglePosition,
                child: const Text('Move Box'),
              ),
            ),
          ],
        ));
  }
}

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});

  @override
  State<AnimatedContainerExample> createState() =>
      AnimatedContainerExampleState();
}

class AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  double _size = 100;
  Color _color = Colors.blue;
  double _opacity = 1.0;
  void _changeBox() {
    setState(() {
      // _size = _size == 100 ? 200 : 100;
      _color = _color == Colors.blue ? Colors.red : Colors.blue;
    });
  }

  void _toggleOpacity() {
    setState(() {
      _opacity = _opacity == 1.0 ? 0.2 : 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Container Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              height: _size,
              width: _size,
              color: _color,
            ),
            ElevatedButton(onPressed: _changeBox, child: Text("Animated Box")),
            AnimatedOpacity(
              duration: Duration(milliseconds: 500),
              opacity: _opacity,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ),
            ElevatedButton(
                onPressed: _toggleOpacity, child: Text("Animated Box"))
          ],
        ),
      ),
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
      if (currentIcon == Icon(Icons.sunny)) {
        currentIcon = Icon(Icons.dark_mode);
      } else {
        currentIcon = Icon(Icons.sunny);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom Widget"), actions: <Widget>[
        IconButton(
            onPressed: () {
              setTheme();
            },
            icon: currentIcon)
      ]),
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
