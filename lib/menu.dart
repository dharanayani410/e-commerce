import 'package:flutter/material.dart';

import 'global.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    List data = ModalRoute.of(context)!.settings.arguments as List;
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                  padding: EdgeInsets.all(50),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data[0]['title'],
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "menu",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ))),
          Expanded(
              flex: 3,
              child: ListView(
                padding: EdgeInsets.all(10),
                children: data
                    .map((e) => Card(
                          margin: EdgeInsets.all(10),
                          elevation: 5,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(e['image']),
                            ),
                            title: Text(e['item']),
                            onTap: () {
                              Navigator.pushNamed(context, 'detail',
                                  arguments: e);
                            },
                            trailing: IconButton(
                              icon: (e['isActive'] == false)
                                  ? Icon(Icons.favorite_border)
                                  : Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                              onPressed: () {
                                setState(() {
                                  e['isActive'] = !e['isActive'];
                                  Global.favorite.add(e);
                                });
                              },
                            ),
                          ),
                        ))
                    .toList(),
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.favorite,
          color: Colors.red,
        ),
        onPressed: () {
          Navigator.pushNamed(context, 'favorite');
        },
      ),
      backgroundColor: Colors.cyan.shade300,
    ));
  }
}
