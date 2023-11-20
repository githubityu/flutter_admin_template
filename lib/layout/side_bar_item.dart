import 'package:flutter/material.dart';
import 'package:flutter_admin_template/exports.dart';

import '../layout/admin_menu_item.dart';

class SideBarItem extends StatelessWidget {
  const SideBarItem(
      {super.key,
      required this.items,
      required this.index,
      this.onSelected,
      required this.selectedRoute,
      this.depth = 0});

  final List<AdminMenuItem> items;
  final int index;
  final void Function(AdminMenuItem item)? onSelected;
  final String selectedRoute;
  final int depth;

  bool get isLast => index == items.length - 1;

  @override
  Widget build(BuildContext context) {
    if (depth > 0 && isLast) {
      return _buildTiles(context, items[index]);
    }
    return _buildTiles(context, items[index]);
  }

  Widget _buildTiles(BuildContext context, AdminMenuItem item) {
    bool selected = _isSelected(selectedRoute, [item]);
    if (item.children.isEmpty) {
      return ListTile(
        contentPadding: _getTilePadding(depth),
        leading: _buildIcon(item.icon, selected),
        title: _buildTitle(item.title, selected),
        selected: selected,
        onTap: () {
          if (onSelected != null) {
            onSelected!(item);
          }
        },
      );
    }

    int index = 0;
    final childrenTiles = item.children.map((child) {
      return SideBarItem(
        items: item.children,
        index: index++,
        onSelected: onSelected,
        selectedRoute: selectedRoute,
        depth: depth + 1,
      );
    }).toList();

    return ExpansionTile(
      tilePadding: _getTilePadding(depth),
      leading: _buildIcon(item.icon),
      title: _buildTitle(item.title),
      initiallyExpanded: selected,
      children: childrenTiles,
    );
  }

  bool _isSelected(String route, List<AdminMenuItem> items) {
    for (final item in items) {
      if (item.route == route) {
        return true;
      }
      if (item.children.isNotEmpty) {
        return _isSelected(route, item.children);
      }
    }
    return false;
  }

  Widget _buildIcon(IconData? icon, [bool selected = false]) {
    return icon != null ? Icon(icon, size: 22) : const SizedBox();
  }

  Widget _buildTitle(String title, [bool selected = false]) {
    return Text(title);
  }

  EdgeInsets _getTilePadding(int depth) {
    return EdgeInsets.only(
      left: 10.0 + 10.0 * depth,
      right: 10.0,
    );
  }
}
