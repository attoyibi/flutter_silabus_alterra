class Product {
  String name;
  int price;

  Product(this.name, this.price);
}

class ShoppingCart {
  List<Product> items = [];

  void addItem(Product product) {
    items.add(product);
    print('Produk "${product.name}" ditambahkan ke keranjang.');
  }

  int calculateTotal() {
    int total = 0;
    for (var item in items) {
      total += item.price;
    }
    return total;
  }
}

void main() {
  var cart = ShoppingCart();

  var product1 = Product('Pensil', 1000);
  var product2 = Product('Buku', 5000);
  var product3 = Product('Pensil Warna', 3000);

  cart.addItem(product1);
  cart.addItem(product2);
  cart.addItem(product3);

  print('Total harga belanjaan: ${cart.calculateTotal()}');
}
