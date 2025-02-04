import Foundation
// 1. Оголошуємо набір символів chSet із елементами a, b, c, d.
let chSet: Set<Character> = ["a", "b", "c", "d"]
// 2. Створюємо змінний набір mChSet, ініціюючи його значеннями з chSet.
var mChSet = Set(chSet)
// 3. Виводимо кількість елементів у mChSet.
print("Кількість елементів mChSet: \(mChSet.count)")
// 4. Додаємо символ 'e' до mChSet.
mChSet.insert("e")
// 5. Створюємо масив srtChSet, що містить відсортовані елементи з mChSet.
let srtChSet = Array(mChSet).sorted()
// 6. Спробуємо видалити символ 'f' з mChSet і вивести результат.
if let removedSymbol = mChSet.remove("f") {
    print("Видалений символ: \(removedSymbol)")
} else {
    print("Символ 'f' не знайдено у mChSet.")
}
// 7. Видаляємо символ 'd' з mChSet, якщо він там є, і показуємо оновлений набір.
if mChSet.contains("d") {
    mChSet.remove("d")
    print("mChSet після видалення 'd': \(mChSet)")
} else {
    print("'d' не знайдено у mChSet.")
}
// 8. Обчислюємо відстань між першим елементом та символом 'a'.
if let aIndex = mChSet.firstIndex(of: "a") {
    let distance = mChSet.distance(from: mChSet.startIndex, to: aIndex)
    print("Відстань між першим елементом та 'a': \(distance)")
}
// 9. Знову додаємо символ 'a' до mChSet.
mChSet.insert("a")
// 10. Оголошуємо набори aSet та bSet з різними типами значень.
let aSet: Set<AnyHashable> = ["One", "Two", "Three", 1, 2]
let bSet: Set<AnyHashable> = [1, 2, 3, "One", "Two"]
// 11. Визначаємо набір intersectionSet, що містить спільні елементи aSet та bSet.
let intersectionSet = aSet.intersection(bSet)
print("Спільні елементи: \(intersectionSet)")
// 12. Визначаємо набір uniqueInA, що містить унікальні елементи aSet по відношенню до bSet.
let uniqueInA = aSet.subtracting(bSet)
print("Унікальні елементи у aSet: \(uniqueInA)")
// 13. Визначаємо набір uniqueInB, що містить унікальні елементи bSet по відношенню до aSet.
let uniqueInB = bSet.subtracting(aSet)
print("Унікальні елементи у bSet: \(uniqueInB)")
// 14. Визначаємо symmetricDifferenceSet, що містить елементи, які не є спільними для aSet і bSet.
let symmetricDifferenceSet = aSet.symmetricDifference(bSet)
print("Несиметрична різниця: \(symmetricDifferenceSet)")
// 15. Оголошуємо набори xSet, ySet, zSet та x1Set з відповідними значеннями.
let xSet: Set = Set(2...4)
let ySet: Set = Set(1...6)
let zSet: Set = [3, 4, 2]
let x1Set: Set = [5, 6, 7]
// 16. Перевіряємо, чи входить xSet у ySet, і навпаки.
let isXInY = xSet.isSubset(of: ySet)
let isYInX = ySet.isSubset(of: xSet)
print("xSet входить у ySet: \(isXInY), ySet входить у xSet: \(isYInX)")
// 17. Перевіряємо, чи містить xSet ySet і навпаки.
let doesXContainY = xSet.isSuperset(of: ySet)
let doesYContainX = ySet.isSuperset(of: xSet)
print("xSet містить ySet: \(doesXContainY), ySet містить xSet: \(doesYContainX)")
// 18. Перевіряємо, чи є xSet та zSet рівними.
let areEqualXZ = xSet == zSet
print("xSet та zSet рівні: \(areEqualXZ)")
// 19. Перевіряємо, чи xSet є підмножиною zSet, але не є рівним.
let isXInZNotEqual = xSet.isSubset(of: zSet) && !areEqualXZ
print("xSet входить у zSet, але не є рівним: \(isXInZNotEqual)")
// 20. Перевіряємо, чи xSet є надмножиною zSet, але не є рівним.
let doesXContainZNotEqual = xSet.isSuperset(of: zSet) && !areEqualXZ
print("xSet містить zSet, але не є рівним: \(doesXContainZNotEqual)")