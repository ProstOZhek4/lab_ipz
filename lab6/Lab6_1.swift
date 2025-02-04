import Foundation
// Базова структура Point
struct Point {
    private(set) var x: Double
    private(set) var y: Double
    private(set) var radius: Double
    private(set) var angle: Double
    
    // Ініціалізація за замовчуванням
    init() {
        self.x = 0.0
        self.y = 0.0
        self.radius = 0.0
        self.angle = 0.0
    }
}
// Ініціалізація декартових та полярних координат у структурі Point
extension Point {
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
        self.radius = (x * x + y * y).squareRoot()
        self.angle = atan2(y, x)
    }
    
    init(radius: Double, angle: Double) {
        self.radius = radius
        self.angle = angle
        self.x = radius * cos(angle)
        self.y = radius * sin(angle)
    }
}
extension Point {
    mutating func moveToCartesian(x: Double, y: Double) {
        self.x = x
        self.y = y
        self.radius = (x * x + y * y).squareRoot()
        self.angle = atan2(y, x)
    }
    mutating func moveToPolar(radius: Double, angle: Double) {
        self.radius = radius
        self.angle = angle
        self.x = radius * cos(angle)
        self.y = radius * sin(angle)
    }
}
extension Point {
    func description(inCoordinateSystem system: String = "cartesian") -> String {
        switch system.lowercased() {
        case "polar":
            return "Polar coordinates: (radius: \(radius), angle: \(angle))"
        default:
            return "Cartesian coordinates: (x: \(x), y: \(y))"
        }
    }
}
// PointExtensions.swift
extension Point {
     static func distanceBetween(_ point1: Point, _ point2: Point) -> Double {
        let dx = point2.x - point1.x
        let dy = point2.y - point1.y
        return (dx * dx + dy * dy).squareRoot()
    }
}
struct CartesianPoint {
    let x: Double
    let y: Double
}
struct PolarPoint {
    let radius: Double
    let angle: Double
}
// Розширення для ініціалізаторів з користувацькими типами
extension Point {
    init(cartesian: CartesianPoint) {
        self.init(x: cartesian.x, y: cartesian.y)
    }
    init(polar: PolarPoint) {
        self.init(radius: polar.radius, angle: polar.angle)
    }
}
// PointFactory.swift
extension Point {
    func createFromCartesian(x: Double, y: Double) -> Point {
        return Point(x: x, y: y)
    }
    func createFromPolar(radius: Double, angle: Double) -> Point {
        return Point(radius: radius, angle: angle)
    }
    func createFromCartesianCoordinates(_ coordinates: CartesianPoint) -> Point {
        return Point(cartesian: coordinates)
    }
    func createFromPolarCoordinates(_ coordinates: PolarPoint) -> Point {
        return Point(polar: coordinates)
    }
}
// Перевірка функціональності структури Point
func testPoint() {
    // Створення точки за декартовими координатами
    var point1 = Point(x: 3.0, y: 4.0)
    print("Точка 1 у декартовій системі:", point1.description(inCoordinateSystem: "cartesian"))
    print("Точка 1 у полярній системі:", point1.description(inCoordinateSystem: "polar"))
    // Створення точки за полярними координатами
    var point2 = Point(radius: 5.0, angle: Double.pi / 4)
    print("Точка 2 у декартовій системі:", point2.description(inCoordinateSystem: "cartesian"))
    print("Точка 2 у полярній системі:", point2.description(inCoordinateSystem: "polar"))
    // Зміщення точки 1 в нову позицію в декартовій системі
    point1.moveToCartesian(x: -2.0, y: -2.0)
    print("Точка 1 після зсуву у декартовій системі:", point1.description(inCoordinateSystem: "cartesian"))
    
    // Зміщення точки 2 в нову позицію в полярній системі
    point2.moveToPolar(radius: 3.0, angle: Double.pi / 3)
    print("Точка 2 після зсуву у полярній системі:", point2.description(inCoordinateSystem: "polar"))
    // Обчислення відстані між точками
    let distance = Point.distanceBetween(point1, point2)
    print("Відстань між точкою 1 та точкою 2:", distance)
}
// Виклик функції для перевірки
testPoint()
