import 'package:flutter/material.dart';
import 'package:bmicalculator/generated/app_localizations.dart';
class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.privacyPolicy)),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Last updated: October 2023',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 24),
            Text(
              'Your privacy is important to us. It is our policy to respect your privacy regarding any information we may collect while operating our app.',
            ),
            SizedBox(height: 16),
            Text(
              '1. Data Collection',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We do not collect any personal data. All BMI calculations and history are stored locally on your device and are never sent to any server.',
            ),
            SizedBox(height: 16),
            Text(
              '2. Advertisements',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We use Google AdMob to display advertisements. AdMob may collect data such as device identifiers and cookies to show relevant ads. Please refer to Google AdMob privacy policy for more details.',
            ),
            SizedBox(height: 16),
            Text(
              '3. Changes to This Policy',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page.',
            ),
          ],
        ),
      ),
    );
  }
}
