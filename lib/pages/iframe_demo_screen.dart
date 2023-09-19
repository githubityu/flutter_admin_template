import 'package:flutter/material.dart';
import 'package:flutter_admin_template/exports.dart';
import 'package:flutter_admin_template/layout/export_layout.dart';
import 'package:flutter_admin_template/router/router.dart';

class IframeDemoScreen extends StatelessWidget {
  const IframeDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
        route: RoutePath.iframe,
        child: MyIFrame('https://xnews.jin10.com/details/122137'));
  }
}
