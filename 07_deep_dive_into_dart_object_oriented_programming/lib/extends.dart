// Antarmuka (interface) untuk alat musik
abstract class MusicalInstrument {
  void playSound();
  void tune();
}

// Kelas konkret yang mengimplementasikan antarmuka alat musik
class Piano extends MusicalInstrument {
  @override
  void playSound() {
    print('Piano is playing beautiful music');
  }

  @override
  void tune() {
    print('Tuning the piano');
  }

  void head() {}
}

class Violin implements MusicalInstrument {
  @override
  void playSound() {
    print('Violin is playing melodious notes');
  }

  @override
  void tune() {
    print('Tuning the violin');
  }
}

void main() {
  final piano = Piano();
  final violin = Violin();

  piano.playSound();
  piano.tune();

  violin.playSound();
  violin.tune();
}
