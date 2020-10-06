import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_iap_demo/ui/view/home.dart';
import 'package:flutter_iap_demo/utility/iap_util.dart';
import 'package:huawei_iap/IapClient.dart';
import 'package:huawei_iap/model/InAppPurchaseData.dart';

void main() {
  runApp(IapDemoApp());

  // Check Subscription Validity
  IapUtil.obtainOwnedPurchases(IapClient.IN_APP_SUBSCRIPTION).then((res) {
    if (res.returnCode != 0) {
      // Update UI
      return;
    }

    for (InAppPurchaseData purchase in res.inAppPurchaseDataList) {
      if (purchase.purchaseState == 0 && purchase.subIsvalid) {
        // Provide services for the subscription as long as it is valid
        log(purchase.toJson().toString());
      }
    }
  });
}

class IapDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
