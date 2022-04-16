List<T> initial<T>(List<T> list) {
  if (list.length <= 1) return [];

  return list.sublist(0, list.length - 1);
}
