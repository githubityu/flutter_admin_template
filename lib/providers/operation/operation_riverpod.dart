import 'package:linjiashop_admin_web/exports.dart';
import 'package:linjiashop_admin_web/models/export_models.dart';
import 'package:linjiashop_admin_web/providers/export_providers.dart';
import 'package:linjiashop_admin_web/remote/app_data_source.dart';
import 'package:linjiashop_admin_web/util/export_util.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'operation_riverpod.g.dart';

@riverpod
Future<PageDataListModel?> loginLogList(LoginLogListRef ref,
    LoginLogParams params) async {
  final result = await ref.read(appDataSourceProvider).loginLogList(params.toPageDataMap(), null);
  return result.converterT<PageDataListModel>();
}

