import 'dart:convert';

import 'package:logger/logger.dart';

final logger = Logger(
    printer: PrettyPrinter(
  methodCount: 0, //number of method calls to be displayed
  errorMethodCount: 5, // number of method calls if stacktrace is provided
  lineLength: 20, // width of the output
  colors: true,
  printEmojis: true,
  printTime: false,
  //stackTraceBeginIndex:  0, // first stacktrace line to be displayed
));

void prettyPrinterLog(dynamic data) {
  const encoder = JsonEncoder.withIndent('  ');
  final prettyprint = encoder.convert(data);
  print(prettyprint);
}
