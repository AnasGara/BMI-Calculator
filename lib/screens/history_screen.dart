import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bmicalculator/generated/app_localizations.dart';
import 'package:intl/intl.dart';
import '../services/storage_service.dart';
import '../services/bmi_calculator.dart';
import '../widgets/ad_banner_widget.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final storage = context.watch<StorageService>();
    final history = storage.getHistory();

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.history),
        actions: [
          if (history.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_sweep),
              onPressed: () => _confirmClear(context),
            ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: history.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.history, size: 64, color: Theme.of(context).colorScheme.outline),
                        const SizedBox(height: 16),
                        Text(l10n.noHistory, style: const TextStyle(fontSize: 18)),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: history.length,
                    itemBuilder: (context, index) {
                      final entry = history[index];
                      final double bmi = entry['bmi'];
                      final DateTime date = DateTime.parse(entry['date']);
                      final category = BMICalculator.getCategory(bmi);
                      final color = BMICalculator.getCategoryColor(category);

                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: color,
                            foregroundColor: Colors.white,
                            child: Text(bmi.toStringAsFixed(1), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                          ),
                          title: Text(BMICalculator.getCategoryName(context, category)),
                          subtitle: Text(DateFormat.yMMMd().add_jm().format(date)),
                          trailing: Text(entry['unitSystem'] == 'metric' ? l10n.metric : l10n.imperial),
                        ),
                      );
                    },
                  ),
          ),
          const AdBannerWidget(),
        ],
      ),
    );
  }

  void _confirmClear(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.clearHistory),
        content: Text("Confirm"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              context.read<StorageService>().clearHistory();
              setState(() {});
              Navigator.pop(context);
            },
            child: Text("Confirm", style: const TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
