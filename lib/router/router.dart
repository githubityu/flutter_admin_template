import 'dart:async';

import 'package:flutter/material.dart';
import 'package:linjiashop_admin_web/exports.dart';
import 'package:go_router/go_router.dart';
import 'package:linjiashop_admin_web/pages/login_screen.dart';
import 'package:linjiashop_admin_web/pages/loginlog_page.dart';
import 'package:linjiashop_admin_web/util/app_utils.dart';
import 'package:linjiashop_admin_web/util/export_util.dart';

import '../pages/article_edit_page.dart';
import '../pages/article_page.dart';
import '../pages/error_page.dart';
import '../pages/top_page.dart';

part 'router.g.dart';

final GoRouter goRouter = GoRouter(
  routes: $appRoutes,
  initialLocation: RoutePath.home,
  errorPageBuilder: (context, state) => NoTransitionPage<void>(
    key: state.pageKey,
    child: const ErrorPage(),
  ),
  redirect: (context, state) async {
    ///不在列表中的需要重定向到错误页面
    if(!AppUtils.isInMenus()){
       return RoutePath.error404;
    }
    ///如果页面是需要登陆的但是token为空就重定向到错误页面
    if(!RoutePath.notLoginPages.contains(state.matchedLocation)){
        if(ShowUtils.getToken().isNullOrEmpty){
          return RoutePath.login;
        }
    }
    return null;
  },
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
}

class RoutePath {
  RoutePath._();

  static const String home = '/';
  static const top = '/dashboard';
  static const error404 = '/error404';
  static const login = '/login';
  static const loginLog = '/loginLog';
  static const article = '/article';
  static const editArticle = 'editArticle';

  static const List<String> notLoginPages = [
    error404,
    login,
  ];
}

class RouteTitle {
  RouteTitle._();
  static const top = 'Dashboard';

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
@TypedGoRoute<LoginRoute>(path: RoutePath.login)
class LoginRoute extends GoRouteData {
  const LoginRoute();

  // @override
  // Widget build(BuildContext context, GoRouterState state) => const TopPage();
  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage<void>(child: LoginScreenPage());
}
@TypedGoRoute<LoginLogRoute>(path: RoutePath.loginLog)
class LoginLogRoute extends GoRouteData {
  const LoginLogRoute();

  // @override
  // Widget build(BuildContext context, GoRouterState state) => const TopPage();
  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage<void>(child: LoginLogPage());
}


@TypedGoRoute<ArticleRoute>(
    path: RoutePath.article,
    routes: <TypedGoRoute<GoRouteData>>[
      TypedGoRoute<EditArticleRoute>(
        path: '${RoutePath.editArticle}/:pathId',
      )
    ])
class ArticleRoute extends GoRouteData {
  const ArticleRoute();

  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage<void>(child: ArticlePage());
}

class EditArticleRoute extends GoRouteData {
  //path
  final int? id;
  final int? pathId;

  const EditArticleRoute({this.id, this.pathId});

  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      NoTransitionPage<void>(
          child: ArticleEditPage(
            id: id??1,
            pathId: pathId??1,
          ));
}

