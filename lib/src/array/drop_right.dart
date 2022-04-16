List<T> dropRight<T>(List<T> list, [int n = 1]) {
  if (n < 0) {
    throw ArgumentError.value(
      n,
      'n',
      'The value of n must be non-negative.',
    );
  }
  return list.sublist(0, list.length - (n > list.length ? list.length : n));
}
