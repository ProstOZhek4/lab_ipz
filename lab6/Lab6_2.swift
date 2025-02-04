import Foundation
// Структура для опису Точки (завдання №1)
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
    
    // Ініціалізація за декартовими координатами
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
        self.radius = (x * x + y * y).squareRoot()
        self.angle = atan2(y, x)
    }
    
    // Ініціалізація за полярними координатами
    init(radius: Double, angle: Double) {
        self.radius = radius
        self.angle = angle
        self.x = radius * cos(angle)
        self.y = radius * sin(angle)
    }
}
// Перерахування для типу фігури
enum FigureType {
    case unknown
    case point
    case line
    case triangle
    case quadrilateral
    case polygon
}
// Структура для опису Фігури
struct Figure {
    private(set) var points: [Point]
    var type: FigureType
    
    // Ініціалізатор для створення фігури з масиву точок
    init(points: [Point]) {
        self.points = points
        self.type = FigureType.unknown
        
        switch points.count {
        case 1:
            self.type = .point
        case 2:
            self.type = .line
        case 3:
            self.type = .triangle
        case 4:
            self.type = .quadrilateral
        default:
            if points.count > 4 {
                self.type = .polygon
            }
        }
    }
    
    // Ініціалізатор для створення фігури з ряду точок
    init(points: Point...) {
        self.points = points
        self.type = FigureType.unknown
        
        switch points.count {
        case 1:
            self.type = .point
        case 2:
            self.type = .line
        case 3:
            self.type = .triangle
        case 4:
            self.type = .quadrilateral
        default:
            if points.count > 4 {
                self.type = .polygon
            }
        }
    }
    
    // Індексатор для доступу до точки за індексом
    subscript(index: Int) -> Point? {
        guard index >= 0 && index < points.count else {
            return nil
        }
        return points[index]
    }
}
// Розширення для обчислення площі та периметру фігури
extension Figure {
    func area() -> Double {
        switch self.type {
        case .triangle:
            guard points.count == 3 else { return 0.0 }
            // Використовуємо формулу Герона для площі трикутника
            let a = distanceBetween(points[0], points[1])
            let b = distanceBetween(points[1], points[2])
            let c = distanceBetween(points[2], points[0])
            let s = (a + b + c) / 2
            return (s * (s - a) * (s - b) * (s - c)).squareRoot()
        case .quadrilateral:
            guard points.count == 4 else { return 0.0 }
            // Приклад простого обчислення площі чотирикутника (розділяємо на два трикутники)
            let triangle1Area = Figure(points: points[0], points[1], points[2]).area()
            let triangle2Area = Figure(points: points[0], points[2], points[3]).area()
            return triangle1Area + triangle2Area
        default:
            return 0.0
        }
    }
    
    func perimeter() -> Double {
        var perimeter = 0.0
        for i in 0..<points.count {
            let nextIndex = (i + 1) % points.count
            perimeter += distanceBetween(points[i], points[nextIndex])
        }
        return perimeter
    }
    
    // Допоміжна функція для обчислення відстані між двома точками
    private func distanceBetween(_ point1: Point, _ point2: Point) -> Double {
        let dx = point2.x - point1.x
        let dy = point2.y - point1.y
        return (dx * dx + dy * dy).squareRoot()
    }
}
// Перевірка функціональності
func testFigure() {
    // Створення фігури - трикутник
    let point1 = Point(x: 0, y: 0)
    let point2 = Point(x: 3, y: 0)
    let point3 = Point(x: 3, y: 4)
    let triangle = Figure(points: point1, point2, point3)
    print("Тип фігури: \(triangle.type)")
    print("Площа трикутника: \(triangle.area())")
    print("Периметр трикутника: \(triangle.perimeter())")
    
    // Створення фігури - чотирикутник
    let point4 = Point(x: 0, y: 4)
    let quadrilateral = Figure(points: point1, point2, point3, point4)
    print("Тип фігури: \(quadrilateral.type)")
    print("Площа чотирикутника: \(quadrilateral.area())")
    print("Периметр чотирикутника: \(quadrilateral.perimeter())")
    
    // Доступ до конкретної точки фігури
    if let point = triangle[1] {
        print("Точка на індексі 1: \(point.x), \(point.y)")
    }
}
// Виклик тестової функції
testFigure()