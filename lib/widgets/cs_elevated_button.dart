import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CsElevatedButton extends StatelessWidget {
  ///Cria um [ElevatedButton] para ser utilizado no aplicativo
  const CsElevatedButton({
    required this.onPressed,
    required this.label,
    this.icon,
    this.elevation = 5,
    this.height = 45,
    this.width = double.infinity,
    this.backgroundColor,
    this.colorText,
    super.key,
  }) : secondary = false;

  const CsElevatedButton.secondary({
    required this.onPressed,
    required this.label,
    this.icon,
    this.elevation = 5,
    this.height = 45,
    this.width = double.infinity,
    this.backgroundColor,
    super.key,
  })  : secondary = true,
        colorText = null;

  final VoidCallback? onPressed;
  final String label;
  final Widget? icon;
  final double elevation;
  final double height;
  final double width;
  final Color? backgroundColor;
  final Color? colorText;
  final bool secondary;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: const SizedBox(),
        clipBehavior: Clip.none,
        label: AutoSizeText(
          label.toUpperCase(),
          style: secondary
              ? TextStyle(
                  fontWeight: FontWeight.w800,
                  color: backgroundColor ?? theme.primaryColor,
                  fontSize: 16,
                )
              : TextStyle(
                  fontWeight: FontWeight.w800,
                  color: colorText ?? Colors.white,
                  fontSize: 16,
                ),
          maxLines: 1,
        ),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((_) {
            if (secondary) {
              return theme.colorScheme.surface;
            }

            if (backgroundColor != null) {
              return backgroundColor;
            }

            return theme.primaryColor;
          }),
          overlayColor: WidgetStateProperty.resolveWith((_) {
            if (secondary) {
              return theme.colorScheme.primary.withOpacity(0.2);
            }

            if (backgroundColor != null) {
              return backgroundColor;
            }

            return theme.splashColor;
          }),
          textStyle: WidgetStateProperty.resolveWith((_) {
            if (secondary) {
              return TextStyle(
                fontWeight: FontWeight.w800,
                color: backgroundColor ?? theme.primaryColor,
                fontSize: 16,
              );
            }

            return TextStyle(
              fontWeight: FontWeight.w800,
              color: colorText ?? Colors.white,
              fontSize: 16,
            );
          }),
          elevation: WidgetStateProperty.all(onPressed == null ? 0 : elevation),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: secondary
                  ? BorderSide(
                      color: backgroundColor ?? theme.primaryColor,
                      width: 2,
                    )
                  : BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
