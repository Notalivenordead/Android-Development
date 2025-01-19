import java.util.Scanner

fun main() {
    val scanner = Scanner(System.`in`, "UTF-8")
    while (true)
    {
        println("Выберите задачу (1-20) или введите 0 для выхода:")
        if (scanner.hasNextInt())
        {
            val choice = scanner.nextInt()
            scanner.nextLine()
            when (choice)
            {
                0 ->
                {
                    println("Выход из программы.")
                    break
                }
                1 -> task1(scanner)
                2 -> task2(scanner)
                3 -> task3(scanner)
                4 -> task4(scanner)
                5 -> task5(scanner)
                6 -> task6(scanner)
                7 -> task7(scanner)
                8 -> task8(scanner)
                9 -> task9(scanner)
                10 -> task10(scanner)
                11 -> task11(scanner)
                12 -> task12(scanner)
                13 -> task13(scanner)
                14 -> task14(scanner)
                15 -> task15(scanner)
                16 -> task16(scanner)
                17 -> task17(scanner)
                18 -> task18(scanner)
                19 -> task19(scanner)
                20 -> task20(scanner)
                else -> println("Неверный выбор! Попробуйте снова.")
            }
        }
        else
        {
            println("Ошибка: введено не число.")
            scanner.nextLine()
        }
    }
    scanner.close()
}

// Задача 1: Класс "Человек"
fun task1(scanner: Scanner)
{
    println("Введите имя, возраст и пол (через пробел):")
    val name = scanner.next()
    val age = scanner.nextInt()
    val gender = scanner.next()
    val person = Person(name, age, gender)
    person.displayInfo()
    person.increaseAge()
    println("После увеличения возраста:")
    person.displayInfo()
    println("Введите новое имя:")
    val newName = scanner.next()
    person.changeName(newName)
    println("После изменения имени:")
    person.displayInfo()
}

// Задача 2: Наследование: Класс "Работник" и "Менеджер"
fun task2(scanner: Scanner)
{
    println("Введите имя, возраст, пол и зарплату работника (через пробел):")
    val input = reader.readLine().split(" ")
    try
    {
        val name = input[0]
        val age = input[1].toInt()
        val gender = input[2]
        val salary = input[3].replace(",", ".").toDouble()

        val worker = Worker(name, age, gender, salary)
        println("Работник создан:")
        worker.displayInfo()

        println("Введите количество подчиненных для менеджера:")
        val subordinatesCount = reader.readLine().toInt()

        val subordinates = List(subordinatesCount) {Worker("Подчиненный $it", 20 + it, "М", 1000.0 + it * 100)}
        val manager = Manager(name, age, gender, salary, subordinates)
        println("Менеджер создан:")
        manager.displayInfo()
    }
    catch (e: Exception)
        println("Ошибка: введены некорректные данные. Пожалуйста, введите данные в правильном формате. (зарплату через , а не .)")
}

// Задача 3: Полиморфизм: Животные
fun task3(scanner: Scanner)
{
    val animals: List<Animal> = listOf(Fish(), Bird(), Cow(), Dog(), Cat())
    println("Звуки животных:")
    for (animal in animals)
        animal.makeSound()
}

// Задача 4: Абстрактный класс "Транспорт"
fun task4(scanner: Scanner)
{
    val car = Car()
    val bike = Bike()
    println("Движение транспорта:")
    car.move()
    bike.move()
}

// Задача 5: Класс "Книга" и "Библиотека"
fun task5(scanner: Scanner)
{
    val library = Library()
    library.addBook(Book("1984", "Джордж Оруэлл", 1949))
    library.addBook(Book("Мастер и Маргарита", "Михаил Булгаков", 1967))
    println("Книги в библиотеке:")
    println("Поиск по автору 'Джордж Оруэлл':")
    println(library.findByAuthor("Джордж Оруэлл"))
    println("Поиск по году 1967:")
    println(library.findByYear(1967))
}

// Задача 6: Инкапсуляция: Банк
fun task6(scanner: Scanner)
{
    val account = BankAccount("123456", 1000.0)
    println("Баланс счета: ${account.getBalance()}")
    println("Введите сумму для пополнения:")
    val depositAmount = scanner.nextDouble()
    account.deposit(depositAmount)
    println("Баланс после пополнения: ${account.getBalance()}")
    println("Введите сумму для снятия:")
    val withdrawAmount = scanner.nextDouble()
    if (account.withdraw(withdrawAmount))
        println("Баланс после снятия: ${account.getBalance()}")
    else 
        println("Недостаточно средств.")
}

// Задача 7: Счетчик объектов
fun task7(scanner: Scanner)
{
    val counter1 = Counter()
    val counter2 = Counter()
    println("Количество созданных объектов: ${Counter.getCount()}")
}

// Задача 8: Площадь фигур
fun task8(scanner: Scanner)
{
    println("Введите радиус круга:")
    val radius = scanner.nextDouble()
    val circle = Circle(radius)
    println("Площадь круга: ${circle.getArea()}")
    println("Введите ширину и высоту прямоугольника (через пробел):")
    val width = scanner.nextDouble()
    val height = scanner.nextDouble()
    val rectangle = Rectangle(width, height)
    println("Площадь прямоугольника: ${rectangle.getArea()}")
}

// Задача 9: Наследование: Животные и их движения
fun task9(scanner: Scanner)
{
    val animals: List<Animal> = listOf(Fish(), Bird(), Cow(), Dog(), Cat())
    println("Движения животных:")
    for (animal in animals)
        animal.move()
}

// Задача 10: Работа с коллекциями: Университет
fun task10(scanner: Scanner)
{
    val university = University()
    university.addStudent(Student("Иван", "Группа 1", 4.5))
    university.addStudent(Student("Мария", "Группа 2", 3.8))
    println("Студенты, отсортированные по имени:")
    println(university.sortByName())
    println("Студенты с оценкой выше 4.0:")
    println(university.filterByGrade(4.0))
}

// Задача 11: Класс "Магазин"
fun task11(scanner: Scanner)
{
    val store = Store()
    store.addProduct(Product("Яблоко", 50.0, 10))
    store.addProduct(Product("Молоко", 80.0, 5))
    println("Введите название продукта для поиска:")
    val productName = scanner.next()
    val product = store.findProductByName(productName)
    if (product != null) 
        println("Найден продукт: ${product.name}, цена: ${product.price}, количество: ${product.quantity}")
    else 
        println("Продукт не найден.")
}

// Задача 12: Интерфейс "Платежная система"
fun task12(scanner: Scanner)
{
    val creditCard = CreditCard()
    val payPal = PayPal()
    println("Оплата через кредитную карту:")
    creditCard.pay(100.0)
    println("Оплата через PayPal:")
    payPal.pay(100.0)
}

// Задача 13: Генерация уникальных идентификаторов
fun task13(scanner: Scanner)
{
    println("Сгенерированный ID: ${UniqueID.generateID()}")
    println("Сгенерированный ID: ${UniqueID.generateID()}")
}

// Задача 14: Класс "Точка" и "Прямоугольник"
fun task14(scanner: Scanner)
{
    println("Введите координаты верхнего левого угла (x y):")
    val x1 = scanner.nextDouble()
    val y1 = scanner.nextDouble()
    println("Введите координаты нижнего правого угла (x y):")
    val x2 = scanner.nextDouble()
    val y2 = scanner.nextDouble()
    val rectangle = RectangleByPoints(Point(x1, y1), Point(x2, y2))
    println("Площадь прямоугольника: ${rectangle.getArea()}")
}

// Задача 15: Комплексные числа
fun task15(scanner: Scanner)
{
    println("Введите действительную и мнимую часть первого числа (через пробел):")
    val real1 = scanner.nextDouble()
    val imaginary1 = scanner.nextDouble()
    println("Введите действительную и мнимую часть второго числа (через пробел):")
    val real2 = scanner.nextDouble()
    val imaginary2 = scanner.nextDouble()
    val num1 = ComplexNumber(real1, imaginary1)
    val num2 = ComplexNumber(real2, imaginary2)
    println("Сумма: ${num1.add(num2)}")
    println("Разность: ${num1.subtract(num2)}")
    println("Произведение: ${num1.multiply(num2)}")
    println("Частное: ${num1.divide(num2)}")
}

// Задача 16: Перегрузка операторов: Матрица
fun task16(scanner: Scanner)
{
    val matrix1 = Matrix(arrayOf(doubleArrayOf(1.0, 2.0), doubleArrayOf(3.0, 4.0)))
    val matrix2 = Matrix(arrayOf(doubleArrayOf(5.0, 6.0), doubleArrayOf(7.0, 8.0)))
    println("Сумма матриц:")
    println(matrix1 + matrix2)
    println("Произведение матриц:")
    println(matrix1 * matrix2)
}

// Задача 17: Создание игры с использованием ООП
fun task17(scanner: Scanner)
{
    val game = Game()
    game.start()
}

// Задача 18: Автоматизированная система заказов
fun task18(scanner: Scanner)
{
    val orderSystem = OrderSystem()
    val customer = Customer("Иван")
    val order = Order(customer, listOf(Product("Книга", 500.0, 1), Product("Кофе", 300.0, 2)))
    orderSystem.addOrder(order)
    println("История заказов:")
    orderSystem.displayOrderHistory()
}

// Задача 19: Наследование: Электроника
fun task19(scanner: Scanner)
{
    val smartphone = Smartphone("Samsung")
    val laptop = Laptop("Lenovo")
    println("Смартфон:")
    smartphone.turnOn()
    smartphone.takePhoto()
    println("Ноутбук:")
    laptop.turnOn()
    laptop.openLid()
}

// Задача 20: Игра "Крестики-нолики"
fun task20(scanner: Scanner)
{
    val ticTacToe = TicTacToe()
    ticTacToe.start()
}

// Классы и функции для задач
open class Person(var name: String, var age: Int, var gender: String) {
    fun displayInfo() = println("Имя: $name, Возраст: $age, Пол: $gender")


    fun increaseAge()
    {
        age++
    }


    fun changeName(newName: String)
    {
        name = newName
    }
}

open class Worker(name: String, age: Int, gender: String, var salary: Double) : Person(name, age, gender)


class Manager(name: String, age: Int, gender: String, salary: Double, var subordinates: List<Worker>) : Worker(name, age, gender, salary)


interface Animal
{
    fun makeSound()
}


open class AnimalWithMove
{
    open fun move() = println("Животное двигается.")
}


class Dog : Animal, AnimalWithMove()
{
    override fun makeSound() = println("Гав!")

    override fun move() = println("Собака бегает.")
}


class Fish : Animal, AnimalWithMove()
{
    override fun makeSound() = println("...")

    override fun move() = println("Рыба плавает.")
}


class Bird : Animal, AnimalWithMove()
{
    override fun makeSound() = println("Чирик!")
    
    override fun move() = println("Птица летает.")
}


class Cow : Animal, AnimalWithMove()
{
    override fun makeSound() = println("Муу!")

    override fun move() = println("Корова ходит.")
}


class Cat : Animal, AnimalWithMove()
{
    override fun makeSound() = println("Мяяу!")

    override fun move() = println("Кошка бродит.")
}


abstract class Transport
{
    abstract fun move()
}


class Car : Transport()
{
    override fun move() = println("Машина едет по дороге.")
}


class Bike : Transport()
{
    override fun move() = println("Велосипед едет по тропинке.")
}


class Book(val title: String, val author: String, val year: Int)


class Library
{
    private val books = mutableListOf<Book>()

    fun addBook(book: Book) = books.add(book)
    

    fun findByAuthor(author: String): List<Book> = books.filter { it.author == author }
        

    fun findByYear(year: Int): List<Book> = books.filter { it.year == year }
}

class BankAccount(private val accountNumber: String, private var balance: Double)
{
    fun deposit(amount: Double)
    {
        if (amount > 0) 
            balance += amount
    }

    fun withdraw(amount: Double): Boolean
    {
        if (amount > 0 && balance >= amount)
        {
            balance -= amount
            return true
        }
        return false
    }

    fun getBalance(): Double = balance
}

class Counter
{
    companion object
    {
        private var count: Int = 0

        fun getCount(): Int = count
    }

    init
    {
        count++
    }
}

abstract class Shape
{
    abstract fun getArea(): Double
}

class Circle(private val radius: Double) : Shape()
{
    override fun getArea(): Double = Math.PI * radius * radius
}

class Rectangle(private val width: Double, private val height: Double) : Shape()
{
    override fun getArea(): Double = width * height
}


class Student(val name: String, val group: String, val grade: Double)

class University
{
    private val students = mutableListOf<Student>()

    fun addStudent(student: Student) = students.add(student)
    

    fun sortByName(): List<Student> = students.sortedBy { it.name }


    fun filterByGrade(minGrade: Double): List<Student> = students.filter { it.grade >= minGrade }
}

class Product(val name: String, val price: Double, val quantity: Int)

class Store
{
    private val products = mutableListOf<Product>()

    fun addProduct(product: Product) = products.add(product)


    fun removeProduct(productName: String): Boolean = products.removeIf { it.name == productName }
    

    fun findProductByName(productName: String): Product? = products.find { it.name == productName }
}

interface PaymentSystem
{
    fun pay(amount: Double): Boolean
    fun refund(amount: Double): Boolean
}

class CreditCard : PaymentSystem
{
    override fun pay(amount: Double): Boolean
    {
        println("Оплата $amount с помощью кредитной карты.")
        return true
    }

    override fun refund(amount: Double): Boolean
    {
        println("Возврат $amount на кредитную карту.")
        return true
    }
}

class PayPal : PaymentSystem
{
    override fun pay(amount: Double): Boolean
    {
        println("Оплата $amount через PayPal.")
        return true
    }

    override fun refund(amount: Double): Boolean
    {
        println("Возврат $amount через PayPal.")
        return true
    }
}

class UniqueID
{
    companion object
    {
        private var idCounter: Int = 0

        fun generateID(): Int = ++idCounter
    }
}

class Point(val x: Double, val y: Double)

class RectangleByPoints(val topLeft: Point, val bottomRight: Point)
{
    fun getArea(): Double
    {
        val width = bottomRight.x - topLeft.x
        val height = topLeft.y - bottomRight.y
        return width * height
    }
}

class ComplexNumber(val real: Double, val imaginary: Double) {
    fun add(other: ComplexNumber): ComplexNumber = ComplexNumber(real + other.real, imaginary + other.imaginary)


    fun subtract(other: ComplexNumber): ComplexNumber = ComplexNumber(real - other.real, imaginary - other.imaginary)
    

    fun multiply(other: ComplexNumber): ComplexNumber
    {
        return ComplexNumber(
            real * other.real - imaginary * other.imaginary,
            real * other.imaginary + imaginary * other.real
        )
    }

    fun divide(other: ComplexNumber): ComplexNumber
    {
        val denominator = other.real * other.real + other.imaginary * other.imaginary
        return ComplexNumber(
            (real * other.real + imaginary * other.imaginary) / denominator,
            (imaginary * other.real - real * other.imaginary) / denominator
        )
    }
}

class Matrix(private val data: Array<DoubleArray>)
{
    operator fun plus(other: Matrix): Matrix
    {
        val result = Array(data.size) { DoubleArray(data[0].size) }
        for (i in data.indices) 
            for (j in data[0].indices) 
                result[i][j] = data[i][j] + other.data[i][j]
        return Matrix(result)
    }

    operator fun times(other: Matrix): Matrix
    {
        val result = Array(data.size) { DoubleArray(other.data[0].size) }
        for (i in data.indices) 
            for (j in other.data[0].indices) 
                for (k in data[0].indices) 
                    result[i][j] += data[i][k] * other.data[k][j]
        return Matrix(result)
    }
}

class Game
{
    private val board = Array(3) { CharArray(3) { ' ' } }
    private var currentPlayer = 'X'

    fun start()
    {
        while (true) {
            printBoard()
            println("Ход игрока $currentPlayer")
            val (row, col) = readMove()
            if (board[row][col] == ' ')
            {
                board[row][col] = currentPlayer
                if (checkWin())
                {
                    println("Игрок $currentPlayer победил!")
                    break
                }
                if (board.all { row -> row.all { cell -> cell != ' ' } })
                {
                    println("Ничья!")
                    break
                }
                currentPlayer = if (currentPlayer == 'X') 'O' else 'X'
            }
            else
                println("Клетка уже занята!")
        }
    }

    private fun printBoard()
    {
        for (row in board)
        {
            println(row.joinToString(" | "))
            println("---------")
        }
    }

    private fun readMove(): Pair<Int, Int>
    {
        print("Введите строку и столбец (0-2): ")
        val input = readLine()!!.split(" ")
        return Pair(input[0].toInt(), input[1].toInt())
    }

    private fun checkWin(): Boolean {
        for (i in 0..2)
        {
            if (board[i][0] == currentPlayer && board[i][1] == currentPlayer && board[i][2] == currentPlayer) return true
            if (board[0][i] == currentPlayer && board[1][i] == currentPlayer && board[2][i] == currentPlayer) return true
        }
        if (board[0][0] == currentPlayer && board[1][1] == currentPlayer && board[2][2] == currentPlayer) return true
        if (board[0][2] == currentPlayer && board[1][1] == currentPlayer && board[2][0] == currentPlayer) return true
        return false
    }
}


class Order(val customer: Customer, val products: List<Product>)
{
    fun getTotalCost(): Double = products.sumOf { it.price }
}


class Customer(val name: String)


class OrderSystem {
    private val orders = mutableListOf<Order>()

    fun addOrder(order: Order) = orders.add(order)

    fun displayOrderHistory()
    {
        for (order in orders)
        {
            println("Заказ для ${order.customer.name}:")
            for (product in order.products)
                println("${product.name} - ${product.price}")
            println("Общая стоимость: ${order.getTotalCost()}")
        }
    }
}

open class Device(val brand: String)
{
    fun turnOn() = println("Устройство включено.")

    fun turnOff() = println("Устройство выключено.")
}

class Smartphone(brand: String) : Device(brand)
{
    fun takePhoto() = println("Фотография сделана.")
}

class Laptop(brand: String) : Device(brand)
{
    fun openLid() = println("Крышка ноутбука открыта.")
}

class TicTacToe
{
    private val board = Array(3) { CharArray(3) { ' ' } }
    private var currentPlayer = 'X'

    fun start() {
        while (true)
        {
            printBoard()
            println("Ход игрока $currentPlayer")
            val (row, col) = readMove()
            if (board[row][col] == ' ')
            {
                board[row][col] = currentPlayer
                if (checkWin())
                {
                    println("Игрок $currentPlayer победил!")
                    break
                }
                if (board.all { row -> row.all { cell -> cell != ' ' } })
                {
                    println("Ничья!")
                    break
                }
                currentPlayer = if (currentPlayer == 'X') 'O' else 'X'
            }
            else
                println("Клетка уже занята!")
        }
    }

    private fun printBoard()
    {
        for (row in board)
        {
            println(row.joinToString(" | "))
            println("---------")
        }
    }

    private fun readMove(): Pair<Int, Int>
    {
        print("Введите строку и столбец (0-2): ")
        val input = readLine()!!.split(" ")
        return Pair(input[0].toInt(), input[1].toInt())
    }

    private fun checkWin(): Boolean
    {
        for (i in 0..2)
        {
            if (board[i][0] == currentPlayer && board[i][1] == currentPlayer && board[i][2] == currentPlayer) return true
            if (board[0][i] == currentPlayer && board[1][i] == currentPlayer && board[2][i] == currentPlayer) return true
        }
        if (board[0][0] == currentPlayer && board[1][1] == currentPlayer && board[2][2] == currentPlayer) return true
        if (board[0][2] == currentPlayer && board[1][1] == currentPlayer && board[2][0] == currentPlayer) return true
        return false
    }
}
