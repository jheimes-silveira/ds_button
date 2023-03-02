import 'package:flutter/material.dart';

enum _DSTypeButton {
  elevated,
  text,
  outline,
}

class DSButton extends StatefulWidget {
  final _DSTypeButton _type;
  final String text;
  final bool loading;
  final Function() onPressed;

  const DSButton._raw(
    this._type, {
    required this.text,
    required this.onPressed,
    required this.loading,
  });

  factory DSButton.elevated({
    required String text,
    required Function() onPressed,
    bool loading = false,
  }) {
    return DSButton._raw(
      _DSTypeButton.elevated,
      text: text,
      onPressed: onPressed,
      loading: loading,
    );
  }
  factory DSButton.text({
    required String text,
    required Function() onPressed,
    bool loading = false,
  }) {
    return DSButton._raw(
      _DSTypeButton.text,
      text: text,
      onPressed: onPressed,
      loading: loading,
    );
  }
  factory DSButton.outline({
    required String text,
    required Function() onPressed,
    bool loading = false,
  }) {
    return DSButton._raw(
      _DSTypeButton.outline,
      text: text,
      onPressed: onPressed,
      loading: loading,
    );
  }

  @override
  State<DSButton> createState() => _DSButtonState();
}

class _DSButtonState extends State<DSButton> {
  @override
  Widget build(BuildContext context) {
    if (_DSTypeButton.elevated == widget._type) {
      return _buildElevated();
    }
    if (_DSTypeButton.outline == widget._type) {
      return _buildOutline();
    }
    return _buildText();
  }

  Widget _buildElevated() {
    return ElevatedButton(
      onPressed: widget.onPressed,
      child: _buildChild(Theme.of(context).colorScheme.inversePrimary),
    );
  }

  Widget _buildOutline() {
    return OutlinedButton(
      onPressed: widget.onPressed,
      child: _buildChild(Theme.of(context).colorScheme.primary),
    );
  }

  Widget _buildText() {
    return TextButton(
      onPressed: widget.onPressed,
      child: _buildChild(Theme.of(context).colorScheme.primary),
    );
  }

  Stack _buildChild(Color loadingColor) {
    return Stack(
      children: [
        Positioned.fill(
          bottom: 0,
          top: 0,
          right: 0,
          left: 0,
          child: Opacity(
            opacity: widget.loading ? 1 : 0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 14,
                  width: 14,
                  child: CircularProgressIndicator(
                    color: loadingColor,
                    strokeWidth: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
        Opacity(
          opacity: widget.loading ? 0 : 1,
          child: Text(widget.text),
        ),
      ],
    );
  }
}
