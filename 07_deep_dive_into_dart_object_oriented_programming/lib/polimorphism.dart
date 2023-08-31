class Shape {
  void draw() {
    print('Drawing a shape');
  }
}

class Circle extends Shape {
  @override
  void draw() {
    print('Drawing a circle');
  }

  void paint() {
    print('paint a circle');
  }
}

class Square extends Shape {
  @override
  void draw() {
    print('Drawing a square');
  }
}

void main() {
  var shape1 =
      Circle(); //dengan melakukan ini, tupe data shape akan diasumsikan menjadi tipe data Circle()
  // Shape shape1 = Circle();
  Shape shape2 = Square();

  shape1.draw(); // Output: Drawing a circle
  shape1.paint(); // Output: Drawing a circle
  shape2.draw(); // Output: Drawing a square
}
