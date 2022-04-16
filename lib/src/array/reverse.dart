List<T> reverse<T>(List<T> list) {
  T tmp;
  for (int i = 0; i < list.length ~/ 2; i++) {
    tmp = list[i];
    list[i] = list[list.length - 1 - i];
    list[list.length - 1 - i] = tmp;
  }

  return list;
}
