import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:linjiashop_admin_web/exports.dart';
import 'package:linjiashop_admin_web/providers/user/user_riverpod.dart';
import 'package:linjiashop_admin_web/util/export_util.dart';
import 'package:linjiashop_admin_web/widgets/export_widget.dart';

import '../layout/export_layout.dart';
import '../local/dimens.dart';
import '../router/router.dart';

class LoginScreenPage extends StatefulWidget {
  const LoginScreenPage({super.key});

  @override
  State<LoginScreenPage> createState() => _LoginScreenPageState();
}

class _LoginScreenPageState extends State<LoginScreenPage> {
  late final themeData = Theme.of(context);
  final formKey = GlobalKey<FormBuilderState>();
  late final lang = context.L!;
  @override
  Widget build(BuildContext context) {

    return DefaultPublicLayout(
      child: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            padding: const EdgeInsets.only(top: kDefaultPadding * 5.0),
            constraints: const BoxConstraints(maxWidth: 400.0),
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: kDefaultPadding),
                      child: FlutterLogo(
                        size: 80,
                      ),
                    ),
                    Text(
                      lang.appTitle,
                      style: themeData.textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(bottom: kDefaultPadding * 2.0),
                      child: Text(
                        lang.adminPortalLogin,
                        style: themeData.textTheme.titleMedium,
                      ),
                    ),
                    FormBuilder(
                      key: formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: kDefaultPadding * 1.5),
                            child: FormBuilderTextField(
                              name: 'username',
                              decoration: InputDecoration(
                                labelText: lang.username,
                                hintText: lang.username,
                                helperText: '* Demo username: admin',
                                border: const OutlineInputBorder(),
                                floatingLabelBehavior:
                                FloatingLabelBehavior.always,
                              ),
                              enableSuggestions: false,
                              validator: FormBuilderValidators.required(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: kDefaultPadding * 2.0),
                            child: FormBuilderTextField(
                              name: 'password',
                              decoration: InputDecoration(
                                labelText: lang.password,
                                hintText: lang.password,
                                helperText: '* Demo password: admin',
                                border: const OutlineInputBorder(),
                                floatingLabelBehavior:
                                FloatingLabelBehavior.always,
                              ),
                              enableSuggestions: false,
                              obscureText: true,
                              validator: FormBuilderValidators.required(),
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.only(bottom: kDefaultPadding),
                            child: SizedBox(
                              height: 40.0,
                              width: double.infinity,
                              child: HookConsumer(
                                builder: (context,ref,_) {
                                  final isShowLoading = useState(false);
                                  return ElevatedButton(
                                    style:
                                    context.appExtensionTheme!.primaryElevated,
                                    onPressed: (){
                                      if(formKey.currentState?.saveAndValidate()==true){
                                        isShowLoading.value = true;
                                       final username =  formKey.currentState?.instantValue["username"];
                                      final password =  formKey.currentState?.instantValue["password"];
                                        ref.read(loginProvider(username,password).future).then((value){
                                           const HomeRoute().go(context);
                                        }).whenComplete(() => isShowLoading.value = false);
                                      }
                                    },
                                    child: isShowLoading.value?const LoadingWidget():Text(lang.login),
                                  );
                                }
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}





