import Foundation
// 1. Опис масиву fibArray з десяти перших чисел Фібонначі.
let fibArray = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
print("Числа Фібонначі:", fibArray)
// 2. Створіть масив revArray, елементи якого знаходяться в оберненому порядку відносно масиву fibArray.
let revArray = Array(fibArray.reversed())
print("Обраний масив у зворотному порядку:", revArray)
// 3. Опис масиву простих чисел snglArray, які не перевищують число 100.
var snglArray = [Int]()
for number in 2...100 {
    var isPrime = true
    for divisor in 2..<number {
        if number % divisor == 0 {
            isPrime = false
            break
        }
    }
    if isPrime {
        snglArray.append(number)
    }
}
print("Прості числа до 100:", snglArray)
// 4. Виведіть на екран кількість елементів масиву snglArray.
print("Кількість простих чисел у snglArray:", snglArray.count)
// 5. Виведіть на екран 10-й елемент масиву snglArray.
if snglArray.count >= 10 {
    print("10-й елемент snglArray:", snglArray[9])
}
// 6. Виведіть на екран підмасив елементів масиву snglArray, починаючи з 15-го та закінчуючи 20-м елементами.
if snglArray.count >= 20 {
    let subArray = snglArray[14..<20]
    print("Підмасив snglArray з 15-го по 20-й елемент:", Array(subArray))
}
// 7. Створіть масив rptArray з 10 елементів, що рівні 10-му елементу масиву snglArray.
if snglArray.count >= 10 {
    let tenthElement = snglArray[9]
    let rptArray = Array(repeating: tenthElement, count: 10)
    print("Масив rptArray:", rptArray)
}
// 8. Опис масиву непарних чисел oddArray (не менших за число 0, та не більших за число 10), використовуючи init(arrayLiteral:).
let oddArray: [Int] = [1, 3, 5, 7, 9]
print("Масив oddArray:", oddArray)
// 9. Додайте до масиву oddArray число 11.
var modifiableOddArray = oddArray + [11]
print("Після додавання 11 до масиву oddArray:", modifiableOddArray)
// 10. Додайте до масиву oddArray числа 15, 17, 19 у якості підмасиву.
modifiableOddArray += [15, 17, 19]
print("Після додавання [15, 17, 19] до oddArray:", modifiableOddArray)
// 11. Вставте у масив oddArray число 13 на позицію між числами 11 та 15.
if let index = modifiableOddArray.firstIndex(of: 11) {
    modifiableOddArray.insert(13, at: index + 1)
    print("Після вставки 13 після 11:", modifiableOddArray)
}
// 12. Видаліть елементи масиву oddArray, починаючи з 5-го та закінчуючи 8-им (невключно) елементами.
modifiableOddArray.removeSubrange(4..<8)
print("Після видалення з 5-го по 8-й елементи oddArray:", modifiableOddArray)
// 13. Видаліть останній елемент масиву oddArray та виведіть його на екран.
if let lastElement = modifiableOddArray.popLast() {
    print("Видалений останній елемент oddArray:", lastElement)
}
// 14. Замініть елементи масиву oddArray, починаючи з 2-го та закінчуючи останнім, на масив з числовими елементами 2, 3, 4.
if modifiableOddArray.count >= 2 {
    modifiableOddArray[1...] = [2, 3, 4]
    print("Після заміни з 2-го елемента oddArray:", modifiableOddArray)
}
// 15. Видаліть елемент масиву oddArray, який рівний числу 3.
if let index = modifiableOddArray.firstIndex(of: 3) {
    modifiableOddArray.remove(at: index)
    print("Після видалення 3 з oddArray:", modifiableOddArray)
}
// 16. Виведіть значення, яке визначає, чи міститься число 3 у масиві oddArray.
let containsThree = modifiableOddArray.contains(3)
print("Число 3 міститься у oddArray:", containsThree)
// 17. Виведіть на екран рядкове представлення масиву oddArray.
print("Рядкове представлення oddArray:", modifiableOddArray)