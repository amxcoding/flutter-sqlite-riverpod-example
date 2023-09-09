import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'presentation_layer/app.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}
