import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final class CustomTextField extends StatefulWidget {
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final int? maxLength;
  final bool readOnly;

  /// Custom fields
  final String label;
  final List<String> errors;
  final void Function()? onClear;
  final bool isRequired;
  final String? value;

  const CustomTextField({
    super.key,
    this.keyboardType,
    this.onChanged,
    this.inputFormatters,
    this.textCapitalization,
    this.textInputAction,
    this.focusNode,
    this.onFieldSubmitted,
    this.maxLength,
    this.readOnly = false,

    /// Custom fields
    required this.label,
    this.errors = const [],
    this.onClear,
    this.isRequired = false,
    this.value,
  });

  @override
  State<StatefulWidget> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController _controller = TextEditingController();

  late FocusNode _focusNode;

  bool wasFocused = false;
  bool isDirty = false;

  _CustomTextFieldState();

  @override
  void initState() {
    super.initState();

    _focusNode = widget.focusNode ?? FocusNode();

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          wasFocused = true;
        });
      }

      // If the user focuses, and then un-focuses, we can mark the text field as
      // dirty.
      if (!_focusNode.hasFocus && wasFocused) {
        setState(() {
          isDirty = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();

    // If the parent did not provide the [FocusNode], it means we created the
    // [FocusNode] here. And we have to dispose it.
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.value != null) {
      _controller.text = widget.value!;
    }

    return Column(
      children: [
        TextFormField(
          readOnly: widget.readOnly,
          maxLength: widget.maxLength,
          controller: _controller,
          focusNode: _focusNode,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            label: _renderLabel(widget.label, isRequired: widget.isRequired),
            suffixIcon: widget.onClear != null && _controller.text.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      if (!isDirty) {
                        setState(() {
                          isDirty = true;
                        });
                      }

                      _controller.clear();
                      widget.onClear?.call();
                    },
                    icon: Icon(Icons.clear),
                  )
                : null,
          ),
          textCapitalization:
              widget.textCapitalization ?? TextCapitalization.none,
          textInputAction: widget.textInputAction,
          keyboardType: widget.keyboardType,
          onFieldSubmitted: widget.onFieldSubmitted,
          onChanged: (value) {
            if (!isDirty) {
              setState(() {
                isDirty = true;
              });
            }

            widget.onChanged?.call(value);
          },
          inputFormatters: widget.inputFormatters,
          forceErrorText: isDirty ? widget.errors.firstOrNull : null,
        ),
        // When the errors are showing, try to preserve the padding.
        // NOTE: Ugly.
        if (widget.maxLength == null && (widget.errors.isEmpty || !isDirty))
          SizedBox(height: 22),
      ],
    );
  }
}

Widget _renderLabel(String label, {bool isRequired = false}) {
  if (isRequired) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          // http://unicodepedia.com/unicode/halfwidth-and-fullwidth-forms/ff0a/fullwidth-asterisk/
          "＊",
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 4),
        Text(label),
      ],
    );
  }

  return Text(label);
}
