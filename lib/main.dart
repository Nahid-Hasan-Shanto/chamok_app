import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Flip Page/flip_Items.dart';
import 'drawer_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = 'Flip card';
  String eventType = 'increment';
  int _selectedIndex = 2;
  changeIndex(et) {
    //print(et);
    setState(() {
      _selectedIndex = et;
      if (et == 0) {
        eventType = 'decriment';
      } else if (et == 1) {
        eventType = 'init';
      } else {
        eventType = 'increment';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chamak'),
        centerTitle: true,
      ),
      drawer: DrawerItem(),
      body: FlipItems(
        eventType: eventType,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back_ios_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_forward_ios_rounded),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: changeIndex,
      ),
    );
  }
}
