import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final class ShelfTextField extends StatefulWidget {
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final int? maxLength;
  final bool readOnly;
  final String? helperText;
  final bool enabled;

  /// Custom fields
  final String label;
  final List<String> errors;
  final void Function()? onClear;
  final bool isRequired;
  final String? value;

  const ShelfTextField({
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
    this.helperText,
    this.enabled = true,

    /// Custom fields
    required this.label,
    this.errors = const [],
    this.onClear,
    this.isRequired = false,
    this.value,
  });

  @override
  State<StatefulWidget> createState() => _ShelfTextFieldState();
}

class _ShelfTextFieldState extends State<ShelfTextField> {
  final TextEditingController _controller = TextEditingController();

  late FocusNode _focusNode;

  bool wasFocused = false;
  bool isDirty = false;

  _ShelfTextFieldState();

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

    if (widget.value != null) {
      _controller.text = widget.value!;

      final oldValue = _controller.value;
      TextEditingValue newValue = oldValue;

      widget.inputFormatters?.forEach((it) {
        newValue = it.formatEditUpdate(oldValue, newValue);
      });

      _controller.value = newValue;
    }
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          maxLength: widget.maxLength,
          controller: _controller,
          focusNode: _focusNode,
          decoration: InputDecoration(
            helperText: widget.helperText,
            border: OutlineInputBorder(),
            label: _renderLabel(widget.label, isRequired: widget.isRequired),
            suffixIcon: widget.onClear != null && _controller.text.isNotEmpty
                ? Focus(
                    // We need to set a focus for this button, so it does not
                    // tamper with the form traversal.
                    descendantsAreFocusable: false,
                    canRequestFocus: false,
                    child: IconButton(
                      onPressed: () {
                        if (!isDirty) {
                          setState(() {
                            isDirty = true;
                          });
                        }

                        _controller.clear();
                        widget.onClear?.call();
                      },
                      icon: const Icon(Icons.clear),
                    ),
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
