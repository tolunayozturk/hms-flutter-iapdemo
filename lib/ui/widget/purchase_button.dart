import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iap_demo/utility/iap_util.dart';
import 'package:huawei_iap/IapClient.dart';

Widget purchaseButton(BuildContext context, AsyncSnapshot snapshot, int index) {
  return OutlineButton(
    child: Text(
      "${snapshot.data[index].price}",
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    onPressed: () {
      String productId = snapshot.data[index].productId;
      IapClient.isEnvReady().then((res) {
        if (res.returnCode != 0) {
          log("The country or region of the signed-in HUAWEI ID does not support HUAWEI IAP.");
          return;
        }
        IapUtil.purchaseConsumableProduct(productId).then((res) {
          switch (res.returnCode) {
            case 0:
              log("purchaseConsumableProduct: " + productId + " success");
              String purchaseToken = res.inAppPurchaseData.purchaseToken;
              IapUtil.consumeProduct(purchaseToken).then((value) {
                switch (res.returnCode) {
                  case 0:
                    log("consumeProduct: " + productId + " success");
                    break;
                }
              });
              break;
          }
        });
      });
    },
  );
}
