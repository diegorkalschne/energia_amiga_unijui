import '../models/pergunta_model.dart';

class PerguntasStore {
  final List<PerguntaModel> _perguntas = [
    // Classe Um
    PerguntaModel.classeUm('Já teve sensação de choque elétrico em algum sistema de sua casa?'),
    PerguntaModel.classeUm('Sente cheiro de queimado ao usar algum equipamento elétrico?'),
    PerguntaModel.classeUm('Escuta barulho ou vê faiscamento oriundo da eletricidade?'),
    PerguntaModel.classeUm('No DPS (Dispositivo de Proteção Contra Surtos) existe um elemento vermelho na parte inferior?'),
    // Classe Dois
    PerguntaModel.classeDois('Faz mais de 5 anos que um profissional verificou a instalação elétrica da residência?'),
    PerguntaModel.classeDois('Não há DPS instalado na entrada de energia elétrica?'),
    PerguntaModel.classeDois('Não há DR (Dispositivo Residual) na instalação?'),
    PerguntaModel.classeDois('Instalou mais equipamentos elétricos sem ampliar a capacidade dos circuitos elétricos/condutores?'),
    PerguntaModel.classeDois('Quando liga algum equipamento outros apresentam mau funcionamento?'),
    PerguntaModel.classeDois('Não há identificação dos circuitos elétricos próximo aos disjuntores?'),
    PerguntaModel.classeDois('A instalação está ligada a um único disjuntor?'),
    PerguntaModel.classeDois('Faz uso de T ou régua e eles apresentam aquecimento?'),
    // Classe Três
    PerguntaModel.classeTres('Usa adaptadores para compatibilizar o padrão da tomada com o padrão do plug do equipamento?'),
    PerguntaModel.classeTres('Usa T ou extensões?'),
    PerguntaModel.classeTres('Possui o projeto elétrico da instalação elétrica?'),
    PerguntaModel.classeTres('Equipamentos e sistemas de iluminação queimam frequentemente?'),
    PerguntaModel.classeTres('Há tomadas e/ou instalação elétrica, externa à residência, sem proteção para umidade?'),
    PerguntaModel.classeTres('O chuveiro e/ou torneira elétrica estão ligados à rede de alimentação através de plug/tomada e fita isolante?'),
  ];

  List<PerguntaModel> get perguntas => [..._perguntas];
}
