import 'package:flutter/material.dart';
import 'package:flutter_sql_riverpod_example_v2/presentation_layer/shared/extensions/buildcontext_extensions.dart';

class HeaderText extends StatelessWidget {
  final String title;
  const HeaderText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.textTheme.headlineSmall?.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }
}
