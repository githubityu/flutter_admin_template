import 'package:flutter/material.dart';
import 'package:linjiashop_admin_web/exports.dart';
import 'package:linjiashop_admin_web/local/constants.dart';
import 'package:linjiashop_admin_web/util/export_util.dart';

import '../gen/export_gen.dart';

class ShowUtils {
  static String showSafeString(String? data) {
    return data ?? '';
  }

  static String getPath(String? path) {
    return path?.startsWith("/")==true?path!:"/$path";
  }

  static Widget getIcon(String? name){
    return name==null?const SizedBox.shrink():ImageIcon(AssetGenImage('assets/images/${name=="404"?"x404":name}.png').image().image,size: 18,);
  }
  static String showLineStr(String? data) {
    return "${showSafeString(data)}\n";
  }

  static int geThemeIndex(ThemeMode themeMode) {
    return themeMode.index - 1;
  }

  static ThemeMode updateTheme() {
    final modelType =
    SpUtil.getBool(Constants.appTheme, defValue: true);
    SpUtil.putBool(Constants.appTheme, !modelType);
    return !modelType ? ThemeMode.light : ThemeMode.dark;
  }

  static ThemeMode getThemeMode() {
    return SpUtil.getBool(Constants.appTheme, defValue: true)
        ? ThemeMode.light
        : ThemeMode.dark;
  }

  static String updateLocation(LanguageType index) {
    SpUtil.putString(Constants.localChange, index.type);
    return index.type;
  }

  static String getLocation() {
    return SpUtil.getString(Constants.localChange, defValue: LanguageType.ZH_TYPE.type);
  }
  static String getToken() {
    return SpUtil.getString(Constants.token, defValue: "");
  }
  static Future<bool>? setToken(String token) {
    return SpUtil.putString(Constants.token, token);
  }

  static ({String title, IconData icon}) getThemeData(
      BuildContext context, ThemeMode themeMode) {
    if (themeMode == ThemeMode.light) {
      return (title: context.L!.lightTheme, icon: Icons.light_mode_rounded);
    } else {
      return (title: context.L!.darkTheme, icon: Icons.dark_mode_rounded);
    }
  }
}
