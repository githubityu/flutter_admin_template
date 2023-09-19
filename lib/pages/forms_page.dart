import 'package:flutter/material.dart';
import 'package:flutter_admin_template/exports.dart';
import 'package:flutter_admin_template/gen/export_gen.dart';
import 'package:flutter_admin_template/layout/default_layout.dart';
import 'package:flutter_admin_template/local/dimens.dart';
import 'package:flutter_admin_template/router/router.dart';
import 'package:flutter_admin_template/util/export_util.dart';
import 'package:flutter_admin_template/widgets/export_widget.dart';
import 'package:intl/intl.dart';

class FormsPage extends StatefulWidget {
  const FormsPage({super.key});

  @override
  State<FormsPage> createState() => _FormsPageState();
}

class _FormsPageState extends State<FormsPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final lang = context.L!;
    final themeData = Theme.of(context);
    return DefaultLayout(
        route: RoutePath.forms,
        child: ListView(
          padding: const EdgeInsets.all(kDefaultPadding),
          children: [
            Text(
              lang.forms(1),
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
                      title: lang.forms(1),
                    ),
                    CardBody(
                      child: FormBuilder(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                  bottom: kDefaultPadding * 2.0),
                              child: UrlNewTabLauncher(
                                displayText: 'flutter_form_builder - pub.dev',
                                url:
                                    'https://pub.dev/packages/flutter_form_builder',
                                fontSize: 13.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding * 2.0),
                              child: FormBuilderTextField(
                                name: 'text_field',
                                decoration: const InputDecoration(
                                  labelText: 'Text Field',
                                  hintText: 'Hint text',
                                  helperText: 'Helper text',
                                  border: OutlineInputBorder(),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                                validator: FormBuilderValidators.required(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding * 2.0),
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: ((constraints.maxWidth * 0.5) -
                                            (kDefaultPadding * 0.5)),
                                        child: FormBuilderCheckboxGroup(
                                          name: 'checkbox_group_vertical',
                                          orientation:
                                              OptionsOrientation.vertical,
                                          decoration: const InputDecoration(
                                            labelText:
                                                'Checkbox Group Vertical',
                                            border: OutlineInputBorder(),
                                          ),
                                          options: const [
                                            FormBuilderFieldOption(
                                                value: 'Item 1',
                                                child: Text('Item 1')),
                                            FormBuilderFieldOption(
                                                value: 'Item 2',
                                                child: Text('Item 2')),
                                            FormBuilderFieldOption(
                                                value: 'Item 3',
                                                child: Text('Item 3')),
                                            FormBuilderFieldOption(
                                                value: 'Item 4',
                                                child: Text('Item 4')),
                                            FormBuilderFieldOption(
                                                value: 'Item 5',
                                                child: Text('Item 5')),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: kDefaultPadding),
                                      SizedBox(
                                        width: ((constraints.maxWidth * 0.5) -
                                            (kDefaultPadding * 0.5)),
                                        child: FormBuilderCheckboxGroup(
                                          name: 'checkbox_group_horizontal',
                                          wrapSpacing: kDefaultPadding,
                                          decoration: const InputDecoration(
                                            labelText:
                                                'Checkbox Group Horizontal',
                                            border: OutlineInputBorder(),
                                          ),
                                          options: const [
                                            FormBuilderFieldOption(
                                                value: 'Item 1',
                                                child: Text('Item 1')),
                                            FormBuilderFieldOption(
                                                value: 'Item 2',
                                                child: Text('Item 2')),
                                            FormBuilderFieldOption(
                                                value: 'Item 3',
                                                child: Text('Item 3')),
                                            FormBuilderFieldOption(
                                                value: 'Item 4',
                                                child: Text('Item 4')),
                                            FormBuilderFieldOption(
                                                value: 'Item 5',
                                                child: Text('Item 5')),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding * 2.0),
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: ((constraints.maxWidth * 0.5) -
                                            (kDefaultPadding * 0.5)),
                                        child: FormBuilderRadioGroup(
                                          name: 'radio_button_group_vertical',
                                          orientation:
                                              OptionsOrientation.vertical,
                                          decoration: const InputDecoration(
                                            labelText:
                                                'Radio Button Group Vertical',
                                            border: OutlineInputBorder(),
                                          ),
                                          options: const [
                                            FormBuilderFieldOption(
                                                value: 'Item 1',
                                                child: Text('Item 1')),
                                            FormBuilderFieldOption(
                                                value: 'Item 2',
                                                child: Text('Item 2')),
                                            FormBuilderFieldOption(
                                                value: 'Item 3',
                                                child: Text('Item 3')),
                                            FormBuilderFieldOption(
                                                value: 'Item 4',
                                                child: Text('Item 4')),
                                            FormBuilderFieldOption(
                                                value: 'Item 5',
                                                child: Text('Item 5')),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: kDefaultPadding),
                                      SizedBox(
                                        width: ((constraints.maxWidth * 0.5) -
                                            (kDefaultPadding * 0.5)),
                                        child: FormBuilderRadioGroup(
                                          name: 'radio_button_group_horizontal',
                                          wrapSpacing: kDefaultPadding,
                                          decoration: const InputDecoration(
                                            labelText:
                                                'Radio Button Group Horizontal',
                                            border: OutlineInputBorder(),
                                          ),
                                          options: const [
                                            FormBuilderFieldOption(
                                                value: 'Item 1',
                                                child: Text('Item 1')),
                                            FormBuilderFieldOption(
                                                value: 'Item 2',
                                                child: Text('Item 2')),
                                            FormBuilderFieldOption(
                                                value: 'Item 3',
                                                child: Text('Item 3')),
                                            FormBuilderFieldOption(
                                                value: 'Item 4',
                                                child: Text('Item 4')),
                                            FormBuilderFieldOption(
                                                value: 'Item 5',
                                                child: Text('Item 5')),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding * 2.0),
                              child: FormBuilderFilterChip(
                                name: 'filter_chip',
                                spacing: kDefaultPadding * 0.5,
                                runSpacing: kDefaultPadding * 0.5,
                                selectedColor: ColorName.warning,
                                decoration: const InputDecoration(
                                  labelText: 'Multi Choice Chip',
                                  border: OutlineInputBorder(),
                                ),
                                options: const [
                                  FormBuilderChipOption(
                                      value: 'Item 1', child: Text('Item 1')),
                                  FormBuilderChipOption(
                                      value: 'Item 2', child: Text('Item 2')),
                                  FormBuilderChipOption(
                                      value: 'Item 3', child: Text('Item 3')),
                                  FormBuilderChipOption(
                                      value: 'Item 4', child: Text('Item 4')),
                                  FormBuilderChipOption(
                                      value: 'Item 5', child: Text('Item 5')),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding * 2.0),
                              child: FormBuilderChoiceChip(
                                name: 'choice_chip',
                                spacing: kDefaultPadding * 0.5,
                                runSpacing: kDefaultPadding * 0.5,
                                selectedColor: ColorName.warning,
                                decoration: const InputDecoration(
                                  labelText: 'Single Choice Chip',
                                  border: OutlineInputBorder(),
                                ),
                                options: const [
                                  FormBuilderChipOption(
                                      value: 'Item 1', child: Text('Item 1')),
                                  FormBuilderChipOption(
                                      value: 'Item 2', child: Text('Item 2')),
                                  FormBuilderChipOption(
                                      value: 'Item 3', child: Text('Item 3')),
                                  FormBuilderChipOption(
                                      value: 'Item 4', child: Text('Item 4')),
                                  FormBuilderChipOption(
                                      value: 'Item 5', child: Text('Item 5')),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding * 2.0),
                              child: FormBuilderDateTimePicker(
                                name: 'date_picker',
                                onChanged: (value) {},
                                inputType: InputType.date,
                                decoration: const InputDecoration(
                                  labelText: 'Date Picker',
                                  border: OutlineInputBorder(),
                                ),
                                initialTime:
                                    const TimeOfDay(hour: 8, minute: 0),
                                initialValue: DateTime.now(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding * 2.0),
                              child: FormBuilderDateTimePicker(
                                name: 'time_picker',
                                onChanged: (value) {},
                                inputType: InputType.time,
                                decoration: const InputDecoration(
                                  labelText: 'Time Picker',
                                  border: OutlineInputBorder(),
                                ),
                                initialTime:
                                    const TimeOfDay(hour: 8, minute: 0),
                                initialValue: DateTime.now(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding * 2.0),
                              child: FormBuilderDateRangePicker(
                                name: 'date_range',
                                firstDate: DateTime(1970),
                                lastDate: DateTime(2030),
                                format: DateFormat('yyyy-MM-dd'),
                                onChanged: (value) {},
                                decoration: const InputDecoration(
                                  labelText: 'Date Range Picker',
                                  hintText: 'Hint text',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding * 2.0),
                              child: FormBuilderSlider(
                                name: 'slider',
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.min(6),
                                ]),
                                onChanged: (value) {},
                                min: 0.0,
                                max: 10.0,
                                initialValue: 7.0,
                                divisions: 20,
                                activeColor: context.colorScheme.primary,
                                inactiveColor: context.colorScheme.primary
                                    .withOpacity(0.3),
                                decoration: const InputDecoration(
                                  labelText: 'Slider',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding * 2.0),
                              child: Theme(
                                data: themeData.copyWith(
                                  // canvasColor: Colors.amber,
                                  splashColor: Colors.amber,
                                ),
                                child: FormBuilderDropdown(
                                  name: 'dropdown',
                                  decoration: const InputDecoration(
                                      labelText: 'Dropdown',
                                      border: OutlineInputBorder(),
                                      hoverColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      suffixIcon: Icon(Icons.close),
                                      hintText: 'Select'),
                                  focusColor: Colors.transparent,
                                  validator: FormBuilderValidators.required(),
                                  items: [
                                    'Item 1',
                                    'Item 2',
                                    'Item 3',
                                    'Item 4',
                                    'Item 5'
                                  ]
                                      .map((e) => DropdownMenuItem(
                                          value: e, child: Text(e)))
                                      .toList(),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                  bottom: kDefaultPadding * 2.0),
                              child: Column(
                                children: [
                                  Icon(Icons.file_upload),
                                  Text('Upload'),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding * 2.0),
                              child: FormBuilderSwitch(
                                name: 'switch',
                                title: const Text('Receive marketing email'),
                                decoration: const InputDecoration(
                                  labelText: 'Switch',
                                  border: OutlineInputBorder(),
                                  hoverColor: Colors.amber,
                                  focusColor: Colors.transparent,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding * 2.0),
                              child: FormBuilderCheckbox(
                                name: 'accept_terms',
                                initialValue: false,
                                onChanged: (value) {},
                                title: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'I have read and agree to the ',
                                        style: TextStyle(
                                          color:
                                              themeData.colorScheme.onSurface,
                                        ),
                                      ),
                                      const TextSpan(
                                        text: 'Terms and Conditions',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ],
                                  ),
                                ),
                                validator: FormBuilderValidators.equal(
                                  true,
                                  errorText:
                                      'You must accept terms and conditions to continue',
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: SizedBox(
                                height: 36.0,
                                width: 100.0,
                                child: ElevatedButton(
                                  style: context
                                      .appExtensionTheme!.primaryElevated,
                                  onPressed: () {
                                    if (_formKey.currentState?.validate() ??
                                        false) {
                                      // Validation passed.
                                      _formKey.currentState!.save();
                                    } else {
                                      // Validation failed.
                                    }
                                  },
                                  child: Text(lang.submit),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
