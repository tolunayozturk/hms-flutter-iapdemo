import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:huawei_iap/IapClient.dart';
import 'package:huawei_iap/model/ConsumeOwnedPurchaseReq.dart';
import 'package:huawei_iap/model/ConsumeOwnedPurchaseResult.dart';
import 'package:huawei_iap/model/OwnedPurchasesReq.dart';
import 'package:huawei_iap/model/OwnedPurchasesResult.dart';
import 'package:huawei_iap/model/ProductInfo.dart';
import 'package:huawei_iap/model/ProductInfoReq.dart';
import 'package:huawei_iap/model/ProductInfoResult.dart';
import 'package:huawei_iap/model/PurchaseIntentReq.dart';
import 'package:huawei_iap/model/PurchaseResultInfo.dart';
import 'package:huawei_iap/model/StartIapActivityReq.dart';

class IapUtil {
  /*
  *  This class is purely for demo purposes, you can implement these methods
  *  in a way that suits you and your application flow.
  * */

  static Future<List<ProductInfo>> getConsumableProducts() async {
    try {
      ProductInfoReq req = new ProductInfoReq();
      req.priceType = IapClient.IN_APP_CONSUMABLE;
      req.skuIds = ["prod_01", "prod_02"];

      ProductInfoResult res = await IapClient.obtainProductInfo(req);

      return res.productInfoList;
    } on PlatformException catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<List<ProductInfo>> getNonConsumableProducts() async {
    try {
      ProductInfoReq req = new ProductInfoReq();
      req.priceType = IapClient.IN_APP_NONCONSUMABLE;
      req.skuIds = ["prod_03"];

      ProductInfoResult res = await IapClient.obtainProductInfo(req);

      return res.productInfoList;
    } on PlatformException catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<List<ProductInfo>> getSubscriptions() async {
    try {
      ProductInfoReq req = new ProductInfoReq();
      req.priceType = IapClient.IN_APP_SUBSCRIPTION;
      req.skuIds = ["prod_04"];

      ProductInfoResult res = await IapClient.obtainProductInfo(req);

      return res.productInfoList;
    } on PlatformException catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<PurchaseResultInfo> purchaseConsumableProduct(
      String productId) async {
    try {
      PurchaseIntentReq req = new PurchaseIntentReq();
      req.priceType = IapClient.IN_APP_CONSUMABLE;
      req.productId = productId;
      req.developerPayload = "Test";

      PurchaseResultInfo res = await IapClient.createPurchaseIntent(req);

      return res;
    } on PlatformException catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<PurchaseResultInfo> purchaseNonConsumableProduct(
      String productId) async {
    try {
      PurchaseIntentReq req = new PurchaseIntentReq();
      req.priceType = IapClient.IN_APP_NONCONSUMABLE;
      req.productId = productId;
      req.developerPayload = "Test";

      PurchaseResultInfo res = await IapClient.createPurchaseIntent(req);

      return res;
    } on PlatformException catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<PurchaseResultInfo> purchaseSubscription(
      String productId) async {
    try {
      PurchaseIntentReq req = new PurchaseIntentReq();
      req.priceType = IapClient.IN_APP_SUBSCRIPTION;
      req.productId = productId;
      req.developerPayload = "Test";

      PurchaseResultInfo res = await IapClient.createPurchaseIntent(req);

      return res;
    } on PlatformException catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<ConsumeOwnedPurchaseResult> consumeProduct(
      String purchaseToken) async {
    try {
      ConsumeOwnedPurchaseReq req = new ConsumeOwnedPurchaseReq();
      req.purchaseToken = purchaseToken;

      ConsumeOwnedPurchaseResult res =
          await IapClient.consumeOwnedPurchase(req);

      return res;
    } on PlatformException catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<OwnedPurchasesResult> obtainOwnedPurchases(int productType) async {
    try {
      OwnedPurchasesReq req = new OwnedPurchasesReq();
      req.priceType = productType;

      OwnedPurchasesResult res = await IapClient.obtainOwnedPurchases(req);

      return res;
    } on PlatformException catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<void> startIapActivityForSubscriptions() async {
    try {
      StartIapActivityReq req = new StartIapActivityReq();
      req.type = IapClient.IN_APP_SUBSCRIPTION;

      await IapClient.startIapActivity(req);
    } on PlatformException catch (e) {
      log(e.toString());
    }
  }
}
