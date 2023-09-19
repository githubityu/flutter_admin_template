import 'package:flutter/material.dart';
import 'package:flutter_admin_template/layout/default_layout.dart';
import 'package:flutter_admin_template/router/router.dart';

class TypographyPage extends StatelessWidget {
  const TypographyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
        route: RoutePath.typography,
        child: Column(
          children: [Text("TypographyPage")],
        ));
  }
}
