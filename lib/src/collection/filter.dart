Iterable<T> filter<T>(
  Iterable<T> iterable,
  bool Function(T, int, Iterable<T>) predicate,
) sync* {
  int idx = 0;
  for (final elem in iterable) {
    if (predicate(elem, idx, iterable)) {
      yield elem;
    }
    idx++;
  }
}
