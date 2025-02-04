import Foundation
// Частина 1: Практика з Reference Cycles
class Operand {
    var number: Int
    var operand: Operand?
    var sumClosure: (() -> Int)?
    init(number: Int) {
        self.number = number
        
        // Closure, яке створює retain cycle
        sumClosure = { [self] in
            return self.number + (self.operand?.number ?? 0)
        }
    }
    
    deinit {
        print("Operand \(number) is deallocated.")
    }
}
// Створення об'єктів
var operand1: Operand? = Operand(number: 5)
var operand2: Operand? = Operand(number: 10)
operand1?.operand = operand2
operand2?.operand = operand1
// Виклик closure
if let result = operand1?.sumClosure?() {
    print("Sum: \(result)") // Це викликає retain cycle
}
// Виправлення retain cycle
class FixedOperand {
    var number: Int
    var operand: FixedOperand?
    var sumClosure: (() -> Int)?
    init(number: Int) {
        self.number = number
        
        // Використання weak для уникнення retain cycle
        sumClosure = { [weak self] in
            return self?.number ?? 0 + (self?.operand?.number ?? 0)
        }
    }
    
    deinit {
        print("FixedOperand \(number) is deallocated.")
    }
}
// Створення об'єктів
var fixedOperand1: FixedOperand? = FixedOperand(number: 5)
var fixedOperand2: FixedOperand? = FixedOperand(number: 10)
fixedOperand1?.operand = fixedOperand2
fixedOperand2?.operand = fixedOperand1
// Виклик closure
if let result = fixedOperand1?.sumClosure?() {
    print("Sum: \(result)") // Тепер це не викликає retain cycle
}
// Частина 2: Додавання Closure в Клас
class OperandWithBlock {
    var number: Int
    var aBlock: (() -> ())?
    init(number: Int) {
        self.number = number
        print("init")
        
        // Closure, яке робить деяку операцію
        aBlock = { [weak self] in
            print(self?.number ?? 0)
        }
    }
    deinit {
        print("deinit")
    }
}
// Створення об'єкта типу OperandWithBlock
var operandWithBlock: OperandWithBlock? = OperandWithBlock(number: 5)
operandWithBlock?.aBlock?() // Виклик closure
operandWithBlock = nil // Занулення об'єкта