import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_template/layout/export_layout.dart';
import 'package:flutter_admin_template/local/dimens.dart';
import 'package:flutter_admin_template/router/router.dart';
import 'package:flutter_admin_template/util/export_util.dart';
import 'package:flutter_admin_template/widgets/export_widget.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:ityu_tools/util/export_util.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _formData = FormData();

  Future<bool>? _future;

  Future<bool> _getDataAsync() async {
    await Future.delayed(const Duration(seconds: 1), () {
      _formData.userProfileImageUrl = 'https://picsum.photos/id/1005/300/300';
      _formData.username = 'Admin ABC';
      _formData.email = 'adminabc@email.com';
    });

    return true;
  }

  void _doSave(BuildContext context) {
    context.requestUnfocus();

    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState!.save();

      final lang = context.L!;

      final dialog = AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        title: lang.recordSavedSuccessfully,
        width: kDialogWidth,
        btnOkText: 'OK',
        btnOkOnPress: () {},
      );

      dialog.show();
    }
  }

  @override
  Widget build(BuildContext context) {
    final lang = context.L!;
    final themeData = Theme.of(context);

    return DefaultLayout(
      route: RoutePath.myProfile,
      child: ListView(
        padding: const EdgeInsets.all(kDefaultPadding),
        children: [
          Text(
            lang.myProfile,
            style: themeData.textTheme.headlineMedium,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CardHeader(
                    title: lang.myProfile,
                  ),
                  CardBody(
                    child: FutureBuilder<bool>(
                      initialData: null,
                      future: (_future ??= _getDataAsync()),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          if (snapshot.hasData && snapshot.data!) {
                            return _content(context);
                          }
                        } else if (snapshot.hasData && snapshot.data!) {
                          return _content(context);
                        }

                        return Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              vertical: kDefaultPadding),
                          child: SizedBox(
                            height: 40.0,
                            width: 40.0,
                            child: CircularProgressIndicator(
                              backgroundColor:
                                  themeData.scaffoldBackgroundColor,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _content(BuildContext context) {
    final lang = context.L!;
    final themeData = context.appExtensionTheme;

    return FormBuilder(
      key: _formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: kDefaultPadding * 1.5),
            child: Stack(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(_formData.userProfileImageUrl),
                  radius: 60.0,
                ),
                Positioned(
                  top: 0.0,
                  right: 0.0,
                  child: SizedBox(
                    height: 40.0,
                    width: 40.0,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: themeData!.secondaryElevated.copyWith(
                        shape: MaterialStateProperty.all(const CircleBorder()),
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                      ),
                      child: const Icon(
                        Icons.edit_rounded,
                        size: 20.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: kDefaultPadding * 1.5),
            child: FormBuilderTextField(
              name: 'username',
              decoration: const InputDecoration(
                labelText: 'Username',
                hintText: 'Username',
                border: OutlineInputBorder(),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              initialValue: _formData.username,
              validator: FormBuilderValidators.required(),
              onSaved: (value) => (_formData.username = value ?? ''),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: kDefaultPadding * 2.0),
            child: FormBuilderTextField(
              name: 'email',
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Email',
                border: OutlineInputBorder(),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              initialValue: _formData.email,
              keyboardType: TextInputType.emailAddress,
              validator: FormBuilderValidators.required(),
              onSaved: (value) => (_formData.email = value ?? ''),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              height: 40.0,
              child: ElevatedButton(
                style: themeData!.successElevated,
                onPressed: () => _doSave(context),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(right: kDefaultPadding * 0.5),
                      child: Icon(
                        Icons.save_rounded,
                        size: (context.textTheme.labelLarge!.fontSize! + 4.0),
                      ),
                    ),
                    Text(lang.save),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FormData {
  String userProfileImageUrl = '';
  String username = '';
  String email = '';
}
