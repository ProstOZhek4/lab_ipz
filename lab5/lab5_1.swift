func factorial(of number: Int) -> Int {
    // Перевірка для випадків з негативними числами (факторіал не визначений)
    if number < 0 {
        print("Факторіал для негативних чисел не визначений.")
        return -1 // Повертання -1, щоб вказати на помилку
    }
    // Базовий випадок: факторіал 0 дорівнює 1
    if number == 0 {
        return 1
    }
    // Рекурсивний випадок: обчислення факторіалу
    var result = 1
    for i in 1...number {
        result *= i
    }
    return result
}
// Приклад виклику функції
let number = 5
let result = factorial(of: number)
print("Факторіал числа \(number) дорівнює \(result)")