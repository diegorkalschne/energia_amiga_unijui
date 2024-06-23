import 'package:flutter/material.dart';

class CsSliderConfig extends StatefulWidget {
  const CsSliderConfig({
    required this.value,
    required this.onChanged,
    this.max = 1,
    this.min = 0,
    this.label,
    this.divisions,
    super.key,
  });

  final double value;
  final void Function(double)? onChanged;
  final double max;
  final double min;
  final String? label;
  final int? divisions;

  @override
  State<CsSliderConfig> createState() => _CsSliderConfigState();
}

class _CsSliderConfigState extends State<CsSliderConfig> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '${widget.label}',
                style: TextStyle(
                  color: theme.colorScheme.onPrimary,
                  fontSize: 14,
                ),
              ),
            ),
          ],
          Slider(
            value: widget.value,
            onChanged: widget.onChanged,
            max: widget.max,
            min: widget.min,
            divisions: widget.divisions,
            inactiveColor: Colors.grey[300],
          ),
        ],
      ),
    );
  }
}
