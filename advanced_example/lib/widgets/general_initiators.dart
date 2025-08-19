// Copyright © 2025 JENTIS GmbH

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jentis_flutter/jentis_flutter.dart';

import '../generated/l10n.dart';
import '../providers/jentis.dart';

class GeneralInitiators extends ConsumerWidget {
  const GeneralInitiators({
    super.key,
    required this.includeEnrichmentData,
    required this.customInitiator,
  });

  final bool includeEnrichmentData;
  final String? customInitiator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(Strings.of(context).generalInitiators),
        const SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () async {
            final jentis = ref.read(jentisProvider);

            // Push page view event
            await jentis.valueOrNull?.push([
              JentisEventData(
                stringAttributes: {
                  'track': 'pageview',
                  'pagetitle': 'Demo-APP Pagetitle',
                  'url': 'https://www.demoapp.com',
                },
              ),
            ]);

            // Include enrichment data in the event
            if (includeEnrichmentData) {
              await jentis.valueOrNull?.addEnrichment(
                JentisEnrichment(
                  pluginId: 'productEnrichmentService',
                  arguments: {'page_title': 'pagetitle'},
                  variables: ['enrich_product_name', 'enrich_product_brutto'],
                ),
              );
            }

            // Submit event with custom initiator if provided
            if (customInitiator != null) {
              await jentis.valueOrNull?.submit(customInitiator!);
            } else {
              await jentis.valueOrNull?.submit();
            }

            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  showCloseIcon: true,
                  behavior: SnackBarBehavior.floating,
                  content: Text(Strings.of(context).eventSent),
                  duration: const Duration(seconds: 3),
                ),
              );
            }
          },
          child: Text(Strings.of(context).pageViewAction),
        ),
        const SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () async {
            final jentis = ref.read(jentisProvider);

            // Push multiple events for product view action
            await jentis.valueOrNull?.push([
              JentisEventData(
                stringAttributes: {
                  'track': 'pageview',
                  'pagetitle': 'Demo-APP Productview',
                },
              ),
              JentisEventData(
                stringAttributes: {
                  'track': 'product',
                  'type': 'productview',
                  'id': '123',
                  'name': 'Testproduct',
                },
                doubleAttributes: {'brutto': 199.99},
              ),
              JentisEventData(stringAttributes: {'track': 'productview'}),
            ]);

            // Include enrichment data in the event
            if (includeEnrichmentData) {
              await jentis.valueOrNull?.addEnrichment(
                JentisEnrichment(
                  pluginId: 'productEnrichmentService',
                  arguments: {
                    'productId': 'product_id',
                    'page_title': 'pagetitle',
                  },
                  variables: ['enrich_product_name', 'enrich_product_brutto'],
                ),
              );
            }

            // Submit event with custom initiator if provided
            if (customInitiator != null) {
              await jentis.valueOrNull?.submit(customInitiator!);
            } else {
              await jentis.valueOrNull?.submit();
            }

            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  showCloseIcon: true,
                  behavior: SnackBarBehavior.floating,
                  content: Text(Strings.of(context).eventSent),
                  duration: const Duration(seconds: 3),
                ),
              );
            }
          },
          child: Text(Strings.of(context).productViewAction),
        ),
      ],
    );
  }
}
