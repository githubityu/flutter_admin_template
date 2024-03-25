import 'package:linjiashop_admin_web/exports.dart';
import 'package:linjiashop_admin_web/models/export_models.dart';
import 'package:linjiashop_admin_web/providers/export_providers.dart';
import 'package:linjiashop_admin_web/remote/app_data_source.dart';
import 'package:linjiashop_admin_web/util/export_util.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'user_riverpod.g.dart';

@riverpod
Future<void> login(LoginRef ref, String username,String password) async {
  final result = await ref.read(appDataSourceProvider).login({
    'username': username,
    'password': password,
  }, null);
  final token = result.data['token'];
  "token=$token".log();
  ref.read(tokenProvider.notifier).update((state) => state = token);
  ShowUtils.setToken(token);
}
@riverpod
Future<InfoModel?> info(InfoRef ref) async {
  final result = await ref.read(appDataSourceProvider).info(null);
  return result.converterT<InfoModel>();
}
