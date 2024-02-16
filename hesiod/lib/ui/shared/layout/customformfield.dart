import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hesiod/domain/enums/theme/text_state.dart';
import 'package:hesiod/ui/shared/theme/colour_palette.dart';
import 'package:hesiod/ui/shared/theme/text.dart';

class CustomFormField extends StatelessWidget {
  final String header;
  final String hint;
  final String? Function(String?)? validator;
  final TextEditingController? value;
  final String keyName;
  final TextInputType keyboardType;
  final bool isPassword;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final InputBorder focusBorder;
  final void Function()? onTap;
  final bool? isReadOnly;
  final String? prefixText;
  final String? Function(String)? onChanged;
  final bool? isFocused;
  final int? maxLength;
  final bool? isSearch;
  final void Function()? onSearch;
  final bool isFieldMandatory;
  final Iterable<String>? autofillHints;
  final bool? isMobileNumberField;
  final String? initialCountrySelection;

  const CustomFormField({
    super.key,
    this.header = '',
    this.hint = '',
    this.validator,
    this.value,
    this.keyName = '',
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.padding = const EdgeInsets.all(12.0),
    this.backgroundColor = AppColours.lightGrey,
    this.focusBorder = InputBorder.none,
    this.onTap,
    this.isReadOnly = false,
    this.prefixText,
    this.onChanged,
    this.isFocused = false,
    this.maxLength = 80,
    this.isSearch = false,
    this.onSearch,
    this.isFieldMandatory = false,
    this.autofillHints,
    this.isMobileNumberField = false,
    this.initialCountrySelection = "GB",
  });

  @override
  Widget build(BuildContext context) {
    const fieldStyle = TextStyle(
      height: 1.4,
      fontFamily: "Sofia",
      color: AppColours.surfaceVariant,
      fontSize: 16,
      fontWeight: FontWeight.w300,
    );

    return Container(
      padding: const EdgeInsets.only(bottom: 4.0),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(4.0), topLeft: Radius.circular(4.0))),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
                autofillHints: autofillHints,
                maxLength: maxLength,
                autofocus: isFocused!,
                onChanged: onChanged,
                readOnly: isReadOnly!,
                onTap: onTap,
                key: Key(keyName),
                validator: validator,
                obscureText: isPassword,
                controller: value,
                maxLines: 1,
                keyboardType: keyboardType,
                decoration: InputDecoration(
                  suffixIcon: isSearch!
                      ? IconButton(
                          onPressed: onSearch,
                          icon: const Icon(
                            Icons.search,
                            size: 30,
                          ))
                      : null,
                  counterText: '',
                  prefixText: prefixText,
                  contentPadding: const EdgeInsets.all(8.0),
                  label: Row(
                    children: [
                      if (isFieldMandatory) ...[
                        AppText.body("* ", state: TextState.error)
                      ],
                      AppText.body(header, state: TextState.disabled),
                    ],
                  ),
                  border: InputBorder.none,
                  focusedBorder: focusBorder,
                  errorBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColours.error, width: 1.0)),
                  isDense: true,
                  hintText: hint,
                  hoverColor: AppColours.primary,
                  fillColor: AppColours.primary,
                  focusColor: AppColours.primary,
                )),
          ),
        ],
      ),
    );
  }
}
