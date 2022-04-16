Iterable<T> forEach<T>(
  Iterable<T> collection,
  bool Function(T, int, Iterable<T>) iteratee,
) {
  int idx = 0;
  for (final elem in collection) {
    if (!iteratee(elem, idx, collection)) break;
    idx++;
  }

  return collection;
}
