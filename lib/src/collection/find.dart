T? find<T>(Iterable<T> iterable, bool Function(T, int, Iterable<T>) predicate) {
  int idx = 0;
  for (final elem in iterable) {
    if (predicate(elem, idx, iterable)) return elem;
    idx++;
  }
  return null;
}
