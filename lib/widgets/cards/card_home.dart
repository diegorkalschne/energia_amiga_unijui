import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../config/assets/assets_path.dart';
import '../cs_icon.dart';

class CardHome extends StatelessWidget {
  const CardHome({
    required this.label,
    required this.icon,
    this.onTap,
    super.key,
  });

  final dynamic icon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Semantics(
      label: 'Módulo $label',
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: theme.colorScheme.tertiary,
              width: 2,
            ),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -2,
                left: -3,
                right: -3,
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                      image: AssetImage(AssetsPath.BACKGROUND_PNG),
                      fit: BoxFit.cover,
                    ),
                    gradient: LinearGradient(
                      colors: [
                        theme.colorScheme.onPrimary,
                        theme.colorScheme.onSecondary,
                        theme.colorScheme.onPrimary,
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: CsIcon(
                    icon: icon,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 55,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  alignment: Alignment.center,
                  child: AutoSizeText(
                    label,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    maxFontSize: 18,
                    minFontSize: 18,
                    textScaleFactor: 1,
                    style: TextStyle(
                      color: theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
