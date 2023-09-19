import 'package:flutter/material.dart';
import 'package:flutter_admin_template/layout/default_layout.dart';
import 'package:flutter_admin_template/router/router.dart';


class ModalsPage extends StatelessWidget {
  const ModalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
        route: RoutePath.modals,
        child: Column(
          children: [Text("ModalsPage")],
        ));
  }
}
