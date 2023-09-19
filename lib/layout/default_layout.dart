import 'package:flutter/material.dart';
import 'package:flutter_admin_template/exports.dart';
import 'package:flutter_admin_template/layout/admin_scaffold.dart';
import 'package:flutter_admin_template/local/constants.dart';
import 'package:flutter_admin_template/local/dimens.dart';
import 'package:flutter_admin_template/pages/admin/admin_page.dart';
import 'package:flutter_admin_template/util/export_util.dart';
import 'package:flutter_admin_template/widgets/export_widget.dart';

import '../router/router.dart';
import 'admin_menu_item.dart';
import 'side_bar.dart';

///AdminMenuItem 模板其实写好的，根据类型来判断是否加入到list中
///记得加入到路由中去
class DefaultLayout extends StatefulWidget {
  const DefaultLayout({
    Key? key,
    required this.route,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final String route;

  @override
  State<DefaultLayout> createState() => _DefaultLayoutState();
}

class _DefaultLayoutState extends State<DefaultLayout> {
  List<AdminMenuItem> getAdminMenuItem() {
    return [
      AdminMenuItem(
        title: context.L!.top,
        route: RoutePath.top,
        icon: Icons.dashboard,
      ),
      const AdminMenuItem(
        title: 'CSS',
        icon: Icons.edit,
        children: [
          AdminMenuItem(
            title: RouteTitle.typography,
            route: RoutePath.typography,
          ),
          AdminMenuItem(
            title: RouteTitle.forms,
            route: RoutePath.forms,
          ),
          AdminMenuItem(
            title: RouteTitle.buttons,
            route: RoutePath.buttons,
          ),
          AdminMenuItem(
            title: RouteTitle.colors,
            route: RoutePath.colors,
          ),
        ],
      ),
      const AdminMenuItem(
        title: 'Components',
        icon: Icons.settings,
        children: [
          AdminMenuItem(
            title: RouteTitle.icons,
            route: RoutePath.icons,
          ),
          AdminMenuItem(
            title: RouteTitle.breadcrumbs,
            route: RoutePath.breadcrumbs,
          ),
          AdminMenuItem(
            title: RouteTitle.labels,
            route: RoutePath.labels,
          ),
          AdminMenuItem(
            title: RouteTitle.alerts,
            route: RoutePath.alerts,
          ),
          AdminMenuItem(
            title: RouteTitle.modals,
            route: RoutePath.modals,
          ),
          AdminMenuItem(
            title: RouteTitle.panels,
            route: RoutePath.panels,
          ),
          AdminMenuItem(
            title: RouteTitle.iframe,
            route: RoutePath.iframe,
          ),
          AdminMenuItem(
            title: RouteTitle.generalUi,
            route: RoutePath.generalUi,
          ),
          AdminMenuItem(
            title: RouteTitle.crud,
            route: RoutePath.crud,
          )
        ],
      ),
      if (Constants.loginType == 2) addAdminMenuItem()
    ];
  }

  @override
  void initState() {
    super.initState();
    if (Constants.loginType == 2) addAdminRouter();
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: context.colorScheme.background,
      appBar: AppBar(
        title: Text(context.L!.app_name),
        actions: [
          Consumer(builder: (
            BuildContext context,
            WidgetRef ref,
            Widget? child,
          ) {
            final themeMode = ref.watch(appThemeModeProvider);
            final themeData = ShowUtils.getThemeData(context, themeMode);
            return TextButton.icon(
                icon: Icon(themeData.icon),
                onPressed: () {
                  ref
                      .read(appThemeModeProvider.notifier)
                      .update((state) => state = ShowUtils.updateTheme());
                },
                label: Text(themeData.title));
          }),
          const LanguageChange()
        ],
      ),
      sideBar: SideBar(
        header: SidebarHeader(
          onAccountButtonPressed: () {
            const MyProfileRoute().go(context);
          },
          onLogoutButtonPressed: () {
            const LoginRoute().go(context);
          },
        ),
        items: getAdminMenuItem(),
        selectedRoute: widget.route,
        onSelected: (itemData) {
          print(
              'sidebar: onTap(): title = ${itemData.title}, route = ${itemData.route}');
          if (itemData.route != null && itemData.route != widget.route) {
            userAppRouter().go(itemData.route!);
          }
        },
      ),
      body: widget.child,
    );
  }
}

class LanguageChange extends ConsumerWidget {
  const LanguageChange({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return PopupMenuButton(
      splashRadius: 0.0,
      tooltip: '',
      position: PopupMenuPosition.under,
      itemBuilder: (context) {
        return LanguageType.values.map<PopupMenuItem>((e) {
          return PopupMenuItem(
            onTap: () async {
              ref
                  .read(localChange.notifier)
                  .update((state) => state = ShowUtils.updateLocation(e));
            },
            child: Text(e.type),
          );
        }).toList(growable: false);
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.5),
        constraints: const BoxConstraints(minWidth: 48.0),
        child: Row(
          children: [
            Icon(
              Icons.translate_rounded,
              size: (Theme.of(context).textTheme.labelLarge!.fontSize! + 4.0),
            ),
            Visibility(
              visible: (MediaQuery.of(context).size.width > kScreenWidthMd),
              child: Padding(
                padding: const EdgeInsets.only(left: kDefaultPadding * 0.5),
                child: Text(context.L!.language),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DefaultPublicLayout extends StatelessWidget {
  final Widget child;

  const DefaultPublicLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.L!.app_name),
        actions: [
          Consumer(builder: (
            BuildContext context,
            WidgetRef ref,
            Widget? child,
          ) {
            final themeMode = ref.watch(appThemeModeProvider);
            final themeData = ShowUtils.getThemeData(context, themeMode);
            return TextButton.icon(
                icon: Icon(themeData.icon),
                onPressed: () {
                  ref
                      .read(appThemeModeProvider.notifier)
                      .update((state) => state = ShowUtils.updateTheme());
                },
                label: Text(themeData.title));
          }),
          const LanguageChange()
        ],
      ),
      body: child,
    );
  }
}
