import 'package:flutter/material.dart';
import 'package:flutter_admin_template/exports.dart';
import 'package:flutter_admin_template/local/dimens.dart';
import 'package:flutter_admin_template/router/router.dart';
import 'package:flutter_admin_template/util/export_util.dart';

import '../layout/default_layout.dart';

class ButtonsPage extends StatelessWidget {
  const ButtonsPage({super.key});

  Widget _elevatedButtonItem(
      BuildContext context, String text, ButtonStyle buttonStyle) {
    return _buttonItemLayout([
      ElevatedButton(
        onPressed: () {},
        style: buttonStyle,
        child: Text(text),
      ),
      ElevatedButton(
        onPressed: () {},
        style: buttonStyle,
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(right: kTextPadding),
              child: Icon(Icons.account_circle_rounded),
            ),
            Text('with icon'),
          ],
        ),
      ),
      ElevatedButton(
        onPressed: null,
        style: buttonStyle,
        child: const Text('Disabled'),
      ),
      ElevatedButton(
        onPressed: () {},
        style: buttonStyle.copyWith(
          shape: MaterialStateProperty.all(const RoundedRectangleBorder()),
        ),
        child: const Text('Flat Border'),
      ),
      ElevatedButton(
        onPressed: () {},
        style: buttonStyle.copyWith(
          shape: MaterialStateProperty.all(const StadiumBorder()),
        ),
        child: const Text('Stadium Border'),
      ),
      ElevatedButton(
        onPressed: () {},
        style: buttonStyle.copyWith(
          shape: MaterialStateProperty.all(
            const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
          ),
        ),
        child: const Text('Beveled Rectangle Border'),
      ),
    ]);
  }

  Widget _outlinedButtonItem(
      BuildContext context, String text, ButtonStyle buttonStyle) {
    return _buttonItemLayout([
      OutlinedButton(
        onPressed: () {},
        style: buttonStyle,
        child: Text(text),
      ),
      OutlinedButton(
        onPressed: () {},
        style: buttonStyle,
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(right: kTextPadding),
              child: Icon(Icons.account_circle_rounded),
            ),
            Text('with icon'),
          ],
        ),
      ),
      OutlinedButton(
        onPressed: null,
        style: buttonStyle,
        child: const Text('Disabled'),
      ),
      OutlinedButton(
        onPressed: () {},
        style: buttonStyle.copyWith(
          shape: MaterialStateProperty.all(const RoundedRectangleBorder()),
        ),
        child: const Text('Flat Border'),
      ),
      OutlinedButton(
        onPressed: () {},
        style: buttonStyle.copyWith(
          shape: MaterialStateProperty.all(const StadiumBorder()),
        ),
        child: const Text('Stadium Border'),
      ),
      OutlinedButton(
        onPressed: () {},
        style: buttonStyle.copyWith(
          shape: MaterialStateProperty.all(
            const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
          ),
        ),
        child: const Text('Beveled Rectangle Border'),
      ),
    ]);
  }

  Widget _textButtonItem(
      BuildContext context, String text, ButtonStyle buttonStyle) {
    return _buttonItemLayout([
      TextButton(
        onPressed: () {},
        style: buttonStyle,
        child: Text(text),
      ),
      TextButton(
        onPressed: () {},
        style: buttonStyle,
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(right: kTextPadding),
              child: Icon(Icons.account_circle_rounded),
            ),
            Text('with icon'),
          ],
        ),
      ),
      TextButton(
        onPressed: null,
        style: buttonStyle,
        child: const Text('Disabled'),
      ),
      TextButton(
        onPressed: () {},
        style: buttonStyle.copyWith(
          shape: MaterialStateProperty.all(const RoundedRectangleBorder()),
        ),
        child: const Text('Flat Border'),
      ),
      TextButton(
        onPressed: () {},
        style: buttonStyle.copyWith(
          shape: MaterialStateProperty.all(const StadiumBorder()),
        ),
        child: const Text('Stadium Border'),
      ),
      TextButton(
        onPressed: () {},
        style: buttonStyle.copyWith(
          shape: MaterialStateProperty.all(
            const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
          ),
        ),
        child: const Text('Beveled Rectangle Border'),
      ),
    ]);
  }

  Widget _buttonItemLayout(List<Widget> buttons) {
    const buttonWidth = 220.0;
    final List<Widget> widgets = [];

    for (var i = 0; i < buttons.length; i++) {
      if (i < buttons.length) {
        widgets.add(Padding(
          padding: const EdgeInsets.only(bottom: kDefaultPadding * 0.5),
          child: SizedBox(
            width: buttonWidth,
            child: buttons[i],
          ),
        ));
      } else {
        widgets.add(buttons[i]);
      }
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: widgets,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        route: RoutePath.buttons,
        child: ListView(
          padding: const EdgeInsets.all(kDefaultPadding),
          children: [
            Text(
              context.L!.buttons(2),
              style: context.textTheme.headlineMedium,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Elevated Button'),
                    Card(
                      child: Wrap(
                        direction: Axis.horizontal,
                        spacing: kDefaultPadding * 2.0,
                        runSpacing: kDefaultPadding * 2.0,
                        children: [
                          _elevatedButtonItem(context, 'Primary',
                              context.appExtensionTheme!.primaryElevated),
                          _elevatedButtonItem(context, 'Secondary',
                              context.appExtensionTheme!.secondaryElevated),
                          _elevatedButtonItem(context, 'Error',
                              context.appExtensionTheme!.errorElevated),
                          _elevatedButtonItem(context, 'Success',
                              context.appExtensionTheme!.successElevated),
                          _elevatedButtonItem(context, 'Info',
                              context.appExtensionTheme!.infoElevated),
                          _elevatedButtonItem(context, 'Warning',
                              context.appExtensionTheme!.warningElevated),
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
                    const Text('Outlined Button'),
                    Card(
                      child: Wrap(
                        direction: Axis.horizontal,
                        spacing: kDefaultPadding * 2.0,
                        runSpacing: kDefaultPadding * 2.0,
                        children: [
                          _outlinedButtonItem(context, 'Primary',
                              context.appExtensionTheme!.primaryOutlined),
                          _outlinedButtonItem(context, 'Secondary',
                              context.appExtensionTheme!.secondaryOutlined),
                          _outlinedButtonItem(context, 'Error',
                              context.appExtensionTheme!.errorOutlined),
                          _outlinedButtonItem(context, 'Success',
                              context.appExtensionTheme!.successOutlined),
                          _outlinedButtonItem(context, 'Info',
                              context.appExtensionTheme!.infoOutlined),
                          _outlinedButtonItem(context, 'Warning',
                              context.appExtensionTheme!.warningOutlined),
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
                    const Text(
                      'Text Button',
                    ),
                    Card(
                      child: Wrap(
                        direction: Axis.horizontal,
                        spacing: kDefaultPadding * 2.0,
                        runSpacing: kDefaultPadding * 2.0,
                        children: [
                          _textButtonItem(context, 'Primary',
                              context.appExtensionTheme!.primaryText),
                          _textButtonItem(context, 'Secondary',
                              context.appExtensionTheme!.secondaryText),
                          _textButtonItem(context, 'Error',
                              context.appExtensionTheme!.errorText),
                          _textButtonItem(context, 'Success',
                              context.appExtensionTheme!.successText),
                          _textButtonItem(context, 'Info',
                              context.appExtensionTheme!.infoText),
                          _textButtonItem(context, 'Warning',
                              context.appExtensionTheme!.warningText),
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
