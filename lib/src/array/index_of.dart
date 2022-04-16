int indexOf<T>(List<T> list, T value, [int fromIndex = 0]) {
  if (fromIndex < 0) {
    fromIndex = list.length + fromIndex;
  }
  return list.indexOf(value, fromIndex);
}
