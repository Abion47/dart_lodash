Map<TKey, List<TValue>> groupBy<TKey, TValue>(
  Iterable<TValue> iterable,
  TKey Function(TValue) iteratee,
) {
  final map = <TKey, List<TValue>>{};

  TKey key;
  for (final elem in iterable) {
    key = iteratee(elem);
    if (map.containsKey(key)) {
      map[key]!.add(elem);
    } else {
      map[key] = [elem];
    }
  }

  return map;
}
