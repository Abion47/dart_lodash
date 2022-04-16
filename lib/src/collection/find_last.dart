T? findLast<T>(
  Iterable<T> iterable,
  bool Function(T, int, Iterable<T>) predicate,
) {
  final list = iterable.toList();
  int idx = 0;
  for (final elem in list.reversed) {
    if (predicate(elem, idx, iterable)) return elem;
    idx++;
  }
  return null;
}
