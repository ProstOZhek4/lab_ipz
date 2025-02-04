import Foundation
// Клас для роботи з раціональними числами
class Rational {
    var numerator: Int
    var denominator: Int
    init(numerator: Int, denominator: Int) {
        guard denominator != 0 else {
            fatalError("Знаменник не може дорівнювати нулю")
        }
        let gcdValue = Self.gcd(numerator, denominator)
        self.numerator = numerator / gcdValue
        self.denominator = denominator / gcdValue
    }
    // Метод для обчислення НСД
    private static func gcd(_ a: Int, _ b: Int) -> Int {
        return b == 0 ? abs(a) : gcd(b, a % b)
    }
    // Метод для копіювання об'єктів
    func copy(with zone: NSZone? = nil) -> Any {
        return Rational(numerator: numerator, denominator: denominator)
    }
    // Методи класу для додавання та віднімання
    static func add(lhs: Rational, rhs: Rational) -> Rational {
        return Rational(
            numerator: lhs.numerator * rhs.denominator + rhs.numerator * lhs.denominator,
            denominator: lhs.denominator * rhs.denominator
        )
    }
    static func subtract(lhs: Rational, rhs: Rational) -> Rational {
        return Rational(
            numerator: lhs.numerator * rhs.denominator - rhs.numerator * lhs.denominator,
            denominator: lhs.denominator * rhs.denominator
        )
    }
    // Методи для порівняння
    static func == (lhs: Rational, rhs: Rational) -> Bool {
        return lhs.numerator == rhs.numerator && lhs.denominator == rhs.denominator
    }
    static func < (lhs: Rational, rhs: Rational) -> Bool {
        return lhs.numerator * rhs.denominator < rhs.numerator * lhs.denominator
    }
}
// Клас калькулятора, реалізований як Singleton
class Calculator {
    static let shared = Calculator()
    // Метод для множення
    func multiply(_ a: Rational, _ b: Rational) -> Rational {
        return Rational(
            numerator: a.numerator * b.numerator,
            denominator: a.denominator * b.denominator
        )
    }
    // Метод для ділення
    func divide(_ a: Rational, _ b: Rational) -> Rational {
        guard b.numerator != 0 else {
            fatalError("Ділення на нуль не дозволено")
        }
        return Rational(
            numerator: a.numerator * b.denominator,
            denominator: a.denominator * b.numerator
        )
    }
    // Метод для виконання арифметичних операцій з пріоритетом
    func evaluate(_ a: Rational, _ b: Rational, _ c: Rational, operation: (Rational, Rational) -> Rational) -> Rational {
        // Пріоритет виконується шляхом спочатку розрахунку операцій a, b, а потім результат з c
        let intermediateResult = operation(a, b)
        return operation(intermediateResult, c)
    }
}
// Демонстрація можливостей класів
let rational1 = Rational(numerator: 1, denominator: 4)
let rational2 = Rational(numerator: 1, denominator: 3)
let rational3 = Rational(numerator: 1, denominator: 2)
let calculator = Calculator.shared
let additionResult = Rational.add(lhs: rational1, rhs: rational2)
let subtractionResult = Rational.subtract(lhs: rational1, rhs: rational2)
let multiplicationResult = calculator.multiply(rational1, rational2)
let divisionResult = calculator.divide(rational1, rational2)
// Оцінка з пріоритетом (наприклад, (a + b) * c)
let priorityResult = calculator.evaluate(rational1, rational2, rational3) { (lhs, rhs) in
    Rational.add(lhs: lhs, rhs: rhs)
}
let areEqual = rational1 == rational2
let isLessThan = rational1 < rational2
// Вивід результатів
print("Додавання: \(additionResult.numerator)/\(additionResult.denominator)")
print("Віднімання: \(subtractionResult.numerator)/\(subtractionResult.denominator)")
print("Множення: \(multiplicationResult.numerator)/\(multiplicationResult.denominator)")
print("Ділення: \(divisionResult.numerator)/\(divisionResult.denominator)")
print("Порівняння на рівність: \(areEqual)")
