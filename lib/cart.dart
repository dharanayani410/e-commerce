import 'package:flutter/material.dart';

import 'global.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
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
                backgroundImage: NetworkImage(Global.cart[i]['image']),
              ),
              title: Text(Global.cart[i]['item']),
              subtitle: Text(" Total : ₹${Global.cart[i]['total']}"),
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
        itemCount: Global.cart.length,
      ),
    ));
  }
}
