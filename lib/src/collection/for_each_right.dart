Iterable<T> forEachRight<T>(
  Iterable<T> collection,
  bool Function(T, int, Iterable<T>) iteratee,
) {
  final iter = collection.toList().reversed;
  int idx = iter.length - 1;

  for (final elem in iter) {
    if (!iteratee(elem, idx, collection)) break;
    idx--;
  }

  return collection;
}
