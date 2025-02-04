func analyzeCharacter(_ character: Character) {
    print("Аналіз символа '\(character)':")
    
    // Перевірка, чи є символ цифрою
    if character.isNumber {
        print("Символ є цифрою.")
    } else {
        print("Символ не є цифрою.")
        
        // Перевірка, чи є символ літерою
        if character.isLetter {
            print("Символ є літерою.")
            
            // Перевірка належності до великого або малого регістру
            if character.isUppercase {
                print("Це велика літера.")
            } else if character.isLowercase {
                print("Це мала літера.")
            }
            
            // Перевірка належності до англійської або української абетки
            if ("A"..."Z").contains(character) || ("a"..."z").contains(character) {
                print("Символ належить до англійської абетки.")
            } else if ("А"..."Я").contains(character) || ("а"..."я").contains(character) {
                print("Символ належить до української абетки.")
            } else {
                print("Символ не належить до англійської або української абетки.")
            }
            
        } else {
            print("Символ не є літерою.")
        }
    }
}
// Приклади виклику функції
analyzeCharacter("A")
analyzeCharacter("б")
analyzeCharacter("3")
analyzeCharacter("?")