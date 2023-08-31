import 'dart:io';

class TaskManager {
  List<String> tasks = [];

  void addTask(String task) {
    tasks.add(task);
    print('Tugas "$task" telah ditambahkan.');
  }

  void displayTasks() {
    if (tasks.isEmpty) {
      print('Belum ada tugas.');
    } else {
      print('Daftar tugas:');
      for (var i = 0; i < tasks.length; i++) {
        print('${i + 1}. ${tasks[i]}');
      }
    }
  }

  void completeTask(int taskIndex) {
    if (taskIndex >= 0 && taskIndex < tasks.length) {
      print('Tugas "${tasks[taskIndex]}" telah selesai.');
      tasks.removeAt(taskIndex);
    } else {
      print('Indeks tugas tidak valid.');
    }
  }

  int getRemainingTasks() {
    return tasks.length;
  }
}

void main() {
  var taskManager = TaskManager();

  while (true) {
    print('\nPilih operasi:');
    print('1. Tambah Tugas');
    print('2. Tampilkan Daftar Tugas');
    print('3. Tandai Tugas Selesai');
    print('4. Jumlah Tugas yang Harus Dikerjakan');
    print('5. Keluar');

    var choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        print('Masukkan nama tugas:');
        var taskName = stdin.readLineSync()!;
        taskManager.addTask(taskName);
        break;
      case 2:
        taskManager.displayTasks();
        break;
      case 3:
        print('Masukkan indeks tugas yang selesai:');
        var taskIndex = int.parse(stdin.readLineSync()!) - 1;
        taskManager.completeTask(taskIndex);
        break;
      case 4:
        var remainingTasks = taskManager.getRemainingTasks();
        print('Jumlah tugas yang harus dikerjakan: $remainingTasks');
        break;
      case 5:
        print('Terima kasih!');
        return;
      default:
        print('Pilihan tidak valid.');
    }
  }
}
