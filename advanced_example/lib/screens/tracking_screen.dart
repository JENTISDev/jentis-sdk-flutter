// Copyright © 2025 JENTIS GmbH

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jentis_flutter_example/widgets/e_commerce_initiators.dart';

import '../generated/l10n.dart';
import '../widgets/general_initiators.dart';

class TrackingScreen extends ConsumerStatefulWidget {
  const TrackingScreen({super.key});

  static const path = 'tracking';

  @override
  ConsumerState<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends ConsumerState<TrackingScreen> {
  bool _includeEnrichmentData = false;
  String? _customInitiator;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Strings.of(context).trackingActions)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SwitchListTile(
                title: Text(Strings.of(context).includeEnrichmentData),
                value: _includeEnrichmentData,
                onChanged: (bool value) {
                  setState(() {
                    _includeEnrichmentData = value;
                  });
                },
              ),
              const SizedBox(height: 24.0),
              TextField(
                decoration: InputDecoration(
                  labelText: Strings.of(context).customInitiatorLabel,
                  hintText: Strings.of(context).enterCustomInitiator,
                ),
                onChanged: (String value) {
                  setState(() {
                    _customInitiator = value.isNotEmpty ? value : null;
                  });
                },
              ),
              const SizedBox(height: 24.0),
              GeneralInitiators(
                includeEnrichmentData: _includeEnrichmentData,
                customInitiator: _customInitiator,
              ),
              const SizedBox(height: 16.0),
              ECommerceInitiators(
                includeEnrichmentData: _includeEnrichmentData,
                customInitiator: _customInitiator,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
