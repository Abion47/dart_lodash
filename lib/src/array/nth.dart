T nth<T>(List<T> list, int n) {
  if (n >= list.length || n < -list.length) {
    throw RangeError.range(n, -list.length, list.length - 1);
  }
  if (n < 0) {
    n = list.length + n;
  }
  return list[n];
}
