import 'package:traveller/app/models/rota.dart';

class Passagem extends Rota {
  static const String dataSaidaColumn = 'dataSaida';
  static const String portaEmbarqueColumn = 'portaEmbarque';
  static const String portaEmbarqueSaidaColumn = 'portaEmbarqueSaida';
  static const String assentoColumn = 'assento';
  static const String assentoSaidaColumn = 'assentoSaida';

  Passagem();
}
