extension MyIterable<T> on List<T>? {
  T? get firstOrNull => this == null
      ? null
      : this!.isEmpty
          ? null
          : this!.first;

  T? firstWhereOrNull(bool Function(T element) test) {
    if (this == null) {
      return null;
    } else {
      final list = this!.where(test);
      return list.isEmpty ? null : list.first;
    }
  }
}

extension MyDateTime on DateTime {
  String toStringBR({required String format}) {
    String stringDate = "";
    if (format == 'date' || format == 'datetime') {
      switch (weekday) {
        case DateTime.sunday:
          stringDate = stringDate + "Domingo";
          break;
        case DateTime.monday:
          stringDate = stringDate + "Segunda-feira";
          break;
        case DateTime.tuesday:
          stringDate = stringDate + "Terça-feira";
          break;
        case DateTime.wednesday:
          stringDate = stringDate + "Quarta-feira";
          break;
        case DateTime.thursday:
          stringDate = stringDate + "Quinta-feira";
          break;
        case DateTime.friday:
          stringDate = stringDate + "Sexta-feira";
          break;
        case DateTime.saturday:
          stringDate = stringDate + "Sábado";
          break;
        default:
      }
      stringDate = stringDate + ", " + day.toString() + " de ";
      switch (month) {
        case DateTime.january:
          stringDate = stringDate + "Janeiro";
          break;
        case DateTime.february:
          stringDate = stringDate + "Fevereiro";
          break;
        case DateTime.march:
          stringDate = stringDate + "Março";
          break;
        case DateTime.april:
          stringDate = stringDate + "Abril";
          break;
        case DateTime.may:
          stringDate = stringDate + "Maio";
          break;
        case DateTime.june:
          stringDate = stringDate + "Junho";
          break;
        case DateTime.july:
          stringDate = stringDate + "Julho";
          break;
        case DateTime.august:
          stringDate = stringDate + "Agosto";
          break;
        case DateTime.september:
          stringDate = stringDate + "Setembro";
          break;
        case DateTime.october:
          stringDate = stringDate + "Outubro";
          break;
        case DateTime.november:
          stringDate = stringDate + "Novembro";
          break;
        case DateTime.december:
          stringDate = stringDate + "Dezembro";
          break;
      }
      stringDate = stringDate + " de " + year.toString();
    }
    if (format == 'datetime') {
      stringDate = stringDate + ", as ";
    }
    if (format == 'time' || format == 'datetime') {
      String horaString = (hour < 10 ? '0' : '') + hour.toString();
      String minuteString = (minute < 10 ? '0' : '') + minute.toString();

      stringDate = stringDate + horaString + ":" + minuteString;
    }
    return stringDate;
  }
}
