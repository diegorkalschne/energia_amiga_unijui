import 'package:flutter/material.dart';

import '../../config/assets/assets_path.dart';
import '../../config/routes/local_routes.dart';
import '../../widgets/animations/fade_transition_widget.dart';
import '../../widgets/cs_background_app.dart';
import '../../widgets/cs_circular_progress_indicador.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushNamedAndRemoveUntil(LocalRoutes.HOME, (_) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: CsBackgroundApp(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeTransitionWidget(
                child: Image.asset(
                  AssetsPath.ENERGIA_AMIGA_LOGO,
                  height: 250,
                  width: 350,
                ),
              ),
              const SizedBox(height: 50),
              const CsCircularProgressIndicador.dark(),
            ],
          ),
        ),
      ),
    );
  }
}
