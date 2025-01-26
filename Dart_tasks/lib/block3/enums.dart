library enums;

// Enum для сезонов (Задача 4)
enum Season { WINTER, SPRING, SUMMER, AUTUMN }

String getSeasonName(Season season) => const {
      Season.WINTER: "Зима",
      Season.SPRING: "Весна",
      Season.SUMMER: "Лето",
      Season.AUTUMN: "Осень",
    }[season]!;

// Enum и класс для статусов заказа (Задача 3)
enum OrderStatus { NEW, IN_PROGRESS, DELIVERED, CANCELLED }

class Order {
  OrderStatus _status = OrderStatus.NEW;

  OrderStatus get status => _status;

  void updateStatus(OrderStatus newStatus) {
    if (_status == OrderStatus.DELIVERED &&
        newStatus == OrderStatus.CANCELLED) {
      throw ArgumentError("Нельзя отменить доставленный заказ!");
    }
    _status = newStatus;
    print("Статус заказа изменен на: ${_status.toString().split('.').last}");
  }
}
