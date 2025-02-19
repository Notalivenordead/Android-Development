import 'dart:isolate';

class Account {
  double balance;

  Account(this.balance);

  void deposit(double amount) {
    balance += amount;
  }

  bool withdraw(double amount) {
    if (balance >= amount) {
      balance -= amount;
      return true;
    }
    return false;
  }

  double getBalance() {
    return balance;
  }
}

void transfer(Map<String, dynamic> data) {
  final SendPort sendPort = data['sendPort'];
  final int fromIndex = data['fromIndex'];
  final int toIndex = data['toIndex'];
  final double amount = (data['amount'] as num).toDouble();

  sendPort.send({
    'fromIndex': fromIndex,
    'toIndex': toIndex,
    'amount': amount,
  });
}

Future<void> task4() async {
  final List<Account> accounts = [
    Account(1000.0),
    Account(500.0),
    Account(750.0),
  ];

  final receivePort = ReceivePort();

  Future<void> performTransfers() async {
    for (int i = 0; i < 10; i++) {
      await Isolate.spawn(transfer, {
        'sendPort': receivePort.sendPort,
        'fromIndex': 0,
        'toIndex': 1,
        'amount': 50.0,
      });
      await Isolate.spawn(transfer, {
        'sendPort': receivePort.sendPort,
        'fromIndex': 1,
        'toIndex': 2,
        'amount': 30.0,
      });
      await Isolate.spawn(transfer, {
        'sendPort': receivePort.sendPort,
        'fromIndex': 2,
        'toIndex': 0,
        'amount': 20.0,
      });
    }
  }

  receivePort.listen((message) {
    final int fromIndex = message['fromIndex'];
    final int toIndex = message['toIndex'];
    final double amount = message['amount'];

    final Account from = accounts[fromIndex];
    final Account to = accounts[toIndex];

    if (from.withdraw(amount)) {
      to.deposit(amount);
      print(
          'Перевод $amount выполнен. Баланс отправителя: ${from.getBalance()}, баланс получателя: ${to.getBalance()}');
    } else {
      print('Перевод не выполнен: недостаточно средств на счете отправителя.');
    }
  });

  await performTransfers();

  await Future.delayed(Duration(seconds: 2));

  print('Итоговый баланс account1: ${accounts[0].getBalance()}');
  print('Итоговый баланс account2: ${accounts[1].getBalance()}');
  print('Итоговый баланс account3: ${accounts[2].getBalance()}');
}
