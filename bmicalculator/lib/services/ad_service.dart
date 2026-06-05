import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io';

class AdService {
  static final AdService _instance = AdService._internal();
  factory AdService() => _instance;
  AdService._internal();

  int _calculationCount = 0;
  InterstitialAd? _interstitialAd;
  bool _isInterstitialAdLoading = false;

  Future<void> init() async {
    await MobileAds.instance.initialize();
    _loadInterstitialAd();
  }

  String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8118443350307206/4788794414';
    } else if (Platform.isIOS) {
      // TODO: Replace with your production iOS Banner Ad Unit ID
      return 'ca-app-pub-3940256099942544/2934735716';
    }
    throw UnsupportedError('Unsupported platform');
  }

  String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8118443350307206/9163153697';
    } else if (Platform.isIOS) {
      // TODO: Replace with your production iOS Interstitial Ad Unit ID
      return 'ca-app-pub-3940256099942544/4411468910';
    }
    throw UnsupportedError('Unsupported platform');
  }

  void incrementCalculationCount() {
    _calculationCount++;
    // We can keep this if we want periodic ads, but the user requested one on every calculation.
  }

  void _loadInterstitialAd() {
    if (_isInterstitialAdLoading || _interstitialAd != null) return;

    _isInterstitialAdLoading = true;
    InterstitialAd.load(
      adUnitId: interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          _isInterstitialAdLoading = false;
          _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              _interstitialAd = null;
              _loadInterstitialAd();
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              ad.dispose();
              _interstitialAd = null;
              _loadInterstitialAd();
            },
          );
        },
        onAdFailedToLoad: (error) {
          _isInterstitialAdLoading = false;
          _interstitialAd = null;
          print('InterstitialAd failed to load: $error');
        },
      ),
    );
  }

  void showInterstitialAd({VoidCallback? onAdDismissed}) {
    if (_interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          _interstitialAd = null;
          if (onAdDismissed != null) onAdDismissed();
          _loadInterstitialAd();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          _interstitialAd = null;
          if (onAdDismissed != null) onAdDismissed();
          _loadInterstitialAd();
        },
      );
      _interstitialAd!.show();
    } else {
      if (onAdDismissed != null) onAdDismissed();
      _loadInterstitialAd();
    }
  }
}
