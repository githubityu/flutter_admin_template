import 'package:flutter/material.dart';
import 'package:flutter_admin_template/exports.dart';
import 'package:flutter_admin_template/gen/colors.gen.dart';
import 'package:flutter_admin_template/layout/default_layout.dart';
import 'package:flutter_admin_template/local/dimens.dart';
import 'package:flutter_admin_template/router/router.dart';
import 'package:flutter_admin_template/util/export_util.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  DefaultLayout(
        route: RoutePath.error404,
        child: ListView(
          padding: const EdgeInsets.all(kDefaultPadding),
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: kDefaultPadding * 5.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: kDefaultPadding),
                    child: Text(
                      '404',
                      style: context.textTheme.displayMedium!.copyWith(
                        color: ColorName.warning,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 300.0,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: kDefaultPadding * 0.5),
                          child: Text(
                            context.L!.error404Title,
                            style: context.textTheme.titleLarge!.copyWith(
                              color: ColorName.warning,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: kDefaultPadding * 1.5),
                          child: Text(context.L!.error404Message),
                        ),
                        SizedBox(
                          height: 36.0,
                          width: 100.0,
                          child: ElevatedButton(
                            onPressed: () => userAppRouter().go(RoutePath.home),
                            child: Text(context.L!.homePage),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
