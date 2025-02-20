import 'dart:io';
import 'tasks/T1_counter.dart' as task1;
import 'tasks/T2_safe_list.dart' as task2;
import 'tasks/T3_pool.dart' as task3;
import 'tasks/T4_bank.dart' as task4;
import 'tasks/T5_cyclic_barrier.dart' as task5;
import 'tasks/T6_semaphore.dart' as task6;
import 'tasks/T7_callable_future.dart' as task7;
import 'tasks/T8_blocking_queue.dart' as task8;
import 'tasks/T9_Qsorting.dart' as task9;
import 'tasks/T10_philosophers.dart' as task10;
import 'tasks/T11_matrix.dart' as task11;
import 'tasks/T12_timer.dart' as task12;

void main() async {
  printMenu();
  while (true) {
    final input = stdin.readLineSync()?.trim().toLowerCase();

    if (input == '0' || input == 'exit') {
      print('Exiting the program. Goodbye!');
      break;
    }

    final taskNumber = int.tryParse(input!);

    if (taskNumber == null || taskNumber < 1 || taskNumber > 12) {
      print(
          'Invalid input. Please enter a number between 1 and 12, or type "0" or "exit" to quit.');
      continue;
    }

    try {
      switch (taskNumber) {
        case 1:
          print('\n--- Task 1: Counter ---');
          await task1.task1();
          break;
        case 2:
          print('\n--- Task 2: Thread-Safe List ---');
          await task2.task2();
          break;
        case 3:
          print('\n--- Task 3: Thread Pool ---');
          await task3.task3();
          break;
        case 4:
          print('\n--- Task 4: Bank Transfer ---');
          await task4.task4();
          break;
        case 5:
          print('\n--- Task 5: Cyclic Barrier ---');
          await task5.task5();
          break;
        case 6:
          print('\n--- Task 6: Semaphore ---');
          await task6.task6();
          break;
        case 7:
          print('\n--- Task 7: Callable and Future ---');
          await task7.task7();
          break;
        case 8:
          print('\n--- Task 8: Blocking Queue ---');
          await task8.task8();
          break;
        case 9:
          print('\n--- Task 9: Parallel Sorting ---');
          await task9.task9();
          break;
        case 10:
          print('\n--- Task 10: Dining Philosophers ---');
          await task10.task10();
          break;
        case 11:
          print('\n--- Task 11: Matrix Multiplication ---');
          await task11.task11();
          break;
        case 12:
          print('\n--- Task 12: Timer ---');
          await task12.task12();
          break;
      }
    } catch (e) {
      print('An error occurred while running the task: $e');
    }

    print('\nPress Enter to continue...');
    stdin.readLineSync();
  }
}

void printMenu() {
  print('''
Welcome to the Multithreading Tasks Program!
Please select a task by entering its number:

1. Counter
2. Thread-Safe List
3. Thread Pool
4. Bank Transfer
5. Cyclic Barrier
6. Semaphore
7. Callable and Future
8. Blocking Queue
9. Parallel Sorting
10. Dining Philosophers (endless)
11. Matrix Multiplication
12. Timer

Enter "0" or "exit" to quit.
''');
}
