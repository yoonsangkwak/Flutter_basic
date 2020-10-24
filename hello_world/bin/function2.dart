int func(int a, int b, int c) {
  return a - b - c;
}

bool func2(int a, int b) {
  return a > b;
}

void main() {
  int x = 7;
  int y = 5;
  int z = 2;

  print(func(x, y, z));

  print(func2(x, y));
}
