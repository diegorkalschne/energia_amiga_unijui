import 'package:flutter/material.dart';

import '../config/assets/assets_path.dart';

class CsBackgroundApp extends StatelessWidget {
  const CsBackgroundApp({
    required this.child,
    this.fit = BoxFit.cover,
    super.key,
  });

  final Widget child;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage(AssetsPath.BACKGROUND_WHITE),
          fit: fit,
        ),
      ),
      child: child,
    );
  }
}
