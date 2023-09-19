import 'package:flutter/material.dart';
import 'package:flutter_admin_template/layout/export_layout.dart';
import 'package:flutter_admin_template/router/router.dart';

///权限相关的路由
void addAdminRouter() {
  goRouter.addGoRoute(RoutePath.adminPage1, const AdminPage1());
  goRouter.addGoRoute(RoutePath.adminPage2, const AdminPage2());
}

AdminMenuItem addAdminMenuItem() {
  return const AdminMenuItem(
    title: 'Admin',
    icon: Icons.edit,
    children: [
      AdminMenuItem(
        title: RouteTitle.adminPage1,
        route: RoutePath.adminPage1,
      ),
      AdminMenuItem(
        title: RouteTitle.adminPage2,
        route: RoutePath.adminPage2,
      ),
    ],
  );
}

class AdminPage1 extends StatelessWidget {
  const AdminPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      route: RoutePath.adminPage1,
      child: Column(
        children: [Text("AdminPage1")],
      ),
    );
  }
}

class AdminPage2 extends StatelessWidget {
  const AdminPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      route: RoutePath.adminPage2,
      child: const Column(
        children: [Text("AdminPage2")],
      ),
    );
  }
}
