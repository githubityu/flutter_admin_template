import 'package:flutter/material.dart';

import '../models/export_models.dart';

class AdminMenuItem {
  const AdminMenuItem({
    required this.title,
    this.route,
    this.icon,
    this.children = const [],
  });

  final String title;
  final String? route;
  final String? icon;
  final List<AdminMenuItem> children;


  static AdminMenuItem byMenusItem(MenusItem item){
     final item2 =  AdminMenuItem(title: item.meta.title, route: item.path, icon: item.meta.icon,children: item.children.isNotEmpty? item.children.map((e) => AdminMenuItem.byMenusItem(e)).toList():[]);
     return item2;
  }
}
