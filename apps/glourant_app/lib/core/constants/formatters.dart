String formatMoney(double value) {
  return '${value.toStringAsFixed(2).replaceAll('.', ',')} EUR';
}
