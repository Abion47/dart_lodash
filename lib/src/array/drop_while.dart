List<T> dropWhile<T>(
  List<T> list,
  bool Function(T value, int index, List<T> list) predicate,
) {
  for (int i = 0; i < list.length; i++) {
    if (!predicate(list[i], i, list)) {
      return list.sublist(i);
    }
  }
  return [];
}
