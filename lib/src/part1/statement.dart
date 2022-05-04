import 'dart:math';

import 'package:intl/intl.dart';

import 'data_model/invoice.dart';
import 'data_model/plays.dart';

void main() {
  final performancesSample = performances;
  final playsSample = plays;

  print(statement(performancesSample, playsSample));
}

String statement(Invoice invoice, Map<String, Play> plays) {
  var totalAmount = 0;
  var volumeCredits = 0;
  var result = 'Statement for ${invoice.customer}\n';
  final format = NumberFormat.currency(locale: 'en_US', decimalDigits: 2);

  for (var perf in invoice.performances) {
    final play = plays[perf.playID];
    var thisAmount = 0;

    switch (play?.type) {
      case 'tragedy':
        thisAmount = 40000;
        if (perf.audience > 30) {
          thisAmount += 1000 * (perf.audience - 30);
        }
        break;
      case 'comedy':
        thisAmount = 30000;
        if (perf.audience > 20) {
          thisAmount += 10000 + 500 * (perf.audience - 20);
        }
        thisAmount += 300 * perf.audience;
        break;

      default:
        throw Exception('unknown type: ${play?.type}');
    }

    // ボリューム特典のポイントを加算
    volumeCredits += max(perf.audience - 30, 0);
    // 喜劇の時は10人につき、さらにポイントを加算
    if ('comedy' == play?.type) volumeCredits += perf.audience ~/ 5;
    // 注文の内容を出力
    result +=
        '  ${play?.name}: ${format.format(thisAmount / 100)} (${perf.audience} seats)\n';
    totalAmount += thisAmount;
  }
  result += 'Amount owed is ${format.format(totalAmount / 100)}\n';
  result += 'You earned $volumeCredits credits\n';
  return result;
}
