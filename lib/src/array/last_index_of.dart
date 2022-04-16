int lastIndexOf<T>(List<T> list, T value, [int fromIndex = -1]) {
  if (fromIndex < 0) {
    fromIndex = list.length + fromIndex;
  }
  return list.lastIndexOf(value, fromIndex);
}
