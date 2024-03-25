import 'package:flutter/material.dart';
import 'package:linjiashop_admin_web/exports.dart';
import 'package:linjiashop_admin_web/local/constants.dart';

class ItemsPerPage extends StatefulWidget {
  const ItemsPerPage({
    super.key,
    required this.onChanged,
    this.itemsPerPageText,
    this.itemsPerPageTextStyle,
    this.dropDownMenuItemTextStyle,
    this.initRowsPerPage
  });

  final Function(int) onChanged;
  final String? itemsPerPageText;
  final int? initRowsPerPage;
  final TextStyle? itemsPerPageTextStyle, dropDownMenuItemTextStyle;

  @override
  State<ItemsPerPage> createState() => _ItemsPerPageState();
}

class _ItemsPerPageState extends State<ItemsPerPage> {
  final List<int> availableRowsPerPage = [2,Constants.rowsPerPage,Constants.rowsPerPage*2,Constants.rowsPerPage*3];
  late int rowsPerPage = widget.initRowsPerPage?? Constants.rowsPerPage;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.itemsPerPageText ?? "",
          style: widget.itemsPerPageTextStyle ??
              const TextStyle(
                color: Colors.grey,
              ),
        ),
        const SizedBox(width: 16),
        DropdownButton(
          icon: const Icon(Icons.keyboard_arrow_down),
          value: rowsPerPage,
          focusColor: Colors.transparent,
          items: availableRowsPerPage.map((value) {
            return DropdownMenuItem<int>(
              value: value,
              child: Text(
                value.toString(),
                style: widget.dropDownMenuItemTextStyle ??
                    const TextStyle(
                      fontSize: 14,
                    ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              rowsPerPage = value??Constants.rowsPerPage;
              widget.onChanged(value as int);
            });
          },
        ),
      ],
    );
  }
}
