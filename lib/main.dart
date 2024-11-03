import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    getPermission();
  }

  getPermission() async {
    var status = await Permission.contacts.status;
    if (status.isGranted) {
      print('Permission granted');
    } else if (status.isDenied) {
      print('Permission denied');
      await Permission.contacts.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('대중교회 2024년 10월 20일 주보'),
        ),
        body: Image.asset('assets/images/road.jpg'),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(Icons.phone),
              Icon(Icons.tab),
              Icon(Icons.contact_emergency),
            ],
          ),
        ),
      ),
    );
  }
}
