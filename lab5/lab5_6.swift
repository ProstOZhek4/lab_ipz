// Функція для перевірки належності точки до кола
func findLargestCircleContainingPoint(circles: [(centerX: Double, centerY: Double, radius: Double)], pointX: Double, pointY: Double) -> (centerX: Double, centerY: Double, radius: Double)? {
    var largestCircle: (centerX: Double, centerY: Double, radius: Double)? = nil
    
    // Перебір кожного кола у масиві
    for circle in circles {
        // Обчислення відстані від центру кола до точки
        let distance = ((pointX - circle.centerX) * (pointX - circle.centerX) + (pointY - circle.centerY) * (pointY - circle.centerY)).squareRoot()
        
        // Перевірка, чи точка входить у коло
        if distance <= circle.radius {
            // Оновлення найбільшого кола, якщо поточне коло більше за радіусом
            if largestCircle == nil || circle.radius > largestCircle!.radius {
                largestCircle = circle
            }
        }
    }
    
    return largestCircle
}
// Приклад використання
let circles = [
    (centerX: 0.0, centerY: 0.0, radius: 5.0),
    (centerX: 1.0, centerY: 1.0, radius: 3.0),
    (centerX: -2.0, centerY: -2.0, radius: 6.0)
]
let pointX = 1.0
let pointY = 1.0
if let largestCircle = findLargestCircleContainingPoint(circles: circles, pointX: pointX, pointY: pointY) {
    print("Найбільше коло, яке містить точку: центр (\(largestCircle.centerX), \(largestCircle.centerY)), радіус \(largestCircle.radius)")
} else {
    print("Точка не належить жодному з кіл.")
}