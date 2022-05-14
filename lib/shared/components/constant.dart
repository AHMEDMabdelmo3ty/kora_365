// ignore_for_file: non_constant_identifier_names

import 'package:kora/shared/components/components.dart';
import 'package:kora/shared/network/local/cache_helper.dart';


void printFullText(String text) {
  final pattern = RegExp('.{1,800}');
  // ignore: avoid_print
  pattern.allMatches(text).forEach((element) => print(element.group(0)));
}


