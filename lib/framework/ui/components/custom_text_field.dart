import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;

  /// Custom fields
  final String label;
  final String value;
  final List<String> errors;
  final void Function()? onClear;

  const CustomTextField({
    super.key,
    this.keyboardType,
    this.onChanged,
    this.inputFormatters,
    this.textCapitalization,
    this.textInputAction,
    this.focusNode,
    this.onFieldSubmitted,

    /// Custom fields
    required this.label,
    required this.value,
    required this.errors,
    this.onClear,
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

    final initialFormattedValue = widget.inputFormatters?.fold(widget.value, (
      acc,
      formatter,
    ) {
      return formatter
          .formatEditUpdate(TextEditingValue.empty, TextEditingValue(text: acc))
          .text;
    });

    _controller.text = initialFormattedValue ?? widget.value;

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
  void didUpdateWidget(covariant CustomTextField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.value != oldWidget.value && widget.value != _controller.text) {
      _controller.text = widget.value;
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
      children: [
        TextFormField(
          controller: _controller,
          focusNode: _focusNode,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            label: Text(widget.label),
            suffixIcon: widget.onClear != null && widget.value.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      if (!isDirty) {
                        setState(() {
                          isDirty = true;
                        });
                      }

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
        if (widget.errors.isEmpty || !isDirty) SizedBox(height: 20),
      ],
    );
  }
}
