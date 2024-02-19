import 'package:flutter/material.dart';
import 'package:hesiod/domain/enums/theme/text_state.dart';
import 'package:hesiod/ui/shared/theme/colour_palette.dart';
import 'package:hesiod/ui/shared/theme/text.dart';

class PasswordFormField extends StatefulWidget {
  final String header;
  final String hint;
  final String? Function(String?)? validator;
  final TextEditingController? value;
  final String keyName;
  final TextInputType keyboardType;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final bool isFieldMandatory;
  final Iterable<String>? autofillHints;

  const PasswordFormField(
      {super.key,
      this.header = '',
      this.hint = '',
      this.validator,
      this.value,
      this.keyName = '',
      this.keyboardType = TextInputType.text,
      this.padding = const EdgeInsets.all(8.0),
      this.backgroundColor = Colors.white,
      this.isFieldMandatory = false,
      this.autofillHints});

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool revealPassword = true;

  _updateVisibility() {
    setState(() {
      revealPassword = !revealPassword;
    });
  }

  //

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 4.0),
      decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(4.0), topLeft: Radius.circular(4.0))),
      child: Stack(children: [
        TextFormField(
          autofillHints: widget.autofillHints,
          maxLength: 50,
          key: Key(widget.keyName),
          validator: widget.validator,
          obscureText: revealPassword,
          controller: widget.value,
          maxLines: 1,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            counterText: '',
            contentPadding: const EdgeInsets.all(8.0),
            label: Row(
              children: [
                if (widget.isFieldMandatory) ...[
                  AppText.body("* ", state: TextState.error)
                ],
                AppText.body(widget.header, state: TextState.disabled),
              ],
            ),
            border: InputBorder.none,
            errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColours.error, width: 1.0)),
            isDense: true,
            hintText: widget.hint,
            fillColor: AppColours.background,
          ),
        ),
        revealPassword
            ? Positioned(
                right: 10.0,
                top: 20.0,
                child: InkWell(
                    child: const Icon(
                      Icons.visibility_rounded,
                      color: AppColours.disabled,
                    ),
                    onTap: () => _updateVisibility()),
              )
            : Positioned(
                right: 10.0,
                top: 20.0,
                child: InkWell(
                    child: const Icon(Icons.visibility_off_rounded,
                        color: AppColours.primary),
                    onTap: () => _updateVisibility()),
              ),
      ]),
    );
  }
}
