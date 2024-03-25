import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ityu_tools/exports.dart';
import 'package:linjiashop_admin_web/util/export_util.dart';


import '../gen/export_gen.dart';
import '../layout/export_layout.dart';
import '../local/dimens.dart';
import '../router/router.dart';
import '../widgets/export_widget.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
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
                    EditArticleRoute(id: 1,pathId: 2).go(context);
                  }, child: Text("跳转到详情"))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

