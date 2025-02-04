// 1. Описати змінну, що може містити або не містити ціле десяткове число
var integerNumber: Int?
// 2. Описати змінну, що може містити або не містити число з плаваючою крапкою
var decimalNumber: Double?
// 3. Присвоїти значення змінній integerNumber
integerNumber = 42
// 4. Подвоїти значення integerNumber за допомогою оператора інкремента
if let currentValue = integerNumber {
    integerNumber = currentValue + currentValue // Подвоюємо значення
    print("Значення integerNumber після інкременту:", integerNumber!) // Виводимо значення
}
// 5. Змінити знак числа на протилежний за допомогою унарного мінуса
if let currentValue = integerNumber {
    integerNumber = -currentValue // Змінюємо знак
    print("Значення integerNumber після зміни знаку:", integerNumber!) // Виводимо значення
}
// 6. Присвоїти значення decimalNumber значенням integerNumber
if let currentValue = integerNumber {
    decimalNumber = Double(currentValue) // Конвертуємо та присвоюємо
    print("Значення decimalNumber:", decimalNumber!) // Виводимо значення
}
// 7. Описати змінну pairOfValues, що містить значення integerNumber та decimalNumber
var pairOfValues: (Int?, Double?) = (integerNumber, decimalNumber)
// 8. Перевірити наявність цілочислового значення в pairOfValues і вивести його
if let intValue = pairOfValues.0 {
    print("Цілочислове значення з pairOfValues:", intValue)
} else {
    print("Цілочислове значення відсутнє")
}
// 9. Перевірити наявність числа з плаваючою крапкою в pairOfValues
if let doubleValue = pairOfValues.1 {
    print("Число з плаваючою крапкою з pairOfValues:", doubleValue)
} else {
    print("Число з плаваючою крапкою відсутнє")
}
// 10. Вивести значення decimalNumber, використовуючи optional binding
if let decimalValue = decimalNumber {
    print("Значення decimalNumber через optional binding:", decimalValue)
} else {
    print("decimalNumber відсутнє")
}