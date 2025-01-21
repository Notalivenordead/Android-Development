import java.util.Scanner;
import java.util.function.Consumer;

public class basics_java{

    private static final Consumer<String> printer = x -> System.out.println(x);

    public static void printMessage(String message)
    {
        printer.accept(message);
    }

    // Задача 1: чет/нечет
    public static void EvenOdd(Scanner scanner)
    {
        printMessage("Введите целое число: ");
        if (scanner.hasNextInt())
        {
            int n = scanner.nextInt();
            scanner.nextLine();
            if (n % 2 == 0)
                printMessage("Число " + n + " является четным.");
            else
                printMessage("Число " + n + " является нечетным.");
        }
        else
        {
            printMessage("Ошибка: введено не целое число.");
            scanner.nextLine();
        }
    }

    // Задача 2: min(a, b, c)
    public static void findMinOfThree(Scanner scanner)
    {
        printMessage("Введите три целых числа: ");
        if (scanner.hasNextInt())
        {
            int a = scanner.nextInt();
            int b = scanner.nextInt();
            int c = scanner.nextInt();
            scanner.nextLine();
            printMessage("Минимальное число: " + Math.min(a, Math.min(b, c)));
        }
        else
        {
            printMessage("Ошибка: введено не целое число.");
            scanner.nextLine(); 
        }
    }

    // Задача 3: mult table
    public static void printMultiplicationTable() {
        StringBuilder header = new StringBuilder("    ");
        for (int i = 1; i <= 10; i++) 
            header.append(String.format("%4d", i));
        printMessage(header.toString());
    
        
        for (int i = 1; i <= 10; i++) {
            StringBuilder row = new StringBuilder(String.format("%4d", i));
            for (int j = 1; j <= 10; j++)
                row.append(String.format("%4d", i * j)); 
            printMessage(row.toString());
        }
    }

    // Задача 4: Sum [1, n]
    public static void sumFromOneToN(Scanner scanner)
    {
        printMessage("Введите целое число N: ");
        if (scanner.hasNextInt())
        {
            int n = scanner.nextInt();
            scanner.nextLine();
            int sum = 0;
            for (int i = 1; i <= n; i++)
                sum += i;
            printMessage("Сумма чисел от 1 до " + n + ": " + sum);
        }
        else
        {
            printMessage("Ошибка: введено не целое число.");
            scanner.nextLine();
        }
    }

    // Задача 5: Fib's nums
    public static void printFibonacci(Scanner scanner)
    {
        printMessage("Введите целое число N: ");
        if (scanner.hasNextInt())
        {
            int n = scanner.nextInt();
            scanner.nextLine();
            int a = 0, b = 1;
            printMessage("Первые " + n + " чисел Фибоначчи: ");
            for (int i = 1; i <= n; i++)
            {
                printMessage(a + " ");
                int sum = a + b;
                a = b;
                b = sum;
            }
            printMessage("\n");
        }
        else
        {
            printMessage("Ошибка: введено не целое число.");
            scanner.nextLine();
        }
    }

    // Задача 6: Isprime
    public static void Isprime(Scanner scanner)
    {
        printMessage("Введите целое число: ");
        if (scanner.hasNextInt())
        {
            int number = scanner.nextInt();
            scanner.nextLine();
            boolean isPrime = true;
            if (number <= 1)
                isPrime = false;
            else
                for (int i = 2; i <= Math.sqrt(number); i++)
                    if (number % i == 0)
                    {
                        isPrime = false;
                        break;
                    }

            if (isPrime)
                printMessage("Число " + number + " простое.");
            else
                printMessage("Число " + number + " не является простым.");
        }
        else
        {
            printMessage("Ошибка: введено не целое число.");
            scanner.nextLine();
        }
    }

    // Задача 7: reved nums
    public static void printReverseNumbers(Scanner scanner)
    {
        printMessage("Введите целое число N: ");
        if (scanner.hasNextInt()) {
            int n = scanner.nextInt();
            scanner.nextLine();
            printMessage("Числа от " + n + " до 1: ");
            for (int i = n; i >= 1; i--)
                printMessage(i + " ");
            printMessage("\n");
        }
        else
        {
            printMessage("Ошибка: введено не целое число.");
            scanner.nextLine();
        }
    }

    // Задача 8: summed evens
    public static void sumOfEvenNumbers(Scanner scanner)
    {
        printMessage("Введите два целых числа A и B: ");
        if (scanner.hasNextInt()) {
            int a = scanner.nextInt();
            int b = scanner.nextInt();
            scanner.nextLine();
            int sum = 0;
            for (int i = a; i <= b; i++)
                if (i % 2 == 0)
                    sum += i;
            printMessage("Сумма четных чисел от " + a + " до " + b + ": " + sum);
        }
        else
        {
            printMessage("Ошибка: введено не целое число.");
            scanner.nextLine();
        }
    }

    // Задача 9: reved str
    public static void reverseString(Scanner scanner)
    {
        printMessage("Введите строку: ");
        String str = scanner.nextLine();
        String reversed = new StringBuilder(str).reverse().toString();
        printMessage("Строка в обратном порядке: " + reversed);
    }

    // Задача 10: digits in nums
    public static void countDigits(Scanner scanner)
    {
        printMessage("Введите целое число: ");
        if (scanner.hasNextInt())
        {
            int number = scanner.nextInt();
            scanner.nextLine();
            int count = 0;
            while (number != 0)
            {
                number /= 10;
                count++;
            }
            printMessage("Количество цифр: " + count);
        }
        else
        {
            printMessage("Ошибка: введено не целое число.");
            scanner.nextLine();
        }
    }

    // Задача 11: factorial(n)
    public static void calculateFactorial(Scanner scanner)
    {
        printMessage("Введите целое число N: ");
        if (scanner.hasNextInt())
        {
            int n = scanner.nextInt();
            scanner.nextLine();
            long factorial = 1;
            for (int i = 1; i <= n; i++)
                factorial *= i;
            printMessage("Факториал " + n + ": " + factorial);
        }
        else
        {
            printMessage("Ошибка: введено не целое число.");
            scanner.nextLine();
        }
    }

    // Задача 12: di-sum
    public static void sumOfDigits(Scanner scanner)
    {
        printMessage("Введите целое число: ");
        if (scanner.hasNextInt())
        {
            int number = scanner.nextInt();
            scanner.nextLine();
            int sum = 0;
            while (number != 0)
            {
                sum += number % 10;
                number /= 10;
            }
            printMessage("Сумма цифр: " + sum);
        } else
        {
            printMessage("Ошибка: введено не целое число.");
            scanner.nextLine();
        }
    }

    // Задача 13: palindrom
    public static void checkPalindrome(Scanner scanner) {
        printMessage("Введите строку: ");
        String str = scanner.nextLine();
        String reversed = new StringBuilder(str).reverse().toString();
        if (str.equals(reversed))
            printMessage("Строка является палиндромом.");
        else
            printMessage("Строка не является палиндромом.");
    }

    // Задача 14: max(arr)
    public static void findMaxInArray(Scanner scanner)
    {
        printMessage("Введите размер массива: ");
        if (scanner.hasNextInt())
        {
            int size = scanner.nextInt();
            scanner.nextLine();
            int[] arr = new int[size];
            printMessage("Введите элементы массива: ");
            for (int i = 0; i < size; i++)
            {
                if (scanner.hasNextInt())
                    arr[i] = scanner.nextInt();
                else
                {
                    printMessage("Ошибка: введено не целое число.");
                    scanner.nextLine();
                    return;
                }
            }
            scanner.nextLine();
            int max = arr[0];
            for (int num : arr)
                if (num > max)
                    max = num;
            printMessage("Максимальное число в массиве: " + max);
        }
        else
        {
            printMessage("Ошибка: введено не целое число.");
            scanner.nextLine();
        }
    }

    // Задача 15: sum(arr)
    public static void sumOfArrayElements(Scanner scanner)
    {
        printMessage("Введите размер массива: ");
        if (scanner.hasNextInt())
        {
            int size = scanner.nextInt();
            scanner.nextLine();
            int[] arr = new int[size];
            printMessage("Введите элементы массива: ");
            for (int i = 0; i < size; i++)
            {
                if (scanner.hasNextInt())
                    arr[i] = scanner.nextInt();
                else
                {
                    printMessage("Ошибка: введено не целое число.");
                    scanner.nextLine(); 
                    return;
                }
            }
            scanner.nextLine();
            int sum = 0;
            for (int num : arr)
                sum += num;
            printMessage("Сумма всех элементов массива: " + sum);
        }
        else
        {
            printMessage("Ошибка: введено не целое число.");
            scanner.nextLine();
        }
    }

    // Задача 16: count '+' and '-'
    public static void countPosAndNeg(Scanner scanner)
    {
        printMessage("Введите размер массива: ");
        if (scanner.hasNextInt())
        {
            int size = scanner.nextInt();
            scanner.nextLine();
            int[] arr = new int[size];
            printMessage("Введите элементы массива: ");
            for (int i = 0; i < size; i++)
            {
                if (scanner.hasNextInt())
                    arr[i] = scanner.nextInt();
                else
                {
                    printMessage("Ошибка: введено не целое число.");
                    scanner.nextLine();
                    return;
                }
            }
            scanner.nextLine();
            int positive = 0, negative = 0;
            for (int num : arr)
            {
                if (num > 0)
                    positive++;
                else if (num < 0)
                    negative++;
            }
            printMessage("Количество положительных чисел: " + positive);
            printMessage("Количество отрицательных чисел: " + negative);
        }
        else
        {
            printMessage("Ошибка: введено не целое число.");
            scanner.nextLine();
        }
    }

    // Задача 17: primes in [a, b]
    public static void printPrimesInRange(Scanner scanner)
    {
        printMessage("Введите два целых числа A и B: ");
        if (scanner.hasNextInt())
        {
            int a = scanner.nextInt();
            int b = scanner.nextInt();
            scanner.nextLine();
            printMessage("Простые числа от " + a + " до " + b + ": ");
            for (int i = a; i <= b; i++)
            {
                boolean isPrime = true;
                if (i <= 1)
                    isPrime = false;
                else
                    for (int j = 2; j <= Math.sqrt(i); j++)
                        if (i % j == 0)
                        {
                            isPrime = false;
                            break;
                        }
                if (isPrime)
                    printMessage(i + " ");
            }
            printMessage("\n");
        }
        else
        {
            printMessage("Ошибка: введено не целое число.");
            scanner.nextLine();
        }
    }

    // Задача 18: Vow + Cons
    public static void countVnadC(Scanner scanner)
    {
        printMessage("Введите строку: ");
        String str = scanner.nextLine().toLowerCase();
        int vowels = 0, consonants = 0;
        for (char c : str.toCharArray())
            if (c >= 'a' && c <= 'z')
            {
                if (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u')
                    vowels++;
                else
                    consonants++;
            }
        printMessage("Количество гласных: " + vowels);
        printMessage("Количество согласных: " + consonants);
    }

    // Задача 19: re-words
    public static void reverseWords(Scanner scanner)
    {
        printMessage("Введите строку: ");
        String str = scanner.nextLine();
        String[] words = str.split(" ");
        printMessage("Слова в обратном порядке: ");
        for (int i = words.length - 1; i >= 0; i--)
            printMessage(words[i] + " ");
        printMessage("\n");
    }

    // Задача 20: Arm's nums
    public static void ArmsNumber(Scanner scanner)
    {
        printMessage("Введите целое число: ");
        if (scanner.hasNextInt())
        {
            int number = scanner.nextInt();
            scanner.nextLine();
            int originalNumber = number, sum = 0, digits = String.valueOf(number).length();
            while (number != 0)
            {
                int digit = number % 10;
                sum += Math.pow(digit, digits);
                number /= 10;
            }
            if (sum == originalNumber)
                printMessage("Число " + originalNumber + " является числом Армстронга.");
            else
                printMessage("Число " + originalNumber + " не является числом Армстронга.");
        }
        else
        {
            printMessage("Ошибка: введено не целое число.");
            scanner.nextLine();
        }
    }

    public static void main(String[] args)
    {
        try (Scanner scanner = new Scanner(System.in))
        {
            while (true)
            {
                printMessage("Выберите задачу (1-20) или введите 0 для выхода:");
                if (scanner.hasNextInt())
                {
                    int choice = scanner.nextInt();
                    scanner.nextLine();
                    if (choice == 0)
                    {
                        printMessage("Выход из программы.");
                        break;
                    }
                    switch (choice)
                    {
                        case 1 -> EvenOdd(scanner);
                        case 2 -> findMinOfThree(scanner);
                        case 3 -> printMultiplicationTable();
                        case 4 -> sumFromOneToN(scanner);
                        case 5 -> printFibonacci(scanner);
                        case 6 -> Isprime(scanner);
                        case 7 -> printReverseNumbers(scanner);
                        case 8 -> sumOfEvenNumbers(scanner);
                        case 9 -> reverseString(scanner);
                        case 10 -> countDigits(scanner);
                        case 11 -> calculateFactorial(scanner);
                        case 12 -> sumOfDigits(scanner);
                        case 13 -> checkPalindrome(scanner);
                        case 14 -> findMaxInArray(scanner);
                        case 15 -> sumOfArrayElements(scanner);
                        case 16 -> countPosAndNeg(scanner);
                        case 17 -> printPrimesInRange(scanner);
                        case 18 -> countVnadC(scanner);
                        case 19 -> reverseWords(scanner);
                        case 20 -> ArmsNumber(scanner);
                        default -> printMessage("Неверный выбор! Попробуйте снова.");
                    }
                }
                else if (scanner.hasNextLine())
                    printMessage("Ошибка: введено не число.");
                else
                {
                    printMessage("Ввод завершён. Выход из программы.");
                    break;
                }
            }
        }
    }
}
