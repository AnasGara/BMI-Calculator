import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io';

class AdService {
  static final AdService _instance = AdService._internal();
  factory AdService() => _instance;
  AdService._internal();

  int _calculationCount = 0;

  Future<void> init() async {
    await MobileAds.instance.initialize();
  }

  String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8118443350307206/4788794414';
    } else if (Platform.isIOS) {
      // User specified android only, but keeping a placeholder for safety
      return 'ca-app-pub-3940256099942544/2934735716';
    }
    throw UnsupportedError('Unsupported platform');
  }

  String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8118443350307206/9163153697';
    } else if (Platform.isIOS) {
      // User specified android only, but keeping a placeholder for safety
      return 'ca-app-pub-3940256099942544/4411468910';
    }
    throw UnsupportedError('Unsupported platform');
  }

  void incrementCalculationCount() {
    _calculationCount++;
    // We can keep this if we want periodic ads, but the user requested one on every calculation.
  }

  void showInterstitialAd({VoidCallback? onAdDismissed}) {
    InterstitialAd.load(
      adUnitId: interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              if (onAdDismissed != null) onAdDismissed();
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              ad.dispose();
              if (onAdDismissed != null) onAdDismissed();
            },
          );
          ad.show();
        },
        onAdFailedToLoad: (error) {
          print('InterstitialAd failed to load: $error');
          if (onAdDismissed != null) onAdDismissed();
        },
      ),
    );
  }
}
