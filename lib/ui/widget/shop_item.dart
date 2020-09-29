import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iap_demo/ui/widget/purchase_button.dart';

Widget shopItem(
    BuildContext context, AsyncSnapshot snapshot, int index, int productType) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.grey.withAlpha(32),
        border: Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.circular(8)),
    margin: EdgeInsets.symmetric(vertical: 8),
    child: ListTile(
      title: Text(
        "${snapshot.data[index].productName}",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      subtitle: Text("${snapshot.data[index].productDesc}"),
      trailing: purchaseButton(context, snapshot, index, productType),
    ),
  );
}
