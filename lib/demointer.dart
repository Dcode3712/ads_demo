import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class demointer extends StatefulWidget {
  const demointer({Key? key}) : super(key: key);

  @override
  State<demointer> createState() => _demointerState();
}

class _demointerState extends State<demointer> {
  InterstitialAd? _interstitialAd;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadInter();
  }

  loadInter() {
    InterstitialAd.load(
        adUnitId: 'ca-app-pub-3940256099942544/1033173712',
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            // Keep a reference to the ad so you can show it later.
            this._interstitialAd = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {
            this._interstitialAd = null;
            print('InterstitialAd failed to load: $error');
            loadInter();
          },
        ));
  }

  showInterAds()
  {

    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          print('%ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {

        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return demointer();
          },
        ));

        loadInter();
        ad.dispose();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
      },
      onAdImpression: (InterstitialAd ad) => print('$ad impression occurred.'),
    );

    _interstitialAd!.show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {

              if(_interstitialAd==null)
                {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return demointer();
                    },
                  ));
                }
              else{
                showInterAds();
              }
            },
            child: Text("InterAds")),
      ),
    );
  }
}
