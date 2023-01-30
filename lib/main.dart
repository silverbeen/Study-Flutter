import 'package:flutter/material.dart';
import 'package:flutter_start_app/screen/home_screen.dart';
import 'package:flutter_start_app/widget/BottomBar.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'start_app',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        accentColor: Colors.white,
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            // NeverScrollableScrollPhysics : 좌우로 스크롤 했을때 움직이지 않게 fixed 설정
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              HomeScreen(),
              Container(
                child: const Center(
                  child: Text('seach'),
                ),
              ),
              Container(
                child: const Center(
                  child: Text('save'),
                ),
              ),
              Container(
                child: const Center(
                  child: Text('more'),
                ),
              )
            ],
          ),
          bottomNavigationBar: Bottom(),
        ),
      ),
    );
  }
}
