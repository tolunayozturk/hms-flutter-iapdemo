import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iap_demo/ui/widget/shop_item.dart';
import 'package:flutter_iap_demo/utility/iap_util.dart';
import 'package:huawei_iap/IapClient.dart';
import 'package:huawei_iap/model/InAppPurchaseData.dart';

class NonConsumables extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NonConsumablesState();
}

class _NonConsumablesState extends State<NonConsumables> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: Text("RESTORE PURCHASES"),
        onPressed: () {
          IapUtil.obtainOwnedPurchases(IapClient.IN_APP_NONCONSUMABLE)
              .then((res) {
            if (res.returnCode != 0) {
              // Update UI
              return;
            }

            for (InAppPurchaseData purchase in res.inAppPurchaseDataList) {
              if (purchase.purchaseState == 0) {
                log("Deliver the product: " + purchase.productId);
                // Deliver the product.
              }
            }
          });
        },
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: FutureBuilder(
          future: IapUtil.getNonConsumableProducts(),
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
                      context, snapshot, index, IapClient.IN_APP_NONCONSUMABLE);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
