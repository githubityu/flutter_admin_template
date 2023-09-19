import 'package:flutter/material.dart';
import 'package:flutter_admin_template/exports.dart';
import 'package:flutter_admin_template/models/export_models.dart';
import 'package:flutter_admin_template/theme/app_extension_theme.dart';

extension ResponseConverT on ResponseBodyMt {
  T? converterT<T>() {
    return MyJsonConverter.fromJsonAsT<T>(data);
  }
}

extension CancelTokenX on Ref {
  CancelToken cancelToken() {
    final cancelToken = CancelToken();
    onDispose(cancelToken.cancel);
    return cancelToken;
  }
}

extension BuildContextExtensionX on BuildContext {
  AppLocalizations? get L => AppLocalizations.of(this);

  AppExtensionTheme? get appExtensionTheme => AppExtensionTheme.of(this);

  void requestUnfocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
