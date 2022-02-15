import 'package:traveller/app/database/table.dart';

final tables = [
  Table(name: 'travel', values: [
    "idInternal INTEGER PRIMARY KEY NOT NULL",
    "titulo TEXT",
    "dataInicio TEXT NOT NULL",
    "dataFim TEXT NOT NULL",
    "ativo BOOL",
  ]),
];
