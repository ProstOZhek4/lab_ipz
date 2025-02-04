func sortArray(_ array: inout [Int], using algorithm: String = "bubble") {//inout дозволяє функції змінювати значення масиву, переданого як параметр
    switch algorithm {
    case "selection":
        selectionSort(&array)
    default:
        bubbleSort(&array)
    }
}
// Алгоритм бульбашкового сортування
func bubbleSort(_ array: inout [Int]) {
    let count = array.count
    for i in 0..<count - 1 {
        for j in 0..<count - i - 1 {
            if array[j] > array[j + 1] {
                // Обмін елементів без використання swap
                let temp = array[j]
                array[j] = array[j + 1]
                array[j + 1] = temp
            }
        }
    }
}
// Алгоритм сортування вибором
func selectionSort(_ array: inout [Int]) {
    let count = array.count
    for i in 0..<count - 1 {
        var minIndex = i
        for j in i + 1..<count {
            if array[j] < array[minIndex] {
                minIndex = j
            }
        }
        if minIndex != i {
            // Обмін елементів без використання swap
            let temp = array[i]
            array[i] = array[minIndex]
            array[minIndex] = temp
        }
    }
}
// Приклад виклику функції сортування
var numbers = [64, 25, 12, 22, 11]
sortArray(&numbers, using: "selection")//& позначає передачу параметра "за посиланням" дозволяючи функції змінити сам об’єкт масиву.
print("Відсортований масив вибором: \(numbers)")
var moreNumbers = [5, 1, 4, 2, 8]
sortArray(&moreNumbers) // Виклик сортування за замовчуванням (бульбашкове)
print("Відсортований масив бульбашкою: \(moreNumbers)")