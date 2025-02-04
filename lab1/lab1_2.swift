// 1. Використання цілого десяткового числа 12 з мінімально необхідною розрядною сіткою
let smallNumber: Int8 = 12 // Int8 може зберігати значення від -128 до 127
print("Ціле число: \(smallNumber)")
// 2. Використання цілого десяткового числа -100
let smallNegativeNumber: Int8 = -100
print("Ціле число: \(smallNegativeNumber)")
// 3. Шістнадцяткове число, що дорівнює 128 в десятковій системі
let hexadecimalValue: UInt = 0x80
print("Шістнадцяткове число: \(hexadecimalValue)")
// 4. Мінімальне десяткове значення для 16-розрядного цілого числа
let minimum16BitValue: Int16 = Int16.min // -32768
print("Мінімальне 16-розрядне значення: \(minimum16BitValue)")
// 5. Максимальне десяткове значення для 64-розрядного цілого числа
let maximum64BitValue: Int64 = Int64.max // 9223372036854775807
print("Максимальне 64-розрядне значення: \(maximum64BitValue)")
// 6. Число з плаваючою крапкою 10,235.34
let decimalNumber: Double = 10235.34
print("Число з плаваючою крапкою: \(decimalNumber)")
// 7. Символ "а"
let letter: Character = "a"
print("Символ: \(letter)")
// 8. Рядок "Hello World"
let greeting: String = "Hello world"
print("Рядок: \(greeting)")
// 9. Логічне значення істини
let truthValue: Bool = true
print("Істина: \(truthValue)")
// 10. Число 12 і його текстове представлення "twelve"
let integerValue: Int = 12
let textValue: String = "twelve"
print("Число: \(integerValue), Текст: \(textValue)")