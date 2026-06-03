import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../services/bmi_calculator.dart';
import '../services/storage_service.dart';
import '../services/ad_service.dart';
import '../widgets/unit_toggle.dart';
import '../widgets/ad_banner_widget.dart';
import '../main.dart';
import 'result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _weightController = TextEditingController();
  final _heightCmController = TextEditingController();
  final _heightFtController = TextEditingController();
  final _heightInController = TextEditingController();

  @override
  void dispose() {
    _weightController.dispose();
    _heightCmController.dispose();
    _heightFtController.dispose();
    _heightInController.dispose();
    super.dispose();
  }

  void _calculate() {
    final appState = context.read<AppState>();
    double weightKg = 0;
    double heightCm = 0;

    try {
      if (appState.unitSystem == 'metric') {
        weightKg = double.parse(_weightController.text);
        heightCm = double.parse(_heightCmController.text);
      } else {
        double weightLbs = double.parse(_weightController.text);
        int ft = int.parse(_heightFtController.text);
        int inches = int.parse(_heightInController.text);
        weightKg = BMICalculator.lbsToKg(weightLbs);
        heightCm = BMICalculator.ftInToCm(ft, inches);
      }

      if (weightKg > 0 && heightCm > 0) {
        final bmi = BMICalculator.calculateBMI(weightKg: weightKg, heightCm: heightCm);
        
        final entry = {
          'bmi': bmi,
          'date': DateTime.now().toIso8601String(),
          'unitSystem': appState.unitSystem,
        };
        
        context.read<StorageService>().addHistory(entry);
        AdService().incrementCalculationCount();

        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => ResultScreen(bmi: bmi)),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter valid numbers')),
      );
    }
  }

  void _handleUnitToggle(String system) {
    final appState = context.read<AppState>();
    if (appState.unitSystem == system) return;

    try {
      if (system == 'imperial') {
        // Metric to Imperial
        if (_weightController.text.isNotEmpty) {
          double kg = double.parse(_weightController.text);
          _weightController.text = BMICalculator.kgToLbs(kg).toStringAsFixed(1);
        }
        if (_heightCmController.text.isNotEmpty) {
          double cm = double.parse(_heightCmController.text);
          final ftIn = BMICalculator.cmToFtIn(cm);
          _heightFtController.text = ftIn['ft'].toString();
          _heightInController.text = ftIn['in'].toString();
        }
      } else {
        // Imperial to Metric
        if (_weightController.text.isNotEmpty) {
          double lbs = double.parse(_weightController.text);
          _weightController.text = BMICalculator.lbsToKg(lbs).toStringAsFixed(1);
        }
        if (_heightFtController.text.isNotEmpty && _heightInController.text.isNotEmpty) {
          int ft = int.parse(_heightFtController.text);
          int inches = int.parse(_heightInController.text);
          _heightCmController.text = BMICalculator.ftInToCm(ft, inches).toStringAsFixed(1);
        }
      }
    } catch (e) {}

    appState.setUnitSystem(system);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final appState = context.watch<AppState>();
    final isMetric = appState.unitSystem == 'metric';

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: UnitToggle(
              currentUnit: appState.unitSystem,
              onToggle: _handleUnitToggle,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    l10n.weight + ' (${isMetric ? l10n.kg : l10n.lbs})',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      hintText: '0.0',
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    l10n.height + ' (${isMetric ? l10n.cm : l10n.feet + '/' + l10n.inches})',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  if (isMetric)
                    TextField(
                      controller: _heightCmController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        hintText: '0.0',
                      ),
                    )
                  else
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _heightFtController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                              labelText: l10n.feet,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextField(
                            controller: _heightInController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                              labelText: l10n.inches,
                            ),
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: 48),
                  ElevatedButton(
                    onPressed: _calculate,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    ),
                    child: Text(l10n.calculate, style: const TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ),
          ),
          const AdBannerWidget(),
        ],
      ),
    );
  }
}
