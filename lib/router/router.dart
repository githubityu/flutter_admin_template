import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_admin_template/exports.dart';
import 'package:flutter_admin_template/pages/alerts_page.dart';
import 'package:flutter_admin_template/pages/breadcrumbs_page.dart';
import 'package:flutter_admin_template/pages/buttons_page.dart';
import 'package:flutter_admin_template/pages/colors_page.dart';
import 'package:flutter_admin_template/pages/crud_detail_screen.dart';
import 'package:flutter_admin_template/pages/crud_screen.dart';
import 'package:flutter_admin_template/pages/error_page.dart';
import 'package:flutter_admin_template/pages/forms_page.dart';
import 'package:flutter_admin_template/pages/general_ui_screen.dart';
import 'package:flutter_admin_template/pages/animal_page.dart';
import 'package:flutter_admin_template/pages/iframe_demo_screen.dart';
import 'package:flutter_admin_template/pages/labels_page.dart';
import 'package:flutter_admin_template/pages/login_screen.dart';
import 'package:flutter_admin_template/pages/modals_page.dart';
import 'package:flutter_admin_template/pages/my_profile_screen.dart';
import 'package:flutter_admin_template/pages/panels_page.dart';
import 'package:flutter_admin_template/pages/register_screen.dart';
import 'package:flutter_admin_template/pages/top_page.dart';
import 'package:flutter_admin_template/pages/typography_page.dart';
import 'package:go_router/go_router.dart';

part 'router.g.dart';

final GoRouter goRouter = GoRouter(
  routes: $appRoutes,
  initialLocation: RoutePath.home,
  errorPageBuilder: (context, state) => NoTransitionPage<void>(
    key: state.pageKey,
    child: const ErrorPage(),
  ),
);

extension GoRouterX on GoRouter {
  Future<T?> pushAndRemoveUntilX<T extends Object?>(
      String location, String popUtil,
      {Object? extra}) {
    routerDelegate.navigatorKey.currentState
        ?.popUntil(ModalRoute.withName(popUtil));
    return push(location, extra: extra);
  }

  //
  void popUntil(String location) {
    routerDelegate.navigatorKey.currentState
        ?.popUntil(ModalRoute.withName(location));
  }

  void singTopPush(String location, {Object? extra}) {
    pushReplacement(location, extra: extra);
  }

  bool hasLocation(String location) {
    return routerDelegate.currentConfiguration.matches
            .firstWhereOrNull((element) {
          return element.matchedLocation.contains(location);
        }) !=
        null;
  }

  void addGoRoute(String path, Widget child) {
    if (goRouter.configuration.findMatch(path).isError) {
      goRouter.configuration.routes.add(GoRoute(
          path: path,
          pageBuilder: (context, state) {
            return NoTransitionPage<void>(child: child);
          }));
    }
  }
}

class RoutePath {
  RoutePath._();

  static const String home = '/';
  static const top = '/dashboard';
  static const typography = '/typography';
  static const alerts = '/alerts';
  static const breadcrumbs = '/breadcrumbs';
  static const buttons = '/buttons';
  static const forms = '/forms';
  static const animal = '/animal';
  static const labels = '/labels';
  static const modals = '/modals';
  static const panels = '/panels';
  static const colors = '/colors';
  static const String error404 = '/404';
  static const String login = '/login';
  static const String register = '/register';
  static const String logout = '/logout';
  static const String crud = '/crud';
  static const String crudDetail = '/crud-detail';
  static const String iframe = '/iframe';
  static const String generalUi = '/general-ui';
  static const String myProfile = '/my-profile';
  static const String adminPage1 = '/adminPage1';
  static const String adminPage2 = '/adminPage2';
  static const List<String> notLoginPages = [
    error404,
    login,
    register,
    register,
  ];
}

class RouteTitle {
  RouteTitle._();

  static const top = 'Dashboard';
  static const typography = 'Typography';
  static const alerts = 'Alerts';
  static const breadcrumbs = 'Breadcrumbs';
  static const buttons = 'Buttons';
  static const forms = 'Forms';
  static const animal = 'Animal';
  static const labels = 'Labels';
  static const modals = 'Modals';
  static const panels = 'Panels';
  static const colors = 'Colors';
  static const String iframe = 'Iframe';
  static const String generalUi = 'General-Ui';
  static const String crud = 'Crud';
  static const String crudDetail = 'CrudDetail';
  static const String adminPage1 = 'AdminPage1';
  static const String adminPage2 = 'AdminPage2';

  void d() {
    ///goRouter.routerDelegate.currentConfiguration.matches
    goRouter.routerDelegate.currentConfiguration.matches;
    goRouter.routerDelegate.currentConfiguration.routes;
    goRouter.canPop();
  }
}

@TypedGoRoute<HomeRoute>(path: RoutePath.home)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) =>
      RoutePath.top;
}

@TypedGoRoute<TopRoute>(path: RoutePath.top)
class TopRoute extends GoRouteData {
  const TopRoute();

  // @override
  // Widget build(BuildContext context, GoRouterState state) => const TopPage();
  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage<void>(child: TopPage());
}

@TypedGoRoute<TypographyRoute>(path: RoutePath.typography)
class TypographyRoute extends GoRouteData {
  const TypographyRoute();

  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage<void>(child: TypographyPage());
}

@TypedGoRoute<AlertsRoute>(path: RoutePath.alerts)
class AlertsRoute extends GoRouteData {
  const AlertsRoute();

  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage<void>(child: AlertsPage());
}

@TypedGoRoute<BreadcrumbsRoute>(path: RoutePath.breadcrumbs)
class BreadcrumbsRoute extends GoRouteData {
  const BreadcrumbsRoute();

  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage<void>(child: BreadcrumbsPage());
}

@TypedGoRoute<ButtonsRoute>(path: RoutePath.buttons)
class ButtonsRoute extends GoRouteData {
  const ButtonsRoute();

  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage<void>(child: ButtonsPage());
}

@TypedGoRoute<FormsRoute>(path: RoutePath.forms)
class FormsRoute extends GoRouteData {
  const FormsRoute();

  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage<void>(child: FormsPage());
}

@TypedGoRoute<IconsRoute>(path: RoutePath.animal)
class IconsRoute extends GoRouteData {
  const IconsRoute();

  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage<void>(child: AnimalPage());
}

@TypedGoRoute<LabelsRoute>(path: RoutePath.labels)
class LabelsRoute extends GoRouteData {
  const LabelsRoute();

  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage<void>(child: LabelsPage());
}

@TypedGoRoute<ModalsRoute>(path: RoutePath.modals)
class ModalsRoute extends GoRouteData {
  const ModalsRoute();

  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage<void>(child: ModalsPage());
}

@TypedGoRoute<PanelsRoute>(path: RoutePath.panels)
class PanelsRoute extends GoRouteData {
  const PanelsRoute();

  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage<void>(child: PanelsPage());
}

@TypedGoRoute<ColorsRoute>(path: RoutePath.colors)
class ColorsRoute extends GoRouteData {
  const ColorsRoute();

  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage<void>(child: ColorsPage());
}

@TypedGoRoute<LoginRoute>(path: RoutePath.login)
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage<void>(child: LoginScreen());
}

@TypedGoRoute<RegisterRoute>(path: RoutePath.register)
class RegisterRoute extends GoRouteData {
  const RegisterRoute();

  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage<void>(child: RegisterScreen());
}

@TypedGoRoute<IframeRoute>(path: RoutePath.iframe)
class IframeRoute extends GoRouteData {
  const IframeRoute();

  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage<void>(child: IframeDemoScreen());
}

@TypedGoRoute<GeneralUiRoute>(path: RoutePath.generalUi)
class GeneralUiRoute extends GoRouteData {
  const GeneralUiRoute();

  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage<void>(child: GeneralUiScreen());
}

@TypedGoRoute<MyProfileRoute>(path: RoutePath.myProfile)
class MyProfileRoute extends GoRouteData {
  const MyProfileRoute();

  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage<void>(child: MyProfileScreen());
}

@TypedGoRoute<CrudRoute>(path: RoutePath.crud)
class CrudRoute extends GoRouteData {
  const CrudRoute();

  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage<void>(child: CrudScreen());
}

@TypedGoRoute<CrudDetailRoute>(path: RoutePath.crudDetail)
class CrudDetailRoute extends GoRouteData {
  final String id;

  const CrudDetailRoute(this.id);

  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      NoTransitionPage<void>(child: CrudDetailScreen(id: id));
}
