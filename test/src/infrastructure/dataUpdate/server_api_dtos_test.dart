// ignore_for_file: avoid_escaping_inner_quotes

import 'dart:convert';
import 'dart:developer';

import 'package:bluefang/src/infrastructure/serverApi/server_api_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Converting an object to json should yield the same result as the raw JSON", () {
    final ServerApiDto serverApiDto = ServerApiDto.fromParameters(
      cid: "151",
      tableName: "<tableName>",
      rowCount: 2,
      columns: ["<column1>", "<column2>", "<column3>"],
      data: [
              ["<row1column1value>", "<row1column2value>", "<row1column3value>"],
              ["<row2column1value>", "<row2column2value>", "<row2column3value>"]
            ]
    );
    //Force batchNumber to be 1
    serverApiDto.batchNumber = 1;
    log(json.encode(serverApiDto.toJson()), name: "data_update_dtos_test.dart");

    expect(json.encode(serverApiDto.toJson()), "{\"cid\":\"151\",\"tableName\":\"<tableName>\",\"rowCount\":\"2\",\"columns\":[\"<column1>\",\"<column2>\",\"<column3>\"],\"batchNumber\":\"1\",\"data\":[[\"<row1column1value>\",\"<row1column2value>\",\"<row1column3value>\"],[\"<row2column1value>\",\"<row2column2value>\",\"<row2column3value>\"]]}");
  });

}
