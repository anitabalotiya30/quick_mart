extension MyTextField on String {
  bool get isValid => trim().isNotEmpty;

  int get toInt => int.tryParse(this) ?? 0;
}
