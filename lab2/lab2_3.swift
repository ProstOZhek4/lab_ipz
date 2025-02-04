import Foundation
// 1. Опишіть словник nDict
let nDict: [String: String] = [
    "1": "One",
    "2": "Two",
    "3": "Three",
    "4": "Four",
    "5": "Five"
]
// 2. Виведіть на екран значення словника nDict за ключем 3.
if let valueForKey3 = nDict["3"] {
    print("Значення для ключа '3': \(valueForKey3)")
}
// 3. Виведіть на екран значення словника nDict за індексом ключа 4.
if let valueForKey4 = nDict["4"] {
    print("Значення для ключа '4': \(valueForKey4)")
}
// 4. Створіть mutable словник mNDict на основі словника nDict.
var mNDict = nDict
// 5. Додайте елементи 6:Seven та 7:Six до словника mNDict.
mNDict["6"] = "Seven"
mNDict["7"] = "Six"
// 6. Оновіть значення елементів словника mNDict
mNDict["6"] = "Six"
mNDict["7"] = "Seven"
mNDict["8"] = "Eight"
// 7. Видаліть елемент за ключем 5 зі словника mNDict.
mNDict["5"] = nil
// 8. Видаліть елемент за індексом ключа 4 (у словнику це ключ "4")
mNDict["4"] = nil
// 9. Визначте та виведіть на екран відстань у словнику mNDict між парами значень 1:One та 7:Seven.
if let index1 = mNDict.keys.firstIndex(of: "1"),
   let index7 = mNDict.keys.firstIndex(of: "7") {
    let distance = abs(mNDict.keys.distance(from: index1, to: index7))
    print("Відстань між '1' та '7' у словнику: \(distance)")
}
// 10. Створіть масив mNDictKeys, елементами якого є усі ключі словника mNDict.
let mNDictKeys = Array(mNDict.keys)
// 11. Створіть масив mNDictValues, елементами якого є усі значення словника mNDict.
let mNDictValues = Array(mNDict.values)
// 12. Виведіть на екран кількість елементів словника mNDict, а також кількість його всіх ключів та його всіх значень.
print("Кількість елементів у словнику mNDict: \(mNDict.count)")
print("Кількість ключів: \(mNDictKeys.count)")
print("Кількість значень: \(mNDictValues.count)")
// 13. Виведіть на екран рядкове представлення словника mNDict.
print("Рядкове представлення словника mNDict: \(mNDict)")