import '../config/assets/assets_path.dart';
import '../models/dicas_model.dart';

class DicasStores {
  static final List<DicaModel> eficienciaEnergetica = [
    DicaModel(
      title: 'Quero Consumir Menos Energia',
      pdfAsset: AssetsPath.PDF_CONSUMO,
      videoUrl: 'https://www.youtube.com/watch?v=skDyNGDLgco',
    ),
  ];

  static final List<DicaModel> acidentes = [
    DicaModel(
      title: 'Evite Acidentes com a Eletricidade',
      pdfAsset: AssetsPath.PDF_ACIDENTES,
      videoUrl: 'https://www.youtube.com/watch?v=s35gOEN3WCw',
    ),
    DicaModel(
      title: 'Logística Reversa e Descarte de Equipamentos',
      pdfAsset: AssetsPath.PDF_RESIDUOS,
      videoUrl: 'https://www.youtube.com/watch?v=xv1eAHe5qG4',
    ),
  ];
}
