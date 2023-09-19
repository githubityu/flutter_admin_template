import 'package:flutter/material.dart';
import 'package:flutter_admin_template/exports.dart';
import 'package:flutter_admin_template/local/constants.dart';
import 'package:flutter_admin_template/util/export_util.dart';

class ShowUtils {
  static String showSafeString(String? data) {
    return data ?? '';
  }

  static String showLineStr(String? data) {
    return "${showSafeString(data)}\n";
  }

  static int geThemeIndex(ThemeMode themeMode) {
    return themeMode.index - 1;
  }

  static ThemeMode updateTheme() {
    final modelType =
        LocalDataUtil.settingBox.get(Constants.appTheme, defaultValue: true);
    LocalDataUtil.settingBox.put(Constants.appTheme, !modelType);
    return !modelType ? ThemeMode.light : ThemeMode.dark;
  }

  static ThemeMode getThemeMode() {
    return LocalDataUtil.settingBox.get(Constants.appTheme, defaultValue: true)
        ? ThemeMode.light
        : ThemeMode.dark;
  }

  static String updateLocation(LanguageType index) {
    LocalDataUtil.settingBox.put(Constants.localChange, index.type);
    return index.type;
  }

  static String getLocation() {
    return LocalDataUtil.settingBox
        .get(Constants.localChange, defaultValue: LanguageType.ZH_TYPE.type);
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
