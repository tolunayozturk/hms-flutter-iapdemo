import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'consumables.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HUAWEI In-App Purchases Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            OutlineButton(
              child: Text("CONSUMABLES"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Consumables()));
              },
            ),
            OutlineButton(
              child: Text("NON-CONSUMABLES"),
              onPressed: () {},
            ),
            OutlineButton(
              child: Text("SUBSCRIPTIONS"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
