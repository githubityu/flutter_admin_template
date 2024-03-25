import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ityu_tools/exports.dart';
import 'package:linjiashop_admin_web/util/export_util.dart';


import '../layout/export_layout.dart';
import '../local/dimens.dart';
import '../router/router.dart';
import '../widgets/export_widget.dart';

class ArticleEditPage extends StatefulWidget {
  final int id,pathId;
  const ArticleEditPage({super.key,required this.id, required this.pathId});

  @override
  State<ArticleEditPage> createState() => _ArticleEditPageState();
}

class _ArticleEditPageState extends State<ArticleEditPage> {
  final _dataTableHorizontalScrollController = ScrollController();

  @override
  void dispose() {
    _dataTableHorizontalScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = context.L!;
    return DefaultLayout(
      route: RoutePath.article,
      child: ListView(
        padding: const EdgeInsets.all(kDefaultPadding),
        children: [
          Text(
            context.L!.dashboard,
            style: context.textTheme.headlineMedium,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: kDefaultPadding),
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CardHeader(
                    title: lang.recentOrders(2),
                    showDivider: false,
                  ),
                  TextButton(onPressed: (){
                    userAppRouter().pop();
                  }, child: Text("返回"))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

