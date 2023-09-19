import 'package:flutter/material.dart';
import 'package:flutter_admin_template/router/router.dart';

import '../layout/default_layout.dart';

class BreadcrumbsPage extends StatelessWidget {
  const BreadcrumbsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
        route: RoutePath.breadcrumbs,
        child: Column(
          children: [Text("BreadcrumbsPage")],
        ));
  }
}
