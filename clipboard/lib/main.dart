import 'dart:async';

import 'package:flutter/material.dart';
import 'copy_string.dart' as cp;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.black,
      ),
      home: MyHomePage(title: 'Clipboard'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  final _timer = new Timer.periodic(const Duration(seconds: 2), (timer) {
    if (cp.hostValid) {
      cp.fetchString();
    }
  });

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String host = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              onChanged: (s) => cp.changeHost(s),
              decoration: const InputDecoration(
                hintText: 'Enter PC IP here',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Some Text';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
