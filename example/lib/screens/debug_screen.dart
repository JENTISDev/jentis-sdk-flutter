// Copyright © 2025 JENTIS GmbH

import 'package:flutter/material.dart';
import 'package:flutter_json_view/flutter_json_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../generated/l10n.dart';
import '../providers/debug.dart';

class DebugScreen extends ConsumerWidget {
  const DebugScreen({super.key});

  static const path = 'debug';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final requests = ref.watch(debugProvider);

    return Scaffold(
      appBar: AppBar(title: Text(Strings.of(context).debugScreen)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child:
                  requests.isEmpty
                      ? Center(child: Text(Strings.of(context).noRequestsYet))
                      : ListView(
                        semanticChildCount: requests.length,
                        children:
                            requests.map((request) {
                              return ListTile(
                                title: Text(
                                  '${DateFormat('HH:mm:ss').format(request.timestamp)} - ${request.url}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle:
                                    request.body?.isNotEmpty == true
                                        ? JsonView.string(request.body!)
                                        : null,
                              );
                            }).toList(),
                      ),
            ),
            if (requests.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    ref.read(debugProvider.notifier).clear();
                  },
                  child: Text(Strings.of(context).clearDebugInfo),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
