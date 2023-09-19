import 'package:flutter/material.dart';
import 'package:flutter_admin_template/gen/colors.gen.dart';
import 'package:flutter_admin_template/layout/default_layout.dart';
import 'package:flutter_admin_template/local/dimens.dart';
import 'package:flutter_admin_template/router/router.dart';
import 'package:flutter_admin_template/util/extension/simple_extension.dart';
import 'package:flutter_admin_template/widgets/hover_container.dart';
import 'package:flutter_admin_template/widgets/text_with_copy_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ityu_tools/util/export_util.dart';

class ColorsPage extends StatelessWidget {
  const ColorsPage({super.key});

  Widget _colorPaletteItem(BuildContext context, String title, Color color) {
    final themeData = Theme.of(context);
    final colorCode = '0x${color.value.toRadixString(16).toUpperCase()}';

    return HoverContainer(
      hoverColor: themeData.scaffoldBackgroundColor,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.only(right: kDefaultPadding * 0.5),
            decoration: BoxDecoration(
              color: color,
              border: Border.all(
                width: 1.0,
                color: themeData.dividerColor,
              ),
            ),
          ),
          SizedBox(
            width: 200.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: kTextPadding),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextWithCopyButton(
                        textWidget: Text(
                          title,
                          style: GoogleFonts.sourceCodePro(
                            fontWeight: FontWeight.w600,
                            fontSize: 13.0,
                          ),
                        ),
                        textToCopy: title,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextWithCopyButton(
                      textWidget: Text(
                        colorCode,
                        style: GoogleFonts.sourceCodePro(
                          fontSize: 12.0,
                        ),
                      ),
                      textToCopy: colorCode,
                      copyIconSize: 13.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        route: RoutePath.colors,
        child: ListView(
          padding: const EdgeInsets.all(kDefaultPadding),
          children: [
            Text(
              context.L!.colors(2),
              style: context.textTheme.headlineMedium,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.L!.colorPalette,
                    ),
                    Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: kTextPadding),
                            child: Text(
                              context.L!.colorScheme,
                              style: context.textTheme.titleMedium,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: kDefaultPadding),
                            child: TextWithCopyButton(
                              textWidget: Text(
                                context.L!.colorScheme,
                                style: GoogleFonts.sourceCodePro(
                                  fontSize: 12.0,
                                ),
                              ),
                              textToCopy: context.L!.colorScheme,
                              copyIconSize: 13.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: kDefaultPadding * 3.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: Wrap(
                                direction: Axis.horizontal,
                                spacing: kDefaultPadding * 2.0,
                                runSpacing: kDefaultPadding,
                                children: [
                                  _colorPaletteItem(context, 'primary',
                                      context.colorScheme.primary),
                                  _colorPaletteItem(context, 'onPrimary',
                                      context.colorScheme.onPrimary),
                                  _colorPaletteItem(context, 'primaryContainer',
                                      context.colorScheme.primaryContainer),
                                  _colorPaletteItem(
                                      context,
                                      'onPrimaryContainer',
                                      context.colorScheme.onPrimaryContainer),
                                  _colorPaletteItem(context, 'secondary',
                                      context.colorScheme.secondary),
                                  _colorPaletteItem(context, 'onSecondary',
                                      context.colorScheme.onSecondary),
                                  _colorPaletteItem(
                                      context,
                                      'secondaryContainer',
                                      context.colorScheme.secondaryContainer),
                                  _colorPaletteItem(
                                      context,
                                      'onSecondaryContainer',
                                      context.colorScheme.onSecondaryContainer),
                                  _colorPaletteItem(context, 'tertiary',
                                      context.colorScheme.tertiary),
                                  _colorPaletteItem(context, 'onTertiary',
                                      context.colorScheme.onTertiary),
                                  _colorPaletteItem(
                                      context,
                                      'tertiaryContainer',
                                      context.colorScheme.tertiaryContainer),
                                  _colorPaletteItem(
                                      context,
                                      'onTertiaryContainer',
                                      context.colorScheme.onTertiaryContainer),
                                  _colorPaletteItem(context, 'error',
                                      context.colorScheme.error),
                                  _colorPaletteItem(context, 'onError',
                                      context.colorScheme.onError),
                                  _colorPaletteItem(context, 'errorContainer',
                                      context.colorScheme.errorContainer),
                                  _colorPaletteItem(context, 'onErrorContainer',
                                      context.colorScheme.onErrorContainer),
                                  _colorPaletteItem(context, 'background',
                                      context.colorScheme.background),
                                  _colorPaletteItem(context, 'onBackground',
                                      context.colorScheme.onBackground),
                                  _colorPaletteItem(context, 'surface',
                                      context.colorScheme.surface),
                                  _colorPaletteItem(context, 'onSurface',
                                      context.colorScheme.onSurface),
                                  _colorPaletteItem(context, 'surfaceVariant',
                                      context.colorScheme.surfaceVariant),
                                  _colorPaletteItem(context, 'outline',
                                      context.colorScheme.outline),
                                  _colorPaletteItem(context, 'shadow',
                                      context.colorScheme.shadow),
                                  _colorPaletteItem(context, 'inverseSurface',
                                      context.colorScheme.inverseSurface),
                                  _colorPaletteItem(context, 'inversePrimary',
                                      context.colorScheme.inversePrimary),
                                  _colorPaletteItem(context, 'surfaceTint',
                                      context.colorScheme.surfaceTint),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: kTextPadding),
                            child: Text(
                              'App Color Scheme ${context.L!.extensions(1)}',
                              style: context.textTheme.titleMedium,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: kDefaultPadding),
                            child: TextWithCopyButton(
                              textWidget: Text(
                                'ColorName',
                                style: GoogleFonts.sourceCodePro(
                                  fontSize: 12.0,
                                ),
                              ),
                              textToCopy: 'ColorName',
                              copyIconSize: 13.0,
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Wrap(
                              direction: Axis.horizontal,
                              spacing: kDefaultPadding * 2.0,
                              runSpacing: kDefaultPadding,
                              children: [
                                _colorPaletteItem(
                                    context, 'success', ColorName.success),
                                _colorPaletteItem(
                                    context, 'info', ColorName.info),
                                _colorPaletteItem(
                                    context, 'warning', ColorName.warning),
                                _colorPaletteItem(
                                    context, 'hyperlink', context.colorScheme.primary),
                                _colorPaletteItem(context, 'buttonTextBlack',
                                    ColorName.buttonTextBlack),
                                _colorPaletteItem(context, 'buttonTextDisabled',
                                    ColorName.buttonTextDisabled),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
