import 'package:traveller/app/database/table.dart';

final tables = [
  Table(name: 'travel', values: [
    "idInternal INTEGER PRIMARY KEY NOT NULL",
    "titulo TEXT",
    "dataInicio TEXT NOT NULL",
    "dataFim TEXT NOT NULL",
    "ativo BOOL",
    "itemsBag TEXT"
  ]),
  Table(name: 'rota', values: [
    "idInternal INTEGER PRIMARY KEY NOT NULL",
    "idTravel INTEGER NOT NULL",
    "data TEXT NOT NULL",
    "preco REAL",
    "endereco TEXT NOT NULL",
    "FOREIGN KEY (idTravel) REFERENCES travel(idInternal)"
  ]),
  Table(name: 'parada', values: [
    "idInternal INTEGER PRIMARY KEY NOT NULL",
    "idRota INTEGER NOT NULL",
    "FOREIGN KEY (idRota) REFERENCES rota(idInternal)"
  ]),
  Table(name: 'hospedagem', values: [
    "idInternal INTEGER PRIMARY KEY NOT NULL",
    "idRota INTEGER NOT NULL",
    "FOREIGN KEY (idRota) REFERENCES rota(idInternal)"
  ]),
];
