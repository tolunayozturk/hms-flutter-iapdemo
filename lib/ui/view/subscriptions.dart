import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iap_demo/ui/widget/shop_item.dart';
import 'package:flutter_iap_demo/utility/iap_util.dart';
import 'package:huawei_iap/IapClient.dart';

class Subscriptions extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SubscriptionsState();
}

class _SubscriptionsState extends State<Subscriptions> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: Text("MANAGE SUBSCRIPTIONS"),
        onPressed: () {
          // TODO:
        },
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: FutureBuilder(
          future: IapUtil.getSubscriptions(),
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
                  return shopItem(
                      context, snapshot, index, IapClient.IN_APP_SUBSCRIPTION);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
