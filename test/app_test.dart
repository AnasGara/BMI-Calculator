import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bmicalculator/main.dart';
import 'package:bmicalculator/services/storage_service.dart';

void main() {
  setUpAll(() {
    // Mock SharedPreferences for testing
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('BMI Calculator app loads successfully', (WidgetTester tester) async {
    // Setup dependencies
    final prefs = await SharedPreferences.getInstance();
    final storageService = StorageService(prefs);
    
    // Build the app with providers
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          Provider.value(value: storageService),
          ChangeNotifierProvider(create: (_) => AppState(storageService)),
        ],
        child: const BMICalculatorApp(),
      ),
    );
    
    await tester.pump();
    
    // Verify the app doesn't crash
    expect(find.byType(MaterialApp), findsOneWidget);

    // Pump and settle to handle splash screen timer
    await tester.pumpAndSettle(const Duration(seconds: 3));
  });
}