import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/history_provider.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final history = context.watch<HistoryProvider>().items;
    final formatter = DateFormat('HH:mm:ss dd/MM');

    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: history.length,
        itemBuilder: (context, index) {
          final item = history[index];
          return Card(
            child: ListTile(
              title: Text(item.expression),
              subtitle: Text(
                '${item.result} - ${formatter.format(item.time)}',
              ),
            ),
          );
        },
      ),
    );
  }
}
