List<T> pull<T>(List<T> list, T value) {
  while (list.remove(value)) {}
  return list;
}
