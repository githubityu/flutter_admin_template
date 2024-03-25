import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:linjiashop_admin_web/exports.dart';
import 'package:linjiashop_admin_web/local/constants.dart';
import 'package:linjiashop_admin_web/local/dimens.dart';
import 'package:linjiashop_admin_web/util/export_util.dart';
import 'package:linjiashop_admin_web/widgets/export_widget.dart';

class SidebarHeader extends StatelessWidget {
  final void Function() onAccountButtonPressed;
  final void Function() onLogoutButtonPressed;

  const SidebarHeader({
    Key? key,
    required this.onAccountButtonPressed,
    required this.onLogoutButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lang = context.L!;
    final name =
        switch (Constants.loginType) { 1 => "哈利路亚", 2 => "我是管理员", _ => '未登录' };
    return Container(
      color: context.colorScheme.primary,
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              const CircleImage(
                path: Constants.dummyProfilePic,
                radius: 20,
              ),
              const SizedBox(width: kDefaultPadding * 0.5),
              Text(
                '${lang.hi}, $name',
                style: TextStyle(
                  fontSize: 14,
                  color: context.colorScheme.onPrimary,
                ),
              )
            ],
          ),
          const SizedBox(height: kDefaultPadding * 0.5),
          Align(
            alignment: Alignment.centerRight,
            child: IntrinsicHeight(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _textButton(context, Icons.manage_accounts_rounded,
                      lang.account, onAccountButtonPressed),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: VerticalDivider(
                      width: 2.0,
                      thickness: 1.0,
                      indent: kTextPadding,
                      endIndent: kTextPadding,
                    ),
                  ),
                  _textButton(context, Icons.login_rounded, lang.logout,
                      onLogoutButtonPressed),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textButton(BuildContext context, IconData icon, String text,
      void Function() onPressed) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: context.colorScheme.onPrimary,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 18,
          ),
          const SizedBox(width: kDefaultPadding * 0.5),
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final IconData? icon;
  final VoidCallback? onPressed;
  final ValueNotifier<bool>? isLoading;

  const CustomIconButton(
      {super.key,
      required this.backgroundColor,
      required this.text,
      this.icon,
      this.isLoading,
      this.onPressed});

  Widget getChild(ButtonStyle style, Text textW, {bool? isLoading}) {
    final child = isLoading == true
        ? const SizedBox(
            width: 20,
            height: 20,
            child: LoadingWidget(color: Colors.white,))
        : textW;

    final content = icon == null
        ? ElevatedButton(
            onPressed: onPressed,
            style: style,
            child: child,
          )
        : TextButtonWithIconX(
            onPressed: onPressed,
            icon:  Icon(
              icon!,
              size: 20,
            ),
            gap: 5,
            label: child,
            style: style,
          );
    ;
    return SizedBox(
      height: 30,
      child: content,
    );
  }

  @override
  Widget build(BuildContext context) {
    final style = ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        foregroundColor: Colors.white);
    final textW = Text(text);
    return isLoading != null
        ? ValueListenableBuilder(
            valueListenable: isLoading!,
            builder: (context, value, child) {
              "isLoading=${isLoading!.value}".log();
              return getChild(style, textW, isLoading: value);
            })
        : getChild(style, textW);
  }
}
class LoadingWidget extends StatelessWidget {
  final Color? color;
  const LoadingWidget({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: color??context.textTheme.titleLarge?.color,
    );
  }
}


class TextFieldWidthWidget extends StatelessWidget {
  final Widget child;
  const TextFieldWidthWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: Constants.searchContentWidth,
      child: child,
    );
  }
}



class CustomTextField extends StatelessWidget {
  final String? hint;
  final String name;
  final String? initialValue;
  final bool? obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;
  const CustomTextField({super.key, this.hint, required this.name, this.inputFormatters, this.validator, this.initialValue, this.obscureText});

  @override
  Widget build(BuildContext context) {
     return FormBuilderTextField(
       inputFormatters:inputFormatters,
       name: name,
       obscureText: obscureText?? false,
       initialValue: initialValue,
       decoration: InputDecoration(
         contentPadding: const EdgeInsets.symmetric(horizontal: 10),
         hintText: hint,
         border: const OutlineInputBorder(),

       ),
       enableSuggestions: false,
       autocorrect: false,
       validator: validator,
     );
  }

}

