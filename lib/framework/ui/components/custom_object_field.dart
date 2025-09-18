import 'package:flutter/material.dart';

final class CustomObjectField<T> extends StatefulWidget {
  final FocusNode? focusNode;
  final void Function()? onTap;

  /// Custom fields
  final T? value;
  final String? textValue;
  final String label;
  final bool isRequired;
  final void Function()? onClear;
  final List<String> errors;

  const CustomObjectField({
    super.key,
    this.focusNode,
    this.onTap,
    // Custom fields
    this.value,
    this.textValue,
    required this.label,
    this.isRequired = false,
    this.onClear,
    this.errors = const [],
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
    final theme = Theme.of(context);

    _controller.text = widget.textValue ?? "";

    return Focus(
      focusNode: _focusNode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Material(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: theme.colorScheme.outline),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: InkWell(
                        onTap: () {
                          _focusNode.requestFocus();
                          // widget.onTap?.call();
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 11,
                            vertical: 18,
                          ),
                          child: Text("test"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 6,
                top: -10,
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  child: Text(
                    "tester",
                    style: TextStyle(
                      fontSize: 12,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 11, top: 3, right: 11),
            child: Text("The value can't", style: TextStyle(fontSize: 12)),
          ),
          // When the errors are showing, try to preserve the padding.
          // if (widget.errors.isEmpty || !_isDirty) SizedBox(height: 22),
        ],
      ),
    );

    // return Column(
    //   children: [
    //
    //     TextFormField(
    //       controller: _controller,
    //       readOnly: true,
    //       enableInteractiveSelection: true,
    //       showCursor: true,
    //       textCapitalization: TextCapitalization.characters,
    //       keyboardType: TextInputType.text,
    //       decoration: InputDecoration(
    //         border: OutlineInputBorder(),
    //         label: _renderLabel(widget.label, isRequired: widget.isRequired),
    //         suffixIcon: widget.onClear != null && _controller.text.isNotEmpty
    //             ? Focus(
    //                 // We need to set a focus for this button, so it does
    //                 // not tamper with the form traversal.
    //                 descendantsAreFocusable: false,
    //                 canRequestFocus: false,
    //                 child: IconButton(
    //                   onPressed: () {
    //                     if (!_isDirty) {
    //                       setState(() {
    //                         _isDirty = true;
    //                       });
    //                     }
    //
    //                     _controller.clear();
    //                     widget.onClear?.call();
    //                   },
    //                   icon: const Icon(Icons.clear_rounded),
    //                 ),
    //               )
    //             : null,
    //       ),
    //       onTap: () {
    //         widget.onTap?.call();
    //
    //         if (!_isDirty) {
    //           setState(() {
    //             _isDirty = true;
    //           });
    //         }
    //       },
    //       forceErrorText: _isDirty ? widget.errors.firstOrNull : null,
    //     ),
    //     // When the errors are showing, try to preserve the padding.
    //     if (widget.errors.isEmpty || !_isDirty) SizedBox(height: 22),
    //   ],
    // );
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
