import 'package:flutter/material.dart';
import 'package:flutter_admin_template/exports.dart';
import 'package:flutter_admin_template/local/constants.dart';
import 'package:flutter_admin_template/local/dimens.dart';
import 'package:flutter_admin_template/util/export_util.dart';

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
      padding: EdgeInsets.all(15),
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
