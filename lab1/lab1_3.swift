import Foundation
var sentence = "Hello World. This is Swift programming language"
// 1. Визначити та вивести на екран довжину рядка
let length = sentence.count
print("Довжина рядка:", length)
// 2. Замінити кожне входження символа “i” на символ “u”
let replacedSentence = sentence.map { $0 == "i" ? "u" : String($0) }.joined()
print("Після заміни 'i' на 'u':", replacedSentence)
// 3. Видалити 4-й, 7-й та 10-й символи
var modifiedSentence = replacedSentence
let indicesToRemove = [3, 6, 9] // Індекси 4-го, 7-го і 10-го символів
for index in indicesToRemove.sorted(by: >) {
    let position = modifiedSentence.index(modifiedSentence.startIndex, offsetBy: index)
    modifiedSentence.remove(at: position)
}
print("Після видалення 4-го, 7-го та 10-го символів:", modifiedSentence)
// 4. Додати рядок “ (modified)” до існуючого рядка
let finalSentence = modifiedSentence + " (modified)"
print("Після додавання '(modified)':", finalSentence)
// 5. Вивести значення, що визначає чи існуючий рядок є пустим
print("Чи є рядок порожнім:", finalSentence.isEmpty)
// 6. Додати символ “.” до кінця існуючого рядка
let updatedSentence = finalSentence + "."
print("Після додавання '.':", updatedSentence)
// 7. Вивести значення, що визначає чи рядок починається з підрядка “Hello”
print("Чи починається рядок з 'Hello':", updatedSentence.hasPrefix("Hello"))
// 8. Вивести значення, що визначає чи рядок закінчується підрядком “world.”
print("Чи закінчується рядок на 'world.':", updatedSentence.hasSuffix("world."))
// 9. Вставити символ “-” після 10-го символа
var finalUpdatedSentence = updatedSentence
let insertionPosition = finalUpdatedSentence.index(finalUpdatedSentence.startIndex, offsetBy: 10)
finalUpdatedSentence.insert("-", at: insertionPosition)
print("Після вставки '-' після 10-го символа:", finalUpdatedSentence)
// 10. Замінити послідовність “Thus us” на “It is”
let finalReplacedSentence = finalUpdatedSentence.replacingOccurrences(of: "Thus us", with: "It is")
print("Після заміни 'Thus us' на 'It is':", finalReplacedSentence)
// 11. Вивести 10-й та 15-й символи існуючого рядка 
let tenthCharacter = finalReplacedSentence[finalReplacedSentence.index(finalReplacedSentence.startIndex, offsetBy: 9)]
let fifteenthCharacter = finalReplacedSentence[finalReplacedSentence.index(finalReplacedSentence.startIndex, offsetBy: 14)]
print("10-й символ:", tenthCharacter)
print("15-й символ:", fifteenthCharacter)
// 12. Вивести підрядок, що знаходиться у межах 10-го (включно) та 15-го (невключно) символів
let substringStart = finalReplacedSentence.index(finalReplacedSentence.startIndex, offsetBy: 9)
let substringEnd = finalReplacedSentence.index(finalReplacedSentence.startIndex, offsetBy: 14)
let substring = finalReplacedSentence[substringStart..<substringEnd]
print("Підрядок з 10-го по 15-й символ:", substring)