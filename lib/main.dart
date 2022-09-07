import 'package:ads_demo/demobanner.dart';
import 'package:ads_demo/demointer.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  runApp(MaterialApp(home: demointer(),));
}


