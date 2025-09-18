import 'package:flutter/material.dart';

enum CustomObjectFieldStatus { INITIAL, DIRTY }

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
  late FocusNode _focusNode;

  bool _wasFocused = false;
  CustomObjectFieldStatus _status = CustomObjectFieldStatus.INITIAL;

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
          _status = CustomObjectFieldStatus.DIRTY;
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
                        side: BorderSide(
                          color:
                              widget.errors.isEmpty ||
                                  _status == CustomObjectFieldStatus.INITIAL
                              ? theme.colorScheme.outline
                              : theme.colorScheme.error,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: InkWell(
                        onTap: () {
                          _focusNode.requestFocus();

                          if (_status != CustomObjectFieldStatus.DIRTY) {
                            setState(() {
                              _status = CustomObjectFieldStatus.DIRTY;
                            });
                          }

                          widget.onTap?.call();
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 11,
                            vertical: 18,
                          ),
                          child: Text(widget.label),
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
                  child: _Label(
                    widget.label,
                    status: _status,
                    isRequired: widget.isRequired,
                  ),
                ),
              ),
            ],
          ),
          _ErrorsLabel(errors: widget.errors, status: _status),
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

final class _Label extends StatelessWidget {
  final bool isRequired;
  final String label;
  final CustomObjectFieldStatus status;

  const _Label(this.label, {required this.status, this.isRequired = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = TextStyle(
      fontSize: 12,
      color: status == CustomObjectFieldStatus.INITIAL
          ? theme.colorScheme.onSurfaceVariant
          : theme.colorScheme.error,
    );

    if (isRequired) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            // http://unicodepedia.com/unicode/halfwidth-and-fullwidth-forms/ff0a/fullwidth-asterisk/
            "＊",
            style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.bold,
              color: status == CustomObjectFieldStatus.INITIAL
                  ? theme.colorScheme.onSurfaceVariant
                  : theme.colorScheme.error,
            ),
          ),
          const SizedBox(width: 4),
          Text(label, style: style),
        ],
      );
    }

    return Text(label, style: style);
  }
}

final class _ErrorsLabel extends StatelessWidget {
  final List<String> errors;
  final CustomObjectFieldStatus status;

  const _ErrorsLabel({required this.errors, required this.status});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (errors.isEmpty || status == CustomObjectFieldStatus.INITIAL) {
      return SizedBox(height: 22);
    }

    return Padding(
      padding: EdgeInsets.only(left: 11, top: 2, right: 11),
      child: Text(
        errors.first,
        style: TextStyle(fontSize: 12, color: theme.colorScheme.error),
      ),
    );
  }
}
