List<T> pullAll<T>(List<T> list, List<T> values) {
  final ref = Set<T>.from(values);

  for (int i = 0; i < list.length; i++) {
    while (i < list.length && ref.contains(list[i])) {
      list.removeAt(i);
    }
  }

  return list;
}
