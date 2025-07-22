// Copyright © 2025 JENTIS GmbH

import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_info.freezed.dart';
part 'request_info.g.dart';

@freezed
sealed class RequestInfo with _$RequestInfo {
  RequestInfo._();

  factory RequestInfo({required String url, String? body}) = _RequestInfo;

  factory RequestInfo.fromJson(Map<String, dynamic> json) =>
      _$RequestInfoFromJson(json);

  @override
  late final DateTime timestamp = DateTime.now();
}
