// Copyright © 2025 JENTIS GmbH

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jentis_flutter/jentis_flutter.dart';

part 'consent.freezed.dart';
part 'consent.g.dart';

@freezed
sealed class Consent with _$Consent {
  const factory Consent({
    required String vendorId,
    @Default(JentisConsentValue.deny) JentisConsentValue value,
  }) = _Consent;

  factory Consent.fromJson(Map<String, dynamic> json) =>
      _$ConsentFromJson(json);
}
