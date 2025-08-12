// Copyright © 2025 JENTIS GmbH

import 'package:jentis_flutter_example/models/consent_state.dart';
import 'package:jentis_flutter_example/providers/jentis.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/consent.dart' as models;
import 'shared_preferences.dart';

part 'consent.g.dart';

@riverpod
class Consent extends _$Consent {
  @override
  ConsentState build() {
    // Load consents from shared preferences
    final sharedPreferences = ref.watch(sharedPreferencesProvider);
    final consents = sharedPreferences.consents;

    return ConsentState(consents: consents);
  }

  void updateConsent(models.Consent consent) {
    final currentState = state;
    final updatedConsents = List<models.Consent>.from(currentState.consents);

    // Update or add the consent
    final index = updatedConsents.indexWhere(
      (c) => c.vendorId == consent.vendorId,
    );
    if (index != -1) {
      updatedConsents[index] = consent;
    } else {
      updatedConsents.add(consent);
    }

    // Save the updated consents to shared preferences
    ref.read(sharedPreferencesProvider).consents = updatedConsents;

    // Update the state
    state = ConsentState(consents: updatedConsents);

    // Notify Jentis about the consent change
    ref.read(jentisProvider).valueOrNull?.setConsents({
      for (final consent in updatedConsents) consent.vendorId: consent.value,
    });
  }
}
