import 'package:flutter/material.dart';
import 'package:flutter_admin_template/exports.dart';
import 'package:flutter_admin_template/gen/colors.gen.dart';
import 'package:flutter_admin_template/local/dimens.dart';
import 'package:flutter_admin_template/router/router.dart';
import 'package:flutter_admin_template/util/export_util.dart';
import 'package:flutter_admin_template/widgets/export_widget.dart';
import '../layout/default_layout.dart';

class LabelsPage extends StatelessWidget {
  const LabelsPage({super.key});

  Widget _textEmphasisItem(BuildContext context, String text, Color color) {
    return HoverContainer(
      hoverColor: Theme.of(context).scaffoldBackgroundColor,
      child: SizedBox(
        width: 330.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: kDefaultPadding),
              child: Text(
                text,
                style: TextStyle(
                  color: color,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: kDefaultPadding),
              child: Text(
                '(Bold) $text',
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              '(Italic) $text',
              style: TextStyle(
                color: color,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _typographyItem(BuildContext context, String text, TextStyle textStyle,
      bool withBottomPadding) {
    final lang = context.L!;

    return Padding(
      padding: EdgeInsets.only(
          bottom: (withBottomPadding ? kDefaultPadding * 1.5 : 0.0)),
      child: HoverContainer(
        hoverColor: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: kDefaultPadding * 0.5),
              child: TextWithCopyButton(
                textWidget: Text(
                  text,
                  style: GoogleFonts.sourceCodePro(
                    fontSize: 12.0,
                  ),
                ),
                textToCopy: text,
                copyIconSize: 13.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: kTextPadding),
              child: Text(
                lang.loremIpsum,
                style: textStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: kTextPadding),
              child: Text(
                '(Bold) ${lang.loremIpsum}',
                style: textStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              '(Italic) ${lang.loremIpsum}',
              style: textStyle.copyWith(
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _googleFontItem(BuildContext context, String text, TextStyle textStyle,
      bool withBottomPadding) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: (withBottomPadding ? kDefaultPadding : 0.0)),
      child: HoverContainer(
        hoverColor: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: kDefaultPadding * 0.5),
              child: TextWithCopyButton(
                textWidget: Text(
                  text,
                  style: GoogleFonts.sourceCodePro(
                    fontSize: 12.0,
                  ),
                ),
                textToCopy: text,
                copyIconSize: 13.0,
              ),
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
              style: textStyle.copyWith(
                fontSize: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final lang = context.L!;
    final textTheme = context.textTheme;
    final appColorScheme = context.colorScheme;
    return DefaultLayout(
        route: RoutePath.labels,
        child: ListView(
          padding: const EdgeInsets.all(kDefaultPadding),
          children: [
            Text(
              lang.text,
              style: textTheme.headlineMedium,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CardHeader(
                      title: lang.textEmphasis,
                    ),
                    CardBody(
                      child: Wrap(
                        direction: Axis.horizontal,
                        spacing: kDefaultPadding * 2.0,
                        runSpacing: kDefaultPadding * 2.0,
                        children: [
                          _textEmphasisItem(
                              context,
                              'Text to emphasize primary.',
                              appColorScheme.primary),
                          _textEmphasisItem(
                              context,
                              'Text to emphasize secondary.',
                              appColorScheme.secondary),
                          _textEmphasisItem(context, 'Text to emphasize error.',
                              appColorScheme.error),
                          _textEmphasisItem(context,
                              'Text to emphasize success.', ColorName.success),
                          _textEmphasisItem(context, 'Text to emphasize info.',
                              ColorName.info),
                          _textEmphasisItem(context,
                              'Text to emphasize warning.', ColorName.warning),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: kDefaultPadding),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CardHeader(
                      title: lang.typography,
                    ),
                    CardBody(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: kTextPadding),
                            child: Text(
                              lang.textTheme,
                              style: textTheme.titleMedium,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: kDefaultPadding),
                            child: TextWithCopyButton(
                              textWidget: Text(
                                'Theme.of(context).textTheme',
                                style: GoogleFonts.sourceCodePro(
                                  fontSize: 12.0,
                                ),
                              ),
                              textToCopy: 'Theme.of(context).textTheme',
                              copyIconSize: 13.0,
                            ),
                          ),
                          _typographyItem(
                              context, 'bodyLarge', textTheme.bodyLarge!, true),
                          _typographyItem(context, 'bodyMedium',
                              textTheme.bodyMedium!, true),
                          _typographyItem(
                              context, 'bodySmall', textTheme.bodySmall!, true),
                          _typographyItem(context, 'displayLarge',
                              textTheme.displayLarge!, true),
                          _typographyItem(context, 'displayMedium',
                              textTheme.displayMedium!, true),
                          _typographyItem(context, 'displaySmall',
                              textTheme.displaySmall!, true),
                          _typographyItem(context, 'headlineLarge',
                              textTheme.headlineLarge!, true),
                          _typographyItem(context, 'headlineMedium',
                              textTheme.headlineMedium!, true),
                          _typographyItem(context, 'headlineSmall',
                              textTheme.headlineSmall!, true),
                          _typographyItem(context, 'labelLarge',
                              textTheme.labelLarge!, true),
                          _typographyItem(context, 'labelMedium',
                              textTheme.labelMedium!, true),
                          _typographyItem(context, 'labelSmall',
                              textTheme.labelSmall!, true),
                          _typographyItem(context, 'titleLarge',
                              textTheme.titleLarge!, true),
                          _typographyItem(context, 'titleMedium',
                              textTheme.titleMedium!, true),
                          _typographyItem(context, 'titleSmall',
                              textTheme.titleSmall!, false),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: kDefaultPadding),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CardHeader(
                      title: 'Google Fonts',
                    ),
                    CardBody(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: kTextPadding),
                            child: UrlNewTabLauncher(
                              displayText: 'google_fonts - pub.dev',
                              url: 'https://pub.dev/packages/google_fonts',
                              fontSize: 13.0,
                            ),
                          ),
                          const Padding(
                            padding:
                                EdgeInsets.only(bottom: kDefaultPadding * 1.5),
                            child: UrlNewTabLauncher(
                              displayText: 'https://fonts.google.com/',
                              url: 'https://fonts.google.com/',
                              fontSize: 13.0,
                            ),
                          ),
                          _googleFontItem(
                              context, 'Roboto', GoogleFonts.roboto(), true),
                          _googleFontItem(context, 'Josefin Sans',
                              GoogleFonts.josefinSans(), true),
                          _googleFontItem(
                              context, 'Oswald', GoogleFonts.oswald(), true),
                          _googleFontItem(context, 'Fascinate',
                              GoogleFonts.fascinate(), false),
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
