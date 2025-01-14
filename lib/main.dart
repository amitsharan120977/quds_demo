import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quds_ui_kit/animations/quds_scalable_pressable.dart';
import 'package:quds_ui_kit/screens/quds_popup_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: QudsScalablePressable(
            scaleWhenTapDown: true,
            scaleWhenMouseEnter: true,
            duration: const Duration(milliseconds: 150),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                QudsPopupButton(
                    // backgroundColor: Colors.red,
                    tooltip: 'T',
                    items: getMenuItems(),
                    child: Icon(
                      CupertinoIcons.chat_bubble_2_fill,
                      size: 48,
                    )),
                Text(
                  'Chat with Us',
                  style: TextStyle(fontSize: 18),
                )
              ],
            )) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  List<QudsPopupMenuBase> getMenuItems() {
    return [
      QudsPopupMenuSection(
          backgroundColor: Colors.yellow.shade200,
          titleText: 'أبو أسعد الأمير',
          subTitle: Text('See your profile'),
          leading: Icon(
            Icons.redeem,
            size: 40,
          ),
          subItems: [
            QudsPopupMenuSection(
                titleText: 'Settings',
                leading: Icon(Icons.settings),
                subItems: [
                  QudsPopupMenuItem(
                      leading: Icon(Icons.logout),
                      title: Text('Logout'),
                      onPressed: () {
                        showToast('Logout Pressed!');
                      })
                ]),
          ]),
      QudsPopupMenuDivider(),
      QudsPopupMenuItem(
          leading: Icon(Icons.info_outline),
          title: Text('Give Feedback'),
          subTitle: Text('Help us improve our new app'),
          onPressed: () {
            showToast('Feedback Pressed!');
          }),
      QudsPopupMenuDivider(),
      QudsPopupMenuSection(
          leading: Icon(Icons.place),
          titleText: 'Settings & Privacy',
          subItems: [
            QudsPopupMenuItem(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onPressed: () {
                  showToast('Settings Pressed!');
                }),
            QudsPopupMenuItem(
                leading: Icon(Icons.lock),
                title: Text('Privacy Checkup'),
                onPressed: () {
                  showToast('Privacy Checkup Pressed!');
                }),
            QudsPopupMenuItem(
                leading: Icon(Icons.lock_clock),
                title: Text('Privacy Shortcuts'),
                onPressed: () {
                  showToast('Privacy Shourtcuts Pressed!');
                }),
            QudsPopupMenuItem(
                leading: Icon(Icons.list),
                title: Text('Activity Log'),
                onPressed: () {
                  showToast('Activity Log Pressed!');
                }),
            QudsPopupMenuItem(
                leading: Icon(Icons.card_membership),
                title: Text('News Feed Preferences'),
                onPressed: () {
                  showToast('News Feed Preferences Pressed!');
                }),
            QudsPopupMenuItem(
                leading: Icon(Icons.language),
                title: Text('Language'),
                onPressed: () {
                  showToast('Language Pressed!');
                }),
          ]),
      QudsPopupMenuDivider(),
      QudsPopupMenuWidget(
          builder: (c) => Container(
              padding: EdgeInsets.all(10),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          showToast('Favourite Pressed!');
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )),
                    VerticalDivider(),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.music_note,
                          color: Colors.blue,
                        )),
                    VerticalDivider(),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.umbrella,
                          color: Colors.green,
                        ))
                  ],
                ),
              )))
    ];
  }

  void showToast(String s) {
    print(s);
  }
}
