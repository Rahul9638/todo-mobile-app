import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    super.key,
    required this.controller,
    this.textInputAction,
    this.keyboardType,
    this.onChanged,
    this.validation,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.autoFocus = false,
    this.textCapitalization = TextCapitalization.none,
    this.focusNode,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.decoration,
    this.readOnly = false,
    this.autofillHints,
    this.obscureText = false,
    this.ontap,
  });
  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final String? Function(String?)? validation;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final bool autoFocus;
  final TextCapitalization textCapitalization;
  final FocusNode? focusNode;
  final bool readOnly;
  final AutovalidateMode? autovalidateMode;
  final InputDecoration? decoration;
  final Iterable<String>? autofillHints;
  final bool obscureText;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: ontap,
      onTapOutside: (PointerDownEvent event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      obscureText: obscureText,
      obscuringCharacter: '*',
      autofillHints: autofillHints,
      autovalidateMode: autovalidateMode,
      readOnly: readOnly,
      focusNode: focusNode,
      textCapitalization: textCapitalization,
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator: validation,
      maxLength: maxLength,
      maxLines: maxLines,
      minLines: minLines,
      autofocus: autoFocus,
      onChanged: onChanged,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.deny(
          RegExp(
              '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
        ),
      ],
      decoration: decoration,
    );
  }
}
