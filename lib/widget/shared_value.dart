import 'package:another_flushbar/flushbar.dart';
import 'package:aplikasi_mbanking/style/color/style_color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void showCustomSnackbar(BuildContext context, String message) {
  Flushbar(
    message: message,
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: redColor,
    duration: const Duration(seconds: 2),
  ).show(context);
}

String formatCurrency(
  num number, {
  String symbol = 'RP ',
}) {
  return NumberFormat.currency(
    locale: 'id',
    symbol: symbol,
    decimalDigits: 0,
  ).format(number);
}
