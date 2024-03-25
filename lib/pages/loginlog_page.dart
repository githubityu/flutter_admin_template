import 'package:flutter/material.dart';
import 'package:linjiashop_admin_web/local/constants.dart';
import 'package:linjiashop_admin_web/providers/operation/operation_riverpod.dart';
import 'package:linjiashop_admin_web/util/export_util.dart';

import '../exports.dart';
import '../layout/export_layout.dart';
import '../models/export_models.dart';
import '../router/router.dart';
import '../widgets/export_widget.dart';

class LoginLogPage extends ConsumerStatefulWidget {
  const LoginLogPage({super.key});

  @override
  ConsumerState<LoginLogPage> createState() => _LoginLogPageState();
}

class _LoginLogPageState extends ConsumerState<LoginLogPage> {
  final params = LoginLogParams();
  final total = ValueNotifier(10);
  final limit = ValueNotifier(Constants.rowsPerPage);
  final loading = ValueNotifier(false);
  final formKey = GlobalKey<FormBuilderState>();
  late final lang = context.L!;
  List<DataCell> getDataCell(SelectableX selectableX) {
    final item = selectableX as LoginLogModel;
    final items = [
      "${item.userName}=${item.id}",
      item.ip,
      item.logname,
      item.createtime
    ];
    final cells = items
        .map((e) => DataCell(DataWidget(
      title: e,
    )))
        .toList();
    cells.add(const DataCell(DataWidget(
      child: Text("操作"),
    )));
    return cells.toList();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      route: RoutePath.loginLog,
      child: Column(
        children: [
          SearchHeaderWidget(items: [
            FormBuilder(
              key: formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFieldWidthWidget(
                    child: CustomTextField(
                      name: 'username',
                      hint: lang.username,
                    ),
                  ),
                ],
              ),
            ),

            CustomIconButton(backgroundColor: Colors.green, text: '搜索',onPressed: (){
              loading.value = true;
              Future.delayed(const Duration(seconds: 3),(){
                loading.value =false;
              });
            },isLoading: loading,icon: Icons.search,),
            CustomIconButton(backgroundColor: Colors.blue, text: '重置',onPressed: (){
              loading.value = true;
              Future.delayed(const Duration(seconds: 3),(){
                loading.value =false;
              });
            },isLoading: loading,icon: Icons.refresh,)
          ],),
          Expanded(
            child: AsyncValueWidget(ref.watch(loginLogListProvider(params)),asyncValueBuilder: (data) {
              final list = data?.converterT<LoginLogModel>((list) {
                return list.map((e) {
                  return LoginLogModel.fromJson(e);
                }).toList();
              }) ??
                  [];
              ViewUtils.addSafeUse(() {
                total.value = data?.total??10;
              });
              return DataTableListPage(data: list, getDataCell: getDataCell, titles: const ["用户", "IP", "日志名称", "时间", "操作"]);
            },),
          ),
          DataPageFooterPage(total: total, limit: limit, params: params, callback: () {
             ref.invalidate(loginLogListProvider(params));
          },)
        ],
      ),
    );
  }
}

