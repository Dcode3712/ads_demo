import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'AppLifecycleReactor.dart';
import 'AppOpenAdManager.dart';

class demobanner extends StatefulWidget {
  const demobanner({Key? key}) : super(key: key);

  @override
  State<demobanner> createState() => _demobannerState();
}

class _demobannerState extends State<demobanner> {

   AdWidget? adWidget;
   BannerAd? myBanner;

   late AppLifecycleReactor _appLifecycleReactor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    AppOpenAdManager appOpenAdManager = AppOpenAdManager()..loadAd();
    _appLifecycleReactor =
        AppLifecycleReactor(appOpenAdManager: appOpenAdManager);
    _appLifecycleReactor.listenToAppStateChanges();

    loadBanner();
  }

  loadBanner()
  {
      myBanner = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      size: AdSize.largeBanner,
      request: AdRequest(),
      listener: BannerAdListener(),
    );

    myBanner!.load();

      adWidget = AdWidget(ad: myBanner!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("bannerads"),),

        body: Center(
          child: Container(
            alignment: Alignment.center,
            child: adWidget!,
            width: myBanner!.size.width.toDouble(),
            height: myBanner!.size.height.toDouble(),
          ),
        ),
    );
  }
}
