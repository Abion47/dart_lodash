List<T> pullAt<T>(List<T> list, List<int> indices) {
  for (int i = 0; i < indices.length; i++) {
    if (indices[i] < 0 || indices[i] >= list.length) {
      throw RangeError.range(indices[i], 0, list.length - 1, 'indices[$i]');
    }
  }

  final removed = <T>[];
  int offset = 0;
  for (int i = 0; i < indices.length; i++) {
    removed.add(list.removeAt(indices[i] - offset));
    offset++;
  }

  return removed;
}
