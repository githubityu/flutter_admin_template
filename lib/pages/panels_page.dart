import 'package:flutter/material.dart';
import 'package:flutter_admin_template/layout/default_layout.dart';
import 'package:flutter_admin_template/router/router.dart';

class PanelsPage extends StatelessWidget {
  const PanelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
        route: RoutePath.panels,
        child: Column(
          children: [Text("PanelsPage")],
        ));
  }
}
