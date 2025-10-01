import 'package:flutter/material.dart';

enum CustomObjectFieldStatus { INITIAL, DIRTY }

final class CustomObjectField<T> extends StatefulWidget {
  final FocusNode? focusNode;
  final void Function()? onTap;

  /// Custom fields
  final Widget? body;
  final String? emptyLabel;
  final T? value;
  final String label;
  final bool isRequired;
  final void Function()? onClear;
  final List<String> errors;

  const CustomObjectField({
    super.key,
    this.body,
    this.emptyLabel,
    this.value,
    this.focusNode,
    this.onTap,
    // Custom fields
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
    final hasError =
        widget.errors.isNotEmpty && _status != CustomObjectFieldStatus.INITIAL;

    return Focus(
      focusNode: _focusNode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Material(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: hasError
                        ? theme.colorScheme.error
                        : theme.colorScheme.outline,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: InkWell(
                  onTap: widget.onTap != null
                      ? () {
                          _focusNode.requestFocus();
                          widget.onTap?.call();
                        }
                      : null,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12, top: 6, bottom: 6),
                    child: Row(
                      children: [
                        Expanded(
                          child:
                              widget.body ??
                              Text(
                                widget.emptyLabel ?? widget.label,
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: hasError
                                      ? theme.colorScheme.error
                                      : theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                        ),
                        const SizedBox(height: 48),
                        if (widget.onClear != null && widget.value != null)
                          Focus(
                            // We need to set a focus for this button, so it
                            // does not tamper with the form traversal.
                            descendantsAreFocusable: false,
                            canRequestFocus: false,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _status = CustomObjectFieldStatus.DIRTY;
                                });

                                widget.onClear?.call();
                              },
                              icon: const Icon(Icons.close_rounded),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 6,
                top: -10,
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: _Label(
                    widget.label,
                    status: _status,
                    isRequired: widget.isRequired,
                    hasErrors: widget.errors.isNotEmpty,
                  ),
                ),
              ),
            ],
          ),
          _ErrorsLabel(errors: widget.errors, status: _status),
        ],
      ),
    );
  }
}

final class _Label extends StatelessWidget {
  final bool isRequired;
  final String label;
  final bool hasErrors;
  final CustomObjectFieldStatus status;

  const _Label(
    this.label, {
    required this.status,
    this.hasErrors = false,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final color = !hasErrors || status == CustomObjectFieldStatus.INITIAL
        ? theme.colorScheme.onSurfaceVariant
        : theme.colorScheme.error;

    final style = TextStyle(fontSize: 12, color: color);

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
              color: color,
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
  final CustomObjectFieldStatus status;
  final List<String> errors;

  const _ErrorsLabel({required this.status, required this.errors});

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
