void main() {
  var obj1 = Monitor();
  var obj2 = Monitor.power(true);
}

class Monitor {
  // Field
  bool power;
  String color;

  // Constructor
  Monitor() {
    print('none data');
  }

  Monitor.power(bool power) {
    this.power = power;
    print(power);
  }
}
