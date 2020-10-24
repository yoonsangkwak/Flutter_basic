void main() {
  var obj1 = Mouse();
  var obj2 = Mouse.name('big mouse');
  // obj.leftClick();
}

class Mouse {
  // Field
  String name = 'none';
  int value;

  // Constructor
  Mouse() {
    print('none data');
  }

  Mouse.name(String name) {
    print(name);
  }

  // function(method)
  leftClick() {
    print('Left Click');
  }

  rightClick() {
    print('Right Click');
  }
}
