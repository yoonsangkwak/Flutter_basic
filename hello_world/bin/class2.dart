void main() {
  var obj = Mouse();
  obj.names = 'big mouse';
  print(obj.names);
}

class Mouse {
  // Field
  String name;
  int value;

  String get names {
    return name;
  }

  set names(String name) {
    this.name = name;
  }
}
