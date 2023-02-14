import 'package:exam/detail.dart';
import 'package:exam/menu.dart';
import 'package:flutter/material.dart';

import 'global.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const MyApp(),
      'menu': (context) => const Menu(),
      'detail': (context) => const Detail()
    },
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          padding: EdgeInsets.all(10),
          itemBuilder: (context, i) {
            return Card(
              margin: EdgeInsets.all(20),
              elevation: 5,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(Global.menu[i]['image']),
                ),
                title: Text(Global.menu[i]['item']),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
                onTap: () {
                  Navigator.pushNamed(context, 'menu',
                      arguments: Global.menu[i]['list']);
                },
              ),
            );
          },
          itemCount: Global.menu.length,
        ),
        backgroundColor: Colors.cyan,
      ),
    );
  }
}
