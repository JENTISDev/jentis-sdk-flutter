import 'package:flutter/material.dart';
import 'package:jentis_flutter/jentis_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final jentis = Jentis();
  await jentis.initialize(
    TrackConfigData(
      customProtocol: CustomProtocol.https,
      // cSpell:ignore kndmjh
      trackDomain: 'kndmjh.nuuk.jtm-demo.com',
      container: 'nuuk',
      version: '1',
      debugCode: '63832533-c83b-48f2-883d-74289329af7a',
      authorizationToken: '1234',
      environment: JentisEnvironment.live,
      offlineTimeout: 3600,
    ),
  );

  runApp(MyApp(jentis: jentis));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.jentis});

  final Jentis jentis;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Jentis example app')),
        body: Builder(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 8.0,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      // Include enrichment data in the event
                      await jentis.addEnrichment(
                        JentisEnrichment(
                          pluginId: 'productEnrichmentService',
                          arguments: {'productId': 'product_id'},
                          variables: [
                            'enrich_product_name',
                            'enrich_product_brutto',
                          ],
                        ),
                      );

                      // Push multiple events for add to cart action
                      await jentis.push([
                        JentisEventData(
                          stringAttributes: {
                            'track': 'product',
                            'type': 'addtocart',
                            'id': '123',
                            'name': 'Testproduct',
                          },
                          doubleAttributes: {'brutto': 199.99},
                        ),
                        JentisEventData(
                          stringAttributes: {'track': 'addtocart'},
                        ),
                      ]);

                      // Submit event with optional custom initiator
                      await jentis.submit('customInitiator');

                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            showCloseIcon: true,
                            behavior: SnackBarBehavior.floating,
                            content: Text('Event sent'),
                            duration: const Duration(seconds: 3),
                          ),
                        );
                      }
                    },
                    child: Text('Add-To-Cart'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // Notify Jentis about the consent change
                      jentis.setConsents({
                        'facebook': JentisConsentValue.allow,
                      });

                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            showCloseIcon: true,
                            behavior: SnackBarBehavior.floating,
                            content: Text('Consent updated'),
                            duration: const Duration(seconds: 3),
                          ),
                        );
                      }
                    },
                    child: Text('Update consent'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
