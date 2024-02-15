import 'package:flutter/material.dart';
import 'package:hesiod/domain/enums/theme/text_state.dart';
import 'package:hesiod/ui/shared/theme/colour_palette.dart';
import 'package:hesiod/ui/shared/theme/text.dart';

class CustomDropDown extends StatelessWidget {
  final String hint;
  final void Function(String?)? onChanged;
  final Color backgroundColor;
  final List<String> items;
  final String? Function(String?)? validator;
  final bool isFieldMandatory;

  const CustomDropDown(
      {Key? key,
      this.hint = '',
      this.onChanged,
      this.backgroundColor = AppColours.surface,
      this.items = const [],
      this.validator,
      this.isFieldMandatory = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(4.0), topLeft: Radius.circular(4.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButtonFormField<String>(
            focusColor: AppColours.background,
            dropdownColor: AppColours.background,
            iconEnabledColor: AppColours.background,
            iconDisabledColor: AppColours.background,
            validator: validator,
            hint: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Row(
                children: [
                  if (isFieldMandatory) ...[
                    AppText.body("* ", state: TextState.error)
                  ],
                  AppText.body(hint),
                ],
              ),
            ),
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: AppText.body(value),
                ),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
