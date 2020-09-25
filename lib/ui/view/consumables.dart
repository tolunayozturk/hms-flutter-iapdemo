import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iap_demo/ui/widget/shop_item.dart';
import 'package:flutter_iap_demo/utility/iap_util.dart';

class Consumables extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ConsumablesState();
}

class _ConsumablesState extends State<Consumables> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: FutureBuilder(
          future: IapUtil.getConsumableProducts(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return shopItem(context, snapshot, index);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
