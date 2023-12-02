extension StringX on String {
  String limit(int length) {
    if (length < 0) {
      throw ArgumentError.value(length, 'length', 'Length cannot be negative');
    }
    if (length >= this.length) {
      return this;
    }
    return substring(0, length);
  }
}