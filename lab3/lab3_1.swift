// Крок 1: Створити клас Person і описати в ньому властивість name.
class Person {
    var name: String
    var child: Son?
    init(name: String) {
        self.name = name
        print("Person \(name) is initialized.")
    }
    deinit {
        print("Person \(name) is deallocated.")
    }
}
// Крок 7: Створити клас Son з властивістю parent
class Son {
    weak var parent: Person? // Використання weak для уникнення циклу утримання
    init() {
        print("Son is initialized.")
    }
    deinit {
        print("Son is deallocated.")
    }
}
// Крок 4–5: Створити об’єкт типу Person
do {
    let father = Person(name: "John") // Створення об'єкта Person
    let son = Son() // Створення об'єкта Son
    // Крок 8: Зберегти посилання Person в Son, Son в Person
    father.child = son
    son.parent = father
} // Крок 6: Тут об’єкт father і son вийдуть з області видимості, тому deinit буде викликано