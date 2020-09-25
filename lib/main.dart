import 'package:flutter/material.dart';
import 'package:flutter_iap_demo/ui/view/home.dart';

void main() {
  runApp(IapDemoApp());
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