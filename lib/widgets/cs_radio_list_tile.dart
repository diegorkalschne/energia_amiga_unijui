import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../utils/functions_utils.dart';

class CsRadioListTile<T> extends StatelessWidget {
  const CsRadioListTile({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.title,
    this.descricao,
    this.height = 50,
    this.toggleable = false,
    super.key,
  });

  final T value;
  final T? groupValue;
  final void Function(T?)? onChanged;
  final String? title;
  final String? descricao;
  final double? height;
  final bool toggleable;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: height,
      child: InkWell(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();

          onChanged!(value!);

          if (toggleable) {
            if (value == groupValue) {
              onChanged!(null);
            }
          }
        },
        borderRadius: BorderRadius.circular(10),
        splashColor: Colors.grey[200],
        focusColor: Colors.grey[200],
        hoverColor: Colors.grey[200],
        highlightColor: Colors.grey[200],
        child: Row(
          children: [
            Radio<T>(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    title!,
                    maxLines: 1,
                    maxFontSize: 15,
                    style: TextStyle(
                      color: theme.colorScheme.onSurface,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (!isNullOrEmpty(descricao)) ...[
                    Flexible(
                      child: Text(
                        descricao!,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: theme.colorScheme.primaryContainer,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
