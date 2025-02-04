func analyzeString(_ input: String) {
    var characterCount: [Character: Int] = [:]
    
    // Підрахунок кількості входжень кожного символа
    for character in input {
        if let count = characterCount[character] {
            characterCount[character] = count + 1
        } else {
            characterCount[character] = 1
        }
    }
    
    // Виведення таблиці результатів
    print("Символ | Кількість входжень")
    print("--------------------------")
    for (character, count) in characterCount {
        print("   \(character)   |       \(count)")
    }
}
// Приклад виклику функції
analyzeString("Hello, world!")