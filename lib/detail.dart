import 'package:flutter/material.dart';

import 'global.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.shopping_cart_outlined),
          onPressed: () {
            Navigator.pushNamed(context, 'cart');
          },
        ),
        body: Center(
            child: Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          height: 250,
          width: 300,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1, color: Colors.black),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Image.network(
                      data['image'],
                      height: 100,
                      width: 100,
                    ),
                    SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['item'],
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                        Text("₹ ${data['price']}")
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(data['detail']),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Total : ₹ ${data['total']}"),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              Global.cart.add(data);
                              print(Global.cart);
                            });
                          },
                          icon: Icon(Icons.shopping_cart_outlined))
                    ],
                  )),
                  Expanded(
                      child: Container(
                    child: Row(
                      children: [
                        Expanded(
                            child: IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              if (data['i'] > 0) {
                                data['i']--;
                                data['total'] -= data['price'];
                              }
                            });
                          },
                        )),
                        Expanded(child: Center(child: Text("${data['i']}"))),
                        Expanded(
                            child: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              data['i']++;
                              data['total'] = data['price'] * data['i'];
                            });
                          },
                        ))
                      ],
                    ),
                  ))
                ],
              )
            ],
          ),
        )),
        backgroundColor: Colors.white,
      ),
    );
  }
}
