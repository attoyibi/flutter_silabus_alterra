class Box<T> {
  T value;

  Box(this.value);

  T getValue() {
    return value;
  }

  void setValue(T newValue) {
    value = newValue;
  }
}

void main() {
  Box<int> intBox = Box<int>(42);
  Box<String> stringBox = Box<String>('Hello, Generics!');

  print(intBox.getValue()); // Output: 42
  print(stringBox.getValue()); // Output: Hello, Generics!

  intBox.setValue(99);
  print(intBox.getValue()); // Output: 99
}
