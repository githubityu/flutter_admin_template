import 'package:flutter/material.dart';
import 'package:flutter_admin_template/exports.dart';
import 'package:flutter_admin_template/util/export_util.dart';

import 'theme/app_extension_theme.dart';

Future<void> main() async {
  await LocalDataUtil.init();
  setPathUrlStrategy();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final theme = ref.watch(appThemeProvider);
    final themeMode = ref.watch(appThemeModeProvider);
    final appRouter = userAppRouter();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: theme..copyWith(extensions: [AppExtensionTheme.of(context)]),
      locale: ref.watch(appLocationProvider),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      themeMode: themeMode,
      title: 'flutter-admin-template',
      builder: FlutterSmartDialog.init(),
      routerConfig: appRouter,
    );
  }
}
