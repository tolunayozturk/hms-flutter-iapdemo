import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iap_demo/ui/view/non-consumables.dart';
import 'package:flutter_iap_demo/ui/view/subscriptions.dart';

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
            Spacer(),
            OutlineButton(
              child: Text("CONSUMABLES"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Consumables()));
              },
            ),
            OutlineButton(
              child: Text("NON-CONSUMABLES"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NonConsumables()));
              },
            ),
            OutlineButton(
              child: Text("SUBSCRIPTIONS"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Subscriptions()));
              },
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
