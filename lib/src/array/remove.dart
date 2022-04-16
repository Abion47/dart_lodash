List<T> remove<T>(List<T> list, bool Function(T, int, List<T>) predicate) {
  final removed = <T>[];
  int offset = 0;

  for (int i = 0; i < list.length; i++) {
    if (predicate(list[i], i + offset, list)) {
      removed.add(list.removeAt(i));
      i--;
      offset++;
    }
  }

  return removed;
}
