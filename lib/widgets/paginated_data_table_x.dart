import 'package:flutter/material.dart';
import 'package:ityu_tools/exports.dart';
import 'package:linjiashop_admin_web/exports.dart';
import 'package:linjiashop_admin_web/local/constants.dart';
import 'package:linjiashop_admin_web/widgets/export_widget.dart';

import '../models/export_models.dart';
import 'pager/pager.dart';

class TitleWidget extends StatelessWidget {
  final String title;

  const TitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
    );
  }
}

class DataWidget extends StatelessWidget {
  final String? title;
  final Widget? child;

  const DataWidget({super.key, this.title, this.child});

  @override
  Widget build(BuildContext context) {
    return child ?? Text(title ?? "");
  }
}

class PageDataTableUtils {
  static List<DataRow> getDataDataRows(List<SelectableX> items,
      List<DataCell> Function(SelectableX) getCells,
      {Function(int)? selectIndex}) {
    return items
        .mapIndexed((index, e) => DataRow.byIndex(
            index: index,
            cells: getCells(e),
            selected: items[index].check,
            onSelectChanged: (state) {
              items[index].check = state ?? false;
              selectIndex?.call(index);
            }))
        .toList();
  }

  static void selectAll(List<SelectableX> items, bool checked,
      {VoidCallback? selectAll}) {
    for (var element in items) {
      element.check = checked;
    }
    selectAll?.call(); //通知监听器去刷新
  }
}


class DataTableListPage extends StatelessWidget {
  final List<SelectableX> data;
  final List<String> titles;
  final List<DataCell> Function(SelectableX) getDataCell;

  const DataTableListPage({super.key, required this.data, required this.getDataCell, required this.titles});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FractionallySizedBox(
        widthFactor: 1,
        child: HookBuilder(builder: (context) {
          final refresh = useState(false);
          return DataTable(
            border: TableBorder.all(width: 0.5, color: Colors.grey),
            dividerThickness: .5,
            onSelectAll: (state) {
              PageDataTableUtils.selectAll(data, state ?? false,
                  selectAll: () {
                    refresh.value = !refresh.value;
                  });
            },
            columns: titles
                .map((e) => DataColumn(
                label: TitleWidget(
                  title: e,
                )))
                .toList(),
            rows: PageDataTableUtils.getDataDataRows(data, getDataCell,
                selectIndex: (index) {
                  refresh.value = !refresh.value;
                }),
          );
        }),
      ),
    );
  }
}


class DataPageFooterPage extends StatelessWidget {
  final ValueNotifier<int> total,limit;
  final PageParams params;
  final VoidCallback callback;
  const DataPageFooterPage({super.key, required this.total, required this.limit, required this.params, required this.callback});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      builder: (context, child) {
        return Pager2(
          totalPages: total.value ~/ params.limit + 1,
          onPageChanged: (int index) {
            params.page = index;
            callback();
          },
          showItemsPerPage: true,
          onItemsPerPageChanged: (int nums) {
            params.limit = nums;
            params.page = Constants.startPage;
            callback();
            limit.value = nums;
          },
          currentPage: params.page,
          initRowsPerPage: params.limit,
        );
      },
      listenable: Listenable.merge([total, limit]),
    );
  }
}



class SearchHeaderWidget extends StatelessWidget {
  final List<Widget> items;
  const SearchHeaderWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          spacing:10,
          children: items,
        ),
      ),
    );
  }
}
