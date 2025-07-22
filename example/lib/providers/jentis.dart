// Copyright © 2025 JENTIS GmbH

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jentis_flutter/jentis_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'jentis.g.dart';

@riverpod
Jentis jentis(Ref ref) {
  return Jentis();
}
