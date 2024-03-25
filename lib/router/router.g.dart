// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeRoute,
      $topRoute,
      $loginRoute,
      $loginLogRoute,
      $articleRoute,
    ];

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/',
      factory: $HomeRouteExtension._fromState,
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $topRoute => GoRouteData.$route(
      path: '/dashboard',
      factory: $TopRouteExtension._fromState,
    );

extension $TopRouteExtension on TopRoute {
  static TopRoute _fromState(GoRouterState state) => const TopRoute();

  String get location => GoRouteData.$location(
        '/dashboard',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginRoute => GoRouteData.$route(
      path: '/login',
      factory: $LoginRouteExtension._fromState,
    );

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  String get location => GoRouteData.$location(
        '/login',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginLogRoute => GoRouteData.$route(
      path: '/loginLog',
      factory: $LoginLogRouteExtension._fromState,
    );

extension $LoginLogRouteExtension on LoginLogRoute {
  static LoginLogRoute _fromState(GoRouterState state) => const LoginLogRoute();

  String get location => GoRouteData.$location(
        '/loginLog',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $articleRoute => GoRouteData.$route(
      path: '/article',
      factory: $ArticleRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'editArticle/:pathId',
          factory: $EditArticleRouteExtension._fromState,
        ),
      ],
    );

extension $ArticleRouteExtension on ArticleRoute {
  static ArticleRoute _fromState(GoRouterState state) => const ArticleRoute();

  String get location => GoRouteData.$location(
        '/article',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $EditArticleRouteExtension on EditArticleRoute {
  static EditArticleRoute _fromState(GoRouterState state) => EditArticleRoute(
        pathId: int.parse(state.pathParameters['pathId']!),
        id: _$convertMapValue('id', state.uri.queryParameters, int.parse),
      );

  String get location => GoRouteData.$location(
        '/article/editArticle/${Uri.encodeComponent(pathId!.toString())}',
        queryParams: {
          if (id != null) 'id': id!.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

T? _$convertMapValue<T>(
  String key,
  Map<String, String> map,
  T Function(String) converter,
) {
  final value = map[key];
  return value == null ? null : converter(value);
}
