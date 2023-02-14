import 'package:flutter/material.dart';

import 'global.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView.builder(
        itemBuilder: (context, i) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(Global.favorite[i]['image']),
              ),
              title: Text(Global.favorite[i]['item']),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    Global.cart.remove(Global.cart[i]);
                  });
                },
              ),
            ),
          );
        },
        itemCount: Global.favorite.length,
      ),
    ));
  }
}
