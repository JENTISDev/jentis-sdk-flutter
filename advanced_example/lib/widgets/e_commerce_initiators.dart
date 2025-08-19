// Copyright © 2025 JENTIS GmbH

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jentis_flutter/jentis_flutter.dart';

import '../generated/l10n.dart';
import '../providers/jentis.dart';

class ECommerceInitiators extends ConsumerWidget {
  const ECommerceInitiators({
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
        Text(Strings.of(context).eCommerceInitiators),
        const SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () async {
            final jentis = ref.read(jentisProvider);

            // Push multiple events for add to cart action
            await jentis.valueOrNull?.push([
              JentisEventData(
                stringAttributes: {
                  'track': 'product',
                  'type': 'addtocart',
                  'id': '123',
                  'name': 'Testproduct',
                },
                doubleAttributes: {'brutto': 199.99},
              ),
              JentisEventData(stringAttributes: {'track': 'addtocart'}),
            ]);

            // Include enrichment data in the event
            if (includeEnrichmentData) {
              await jentis.valueOrNull?.addEnrichment(
                JentisEnrichment(
                  pluginId: 'productEnrichmentService',
                  arguments: {'productId': 'product_id'},
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
          child: Text(Strings.of(context).addToCartAction),
        ),
        const SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () async {
            final jentis = ref.read(jentisProvider);

            // Push multiple events for order action
            await jentis.valueOrNull?.push([
              JentisEventData(
                stringAttributes: {
                  'track': 'pageview',
                  'pagetitle': 'Demo-APP Order Confirmed',
                },
              ),
              JentisEventData(
                stringAttributes: {
                  'track': 'product',
                  'type': 'order',
                  'id': '123',
                  'name': 'Testproduct',
                },
                doubleAttributes: {'brutto': 199.99},
              ),
              JentisEventData(
                stringAttributes: {
                  'track': 'product',
                  'type': 'order',
                  'id': '456',
                  'name': 'Testproduct 2',
                },
                doubleAttributes: {'brutto': 299.99},
              ),
              JentisEventData(
                stringAttributes: {
                  'track': 'order',
                  'orderid': '12345666',
                  'paytype': 'creditcard',
                },
                doubleAttributes: {'brutto': 499.98},
              ),
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
          child: Text(Strings.of(context).orderAction),
        ),
      ],
    );
  }
}
