// Основна функція-калькулятор, яка приймає два числа та операцію
func calculator(_ a: Int, _ b: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(a, b)
}
// Окремі функції для кожної математичної операції
func add(_ x: Int, _ y: Int) -> Int {
    return x + y
}
func subtract(_ x: Int, _ y: Int) -> Int {
    return x - y
}
func multiply(_ x: Int, _ y: Int) -> Int {
    return x * y
}
func modulus(_ x: Int, _ y: Int) -> Int {
    return x % y
}
func power(_ base: Int, _ exponent: Int) -> Int {
    var result = 1
    for _ in 0..<exponent {
        result *= base
    }
    return result
}
// Меню для вибору операції (без виклику основної функції-калькулятора)
func selectOperation(_ a: Int, _ b: Int, choice: String) -> Int? {
    switch choice {
    case "+":
        return add(a, b)
    case "-":
        return subtract(a, b)
    case "*":
        return multiply(a, b)
    case "%":
        return modulus(a, b)
    case "^":
        return power(a, b)
    default:
        print("Невідома операція.")
        return nil
    }
}
// Приклад використання
let number1 = 5
let number2 = 3
if let result = selectOperation(number1, number2, choice: "%") {
    print("Результат: \(result)")
}