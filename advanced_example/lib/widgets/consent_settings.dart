// Copyright © 2025 JENTIS GmbH

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jentis_flutter/jentis_flutter.dart';

import '../generated/l10n.dart';
import '../providers/consent.dart';

class ConsentSettings extends ConsumerWidget {
  const ConsentSettings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final consentState = ref.watch(consentProvider);

    return Column(
      children: [
        for (final consent in consentState.consents)
          Padding(
            padding:
                consentState.consents.lastOrNull != consent
                    ? const EdgeInsets.only(bottom: 16.0)
                    : EdgeInsets.zero,
            child: DropdownMenu<JentisConsentValue>(
              width: double.infinity,
              initialSelection: consent.value,
              label: Text(consent.vendorId),
              dropdownMenuEntries: [
                DropdownMenuEntry<JentisConsentValue>(
                  value: JentisConsentValue.deny,
                  label: Strings.of(context).consentDenied,
                ),
                DropdownMenuEntry<JentisConsentValue>(
                  value: JentisConsentValue.allow,
                  label: Strings.of(context).consentGiven,
                ),
                DropdownMenuEntry<JentisConsentValue>(
                  value: JentisConsentValue.ncm,
                  label: Strings.of(context).ncm,
                ),
              ],
              onSelected: (value) {
                ref
                    .read(consentProvider.notifier)
                    .updateConsent(
                      consent.copyWith(value: value ?? JentisConsentValue.deny),
                    );
              },
            ),
          ),
      ],
    );
  }
}
