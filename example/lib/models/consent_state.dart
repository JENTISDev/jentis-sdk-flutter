// Copyright © 2025 JENTIS GmbH

import 'package:freezed_annotation/freezed_annotation.dart';

import 'consent.dart';

part 'consent_state.freezed.dart';
part 'consent_state.g.dart';

@freezed
sealed class ConsentState with _$ConsentState {
  const factory ConsentState({required List<Consent> consents}) = _ConsentState;

  factory ConsentState.fromJson(Map<String, dynamic> json) =>
      _$ConsentStateFromJson(json);
}
