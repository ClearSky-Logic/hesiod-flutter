import 'package:flutter/material.dart';
import 'package:hesiod/domain/enums/theme/text_state.dart';
import 'package:hesiod/ui/shared/layout/emptywidget.dart';
import 'package:hesiod/ui/shared/theme/text.dart';

class ErrorText extends StatelessWidget {
  final String? errorMessage;

  const ErrorText({
    Key? key,
    this.errorMessage = '',
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return errorMessage!.isEmpty || errorMessage == null
        ? const EmptySpace()
        : AppText.messageMultiline(
            errorMessage!,
            state: TextState.error,
            maxLines: 3,
          );
  }
}
