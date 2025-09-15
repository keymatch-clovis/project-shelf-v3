import 'package:flutter/material.dart';

final class CustomObjectField<T> extends StatefulWidget {
  final FocusNode? focusNode;
  final void Function() onTap;

  /// Custom fields
  final String? textValue;
  final String label;
  final bool isRequired;
  final void Function()? onClear;
  final List<String> errors;
  final void Function()? onSubmitted;

  const CustomObjectField({
    super.key,
    this.focusNode,
    required this.onTap,
    // Custom fields
    this.textValue,
    required this.label,
    this.isRequired = false,
    this.onClear,
    this.errors = const [],
    this.onSubmitted,
  });

  @override
  State<StatefulWidget> createState() => _CustomObjectFieldState();
}

final class _CustomObjectFieldState<T> extends State<CustomObjectField<T>> {
  final _controller = TextEditingController();

  late FocusNode _focusNode;

  bool _wasFocused = false;
  bool _isDirty = false;

  @override
  void initState() {
    super.initState();

    _focusNode = widget.focusNode ?? FocusNode();

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          _wasFocused = true;
        });
      }

      // If the user focuses, and then un-focuses, we can mark the text field as
      // dirty.
      if (!_focusNode.hasFocus && _wasFocused) {
        setState(() {
          _isDirty = true;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    // If the parent did not provide the [FocusNode], it means we created the
    // [FocusNode] here. And we have to dispose it.
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    _controller.text = widget.textValue ?? "";

    return Column(
      children: [
        TextFormField(
          controller: _controller,
          readOnly: true,
          focusNode: _focusNode,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            label: _renderLabel(widget.label, isRequired: widget.isRequired),
            suffixIcon: widget.onClear != null && _controller.text.isEmpty
                ? IconButton(
                    onPressed: () {
                      if (!_isDirty) {
                        setState(() {
                          _isDirty = true;
                        });
                        _controller.clear();
                        widget.onClear?.call();
                      }
                    },
                    icon: const Icon(Icons.clear_rounded),
                  )
                : null,
          ),
          onTap: () {
            widget.onTap();

            if (!_isDirty) {
              setState(() {
                _isDirty = true;
              });
            }
          },
          forceErrorText: _isDirty ? widget.errors.firstOrNull : null,
        ),
        // When the errors are showing, try to preserve the padding.
        if (widget.errors.isEmpty || !_isDirty) SizedBox(height: 22),
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
