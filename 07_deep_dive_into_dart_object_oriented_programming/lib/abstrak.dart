// Abstract class sebagai blueprint karakter
abstract class Character {
  String name;
  int health;

  Character(this.name, this.health);

  void attack(Character target); // Method abstract
  void takeDamage(int damage) {
    health -= damage;
    print('$name took $damage damage. Remaining health: $health');
  }

  void heal(int damage) {
    health += damage;
    print('$name took $damage damage. Remaining health: $health');
  }
}

// Subclass untuk karakter ksatria
class Knight extends Character {
  Knight(String name, int health) : super(name, health);

  void attack(Character target) {
    print('$name swings a sword at ${target.name}!');
    target.takeDamage(20);
  }
}

// Subclass untuk karakter penyihir
class Wizard extends Character {
  Wizard(String name, int health) : super(name, health);

  @override
  void attack(Character target) {
    print('$name casts a spell on ${target.name}!');
    target.takeDamage(15);
  }
}

void main() {
  final knight = Knight('Sir Gallant', 100);
  final wizard = Wizard('Merlin', 80);

  knight.attack(wizard); // Ksatria menyerang penyihir
  wizard.attack(knight); // Penyihir menyerang ksatria
}
