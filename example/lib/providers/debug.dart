// Copyright © 2025 JENTIS GmbH

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:jentis_flutter_example/models/request_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'debug.g.dart';

const eventChannel = EventChannel('debug_requests');

@riverpod
class Debug extends _$Debug {
  late final StreamSubscription _debugSubscription;

  @override
  List<RequestInfo> build() {
    ref.onDispose(() {
      _debugSubscription.cancel();
    });

    _debugSubscription = eventChannel.receiveBroadcastStream().listen((event) {
      dynamic deepConvert(dynamic value) {
        if (value is Map) {
          return value.map((k, v) => MapEntry(k.toString(), deepConvert(v)));
        } else if (value is List) {
          return value.map(deepConvert).toList();
        } else {
          return value;
        }
      }

      final map = deepConvert(event) as Map<String, dynamic>;
      final info = RequestInfo.fromJson(map);

      if (kDebugMode) print('Debug info received: $info');

      state = [...state, info];
    });

    return [];
  }

  void clear() {
    if (kDebugMode) print('Clearing debug info');
    state = [];
  }
}
