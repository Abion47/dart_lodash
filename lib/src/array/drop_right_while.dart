List<T> dropRightWhile<T>(
  List<T> list,
  bool Function(T value, int index, List<T> list) predicate,
) {
  for (int i = list.length - 1; i >= 0; i--) {
    if (!predicate(list[i], i, list)) {
      return list.sublist(0, i + 1);
    }
  }
  return [];
}
