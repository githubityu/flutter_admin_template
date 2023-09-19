import 'package:flutter/material.dart';
import 'package:flutter_admin_template/gen/colors.gen.dart';

class AppExtensionTheme extends ThemeExtension<AppExtensionTheme> {
  final ButtonStyle primaryElevated;
  final ButtonStyle secondaryElevated;
  final ButtonStyle errorElevated;
  final ButtonStyle successElevated;
  final ButtonStyle infoElevated;
  final ButtonStyle warningElevated;
  final ButtonStyle primaryOutlined;
  final ButtonStyle secondaryOutlined;
  final ButtonStyle errorOutlined;
  final ButtonStyle successOutlined;
  final ButtonStyle infoOutlined;
  final ButtonStyle warningOutlined;

  final ButtonStyle primaryText;
  final ButtonStyle secondaryText;
  final ButtonStyle errorText;
  final ButtonStyle successText;
  final ButtonStyle infoText;
  final ButtonStyle warningText;

  final CardTheme cardTheme;
  final DataTableThemeData dataTableThemeData;

  const AppExtensionTheme({
    required this.primaryElevated,
    required this.secondaryElevated,
    required this.errorElevated,
    required this.successElevated,
    required this.infoElevated,
    required this.warningElevated,
    required this.primaryOutlined,
    required this.secondaryOutlined,
    required this.errorOutlined,
    required this.successOutlined,
    required this.infoOutlined,
    required this.warningOutlined,
    required this.primaryText,
    required this.secondaryText,
    required this.errorText,
    required this.successText,
    required this.infoText,
    required this.warningText,
    required this.cardTheme,
    required this.dataTableThemeData,
  });

  factory AppExtensionTheme.of(BuildContext context) {
    return Theme.of(context).extension<AppExtensionTheme>() ??
        AppExtensionTheme.fromAppColorScheme(Theme.of(context));
  }

  factory AppExtensionTheme.fromAppColorScheme(ThemeData themeData) {
    final appColorScheme = themeData.colorScheme;
    return AppExtensionTheme(
      primaryElevated: ElevatedButton.styleFrom(
        backgroundColor: appColorScheme.primary,
        foregroundColor: appColorScheme.onPrimary,
        disabledForegroundColor: appColorScheme.onPrimary.withOpacity(0.38),
        disabledBackgroundColor: appColorScheme.primary.withOpacity(0.12),
      ).withCommonButtonStyle(
        appColorScheme: appColorScheme,
      ),
      secondaryElevated: ElevatedButton.styleFrom(
        backgroundColor: appColorScheme.secondary,
        disabledForegroundColor: appColorScheme.secondary,
      ).withCommonButtonStyle(
        appColorScheme: appColorScheme,
      ),
      errorElevated: ElevatedButton.styleFrom(
        backgroundColor: appColorScheme.error,
        disabledForegroundColor: appColorScheme.error,
      ).withCommonButtonStyle(
        appColorScheme: appColorScheme,
      ),
      successElevated: ElevatedButton.styleFrom(
        backgroundColor: ColorName.success,
        disabledForegroundColor: ColorName.success,
      ).withCommonButtonStyle(
        appColorScheme: appColorScheme,
      ),
      infoElevated: ElevatedButton.styleFrom(
        backgroundColor: ColorName.info,
        disabledForegroundColor: ColorName.info,
      ).withCommonButtonStyle(
        appColorScheme: appColorScheme,
      ),
      warningElevated: ElevatedButton.styleFrom(
        backgroundColor: ColorName.warning,
        disabledForegroundColor: ColorName.warning,
      ).withCommonButtonStyle(
        appColorScheme: appColorScheme,
        normalButtonTextColor: ColorName.buttonTextBlack,
      ),
      primaryOutlined: OutlinedButton.styleFrom(
        foregroundColor: appColorScheme.primary,
        disabledForegroundColor: appColorScheme.primary,
      ).withCommonOutlinedButtonStyle(
        appColorScheme: appColorScheme,
        normalButtonTextColor: appColorScheme.primary,
      ),
      secondaryOutlined: OutlinedButton.styleFrom(
        foregroundColor: appColorScheme.secondary,
        disabledForegroundColor: appColorScheme.secondary,
      ).withCommonOutlinedButtonStyle(
        appColorScheme: appColorScheme,
        normalButtonTextColor: appColorScheme.secondary,
      ),
      errorOutlined: OutlinedButton.styleFrom(
        foregroundColor: appColorScheme.error,
        disabledForegroundColor: appColorScheme.error,
      ).withCommonOutlinedButtonStyle(
        appColorScheme: appColorScheme,
        normalButtonTextColor: appColorScheme.error,
      ),
      successOutlined: OutlinedButton.styleFrom(
        foregroundColor: ColorName.success,
        disabledForegroundColor: ColorName.success,
      ).withCommonOutlinedButtonStyle(
        appColorScheme: appColorScheme,
        normalButtonTextColor: ColorName.success,
      ),
      infoOutlined: OutlinedButton.styleFrom(
        foregroundColor: ColorName.info,
        disabledForegroundColor: ColorName.info,
      ).withCommonOutlinedButtonStyle(
        appColorScheme: appColorScheme,
        normalButtonTextColor: ColorName.info,
      ),
      warningOutlined: OutlinedButton.styleFrom(
        foregroundColor: ColorName.warning,
        disabledForegroundColor: ColorName.warning,
      ).withCommonOutlinedButtonStyle(
        appColorScheme: appColorScheme,
        normalButtonTextColor: ColorName.warning,
      ),
      primaryText: TextButton.styleFrom(
        foregroundColor: appColorScheme.primary,
        disabledForegroundColor: appColorScheme.primary,
      ).withCommonTextButtonStyle(
        appColorScheme: appColorScheme,
      ),
      secondaryText: TextButton.styleFrom(
        foregroundColor: appColorScheme.secondary,
        disabledForegroundColor: appColorScheme.secondary,
      ).withCommonTextButtonStyle(
        appColorScheme: appColorScheme,
      ),
      errorText: TextButton.styleFrom(
        foregroundColor: appColorScheme.error,
        disabledForegroundColor: appColorScheme.error,
      ).withCommonTextButtonStyle(
        appColorScheme: appColorScheme,
      ),
      successText: TextButton.styleFrom(
        foregroundColor: ColorName.success,
        disabledForegroundColor: ColorName.success,
      ).withCommonTextButtonStyle(
        appColorScheme: appColorScheme,
      ),
      infoText: TextButton.styleFrom(
        foregroundColor: ColorName.info,
        disabledForegroundColor: ColorName.info,
      ).withCommonTextButtonStyle(
        appColorScheme: appColorScheme,
      ),
      warningText: TextButton.styleFrom(
        foregroundColor: ColorName.warning,
        disabledForegroundColor: ColorName.warning,
      ).withCommonTextButtonStyle(
        appColorScheme: appColorScheme,
        normalButtonTextColor: ColorName.buttonTextBlack,
      ),
      cardTheme: themeData.cardTheme.copyWith(
        color: Colors.transparent,
        elevation: 0.0,
      ),
      dataTableThemeData: themeData.dataTableTheme.copyWith(
        headingRowColor:
            MaterialStateProperty.all(themeData.colorScheme.primary),
        headingTextStyle: TextStyle(color: themeData.colorScheme.onPrimary),
      ),
    );
  }

  @override
  ThemeExtension<AppExtensionTheme> copyWith({
    ButtonStyle? primaryElevated,
    ButtonStyle? secondaryElevated,
    ButtonStyle? errorElevated,
    ButtonStyle? successElevated,
    ButtonStyle? infoElevated,
    ButtonStyle? warningElevated,
    ButtonStyle? primaryOutlined,
    ButtonStyle? secondaryOutlined,
    ButtonStyle? errorOutlined,
    ButtonStyle? successOutlined,
    ButtonStyle? infoOutlined,
    ButtonStyle? warningOutlined,
    ButtonStyle? primaryText,
    ButtonStyle? secondaryText,
    ButtonStyle? errorText,
    ButtonStyle? successText,
    ButtonStyle? infoText,
    ButtonStyle? warningText,
    DataTableThemeData? dataTableThemeData,
    CardTheme? cardTheme,
  }) {
    return AppExtensionTheme(
      primaryElevated: primaryElevated ?? this.primaryElevated,
      secondaryElevated: secondaryElevated ?? this.secondaryElevated,
      errorElevated: errorElevated ?? this.errorElevated,
      successElevated: successElevated ?? this.successElevated,
      infoElevated: infoElevated ?? this.infoElevated,
      warningElevated: warningElevated ?? this.warningElevated,
      primaryOutlined: primaryOutlined ?? this.primaryOutlined,
      secondaryOutlined: secondaryOutlined ?? this.secondaryOutlined,
      errorOutlined: errorOutlined ?? this.errorOutlined,
      successOutlined: successOutlined ?? this.successOutlined,
      infoOutlined: infoOutlined ?? this.infoOutlined,
      warningOutlined: warningOutlined ?? this.warningOutlined,
      primaryText: primaryText ?? this.primaryText,
      secondaryText: secondaryText ?? this.secondaryText,
      errorText: errorText ?? this.errorText,
      successText: successText ?? this.successText,
      infoText: infoText ?? this.infoText,
      warningText: warningText ?? this.warningText,
      cardTheme: cardTheme ?? this.cardTheme,
      dataTableThemeData: dataTableThemeData ?? this.dataTableThemeData,
    );
  }

  @override
  ThemeExtension<AppExtensionTheme> lerp(
      ThemeExtension<AppExtensionTheme>? other, double t) {
    if (other is! AppExtensionTheme) {
      return this;
    }

    return AppExtensionTheme(
      primaryElevated: other.primaryElevated,
      secondaryElevated: other.secondaryElevated,
      errorElevated: other.errorElevated,
      successElevated: other.successElevated,
      infoElevated: other.infoElevated,
      warningElevated: other.warningElevated,
      primaryOutlined: other.primaryOutlined,
      secondaryOutlined: other.secondaryOutlined,
      errorOutlined: other.errorOutlined,
      successOutlined: other.successOutlined,
      infoOutlined: other.infoOutlined,
      warningOutlined: other.warningOutlined,
      primaryText: other.primaryText,
      secondaryText: other.secondaryText,
      errorText: other.errorText,
      successText: other.successText,
      infoText: other.infoText,
      warningText: other.warningText,
      cardTheme: other.cardTheme,
      dataTableThemeData: other.dataTableThemeData,
    );
  }
}

extension ButtonStyleExtension on ButtonStyle {
  ButtonStyle withCommonButtonStyle({
    required ColorScheme appColorScheme,
    Color? normalButtonTextColor,
  }) {
    return copyWith(
      minimumSize: MaterialStateProperty.all(const Size(60.0, 46.0)),
      mouseCursor: MaterialStateProperty.resolveWith((state) {
        if (state.contains(MaterialState.disabled)) {
          return SystemMouseCursors.forbidden;
        }

        return null;
      }),
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return appColorScheme.onPrimary.withOpacity(0.38);
        }
        return normalButtonTextColor??appColorScheme.onPrimary;
      }),
    );
  }

  ButtonStyle withCommonOutlinedButtonStyle({
    required ColorScheme appColorScheme,
    Color? normalButtonTextColor,
  }) {
    return withCommonButtonStyle(
      appColorScheme: appColorScheme,
      normalButtonTextColor: normalButtonTextColor,
    ).copyWith(
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        return foregroundColor?.resolve(states) ?? appColorScheme.onPrimary.withOpacity(0.38);
      }),
      side: MaterialStateProperty.resolveWith((states) {
        return BorderSide(
          width: 1.0,
          color: foregroundColor?.resolve(states) ?? appColorScheme.onPrimary.withOpacity(0.38),
        );
      }),
    );
  }

  ButtonStyle withCommonTextButtonStyle({
    required ColorScheme appColorScheme,
    Color? normalButtonTextColor,
  }) {
    return withCommonButtonStyle(
      appColorScheme: appColorScheme,
      normalButtonTextColor: normalButtonTextColor,
    ).copyWith(
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        return foregroundColor?.resolve(states) ?? appColorScheme.onPrimary.withOpacity(0.38);
      }),
    );
  }
}
