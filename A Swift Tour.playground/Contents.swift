//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var myVariable = 42
myVariable = 50
print(myVariable)
let myConstant = 42
//myConstant = 50 //error
print(myConstant)


let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70


let label = "The width is "
let width = 94
let widthLabel = label + String(width)


let apples = 3
let oranges = 5
let appleSummary = "i have \(apples) apples"
let fruitSummary = "i have \(apples + oranges) pieces of fruit"


var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"
var occupation = ["Mic": "Captain", "Kate": "Nurse"]
occupation["Kate"] = "PoliceWoman"

let emptyAry = [String]()
let emptyDic = [String: Float]()

shoppingList = []
occupation = [:]


let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)


var optionalString: String? = "Hello"
print(optionalString == nil)
print(optionalString == "Hello")

//var optionalName: String? = "Jared"
var optionalName: String? = nil
var greeting = "Hello"
if let name = optionalName {  //如果变量的可选值是nil，条件会判断为false。如果不是nil，会将值赋给let后面的常量
    greeting = "Hello, \(name)"
} else {
    greeting = "Hello,world!"
}

let nickname: String? = nil
let fullName: String = "Jared Huang"
let informalGreeting = "Hi,\(nickname ?? fullName)"

let vegetable = "red pepper"
switch vegetable {
case"celery":
        print("Add some raisins")
case"cucumber", "watercress":
        print("That would make a sandwich")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup")
}


let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)


var n = 2
while n < 100 {
    n = n * 2
}
print(n)

var m = 2
repeat {
    m = m * 2
} while m < 100
print(m)


//使用..<创建的范围不包含上界，如果想包含的话需要使用...
var firstForLoop = 0
for i in 0..<4 {
    firstForLoop += 1
}
print(firstForLoop)

var secondForLoop = 0
for var i = 0; i < 4; ++i {
    secondForLoop += 1
}
print(secondForLoop)


func greet(name: String, day: String) ->String {
    return "Hello \(name), today is \(day)"
}
greet("Bob", day: "Tuesday")


func calculateStatistics(scores:[Int]) ->(min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}
let statistics = calculateStatistics([5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.2)//元组的元素用点语法索引


//函数可以带有可变个数的参数，在函数内表现为数组
func sumOf(numbers:Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(42, 58, 10)

func averageOf(numbers:Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum / numbers.count
}
averageOf(42, 58, 10)


func returnFifteen() -> Int {
    var y = 10
    func add() {    //被嵌套的函数可以访问外侧函数的变量
        y += 5
    }
    add()
    return y
}
returnFifteen()


//函数可作为另一个函数的返回值
func makeIncrementer() -> (Int ->Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)


//函数也可作参数
func hasAnyMatches(list: [Int], condition:Int -> Bool) -> Bool {
    for item in list {         //只要有一个元素符合condition函数则返回true
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number:Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 9, 12]
hasAnyMatches(numbers, condition: lessThanTen)


//使用{}来创建一个匿名闭包。使用in将参数、返回值类型声明与闭包函数体进行分离。
numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})

//如果一个闭包的类型已知，比如作为一个回调函数，你可以忽略参数的类型和返回值。单个语句闭包会把它语句的值当做结果返回。
let mappedNumbers = numbers.map({
    number in 3 * number
})
print(mappedNumbers)

//当一个闭包是传给函数的唯一参数，你可以完全忽略括号。（or当一个闭包作为最后一个参数传给一个函数的时候，它可以直接跟在括号后面。）
let sortedNumbers = numbers.sort {$0 > $1}//可以通过参数位置而不是参数名字来引用参数。
print(sortedNumbers)


class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
//要创建一个类的实例，在类名后面加上括号。使用点语法来访问实例的属性和方法。
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

//每个属性都需要赋值——无论是通过声明（就像numberOfSides）还是通过构造器（就像name）。
class NameShape {
    var numberOfSides:Int = 0
    var name: String
    
    init(name: String) {
        self.name = name    //注意self被用来区别实例变量
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}


class Square: NameShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength;
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
    
    //如果你需要在删除对象之前进行一些清理工作，使用deinit创建一个析构函数
    deinit {
        
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()


class EquilateralTriangle: NameShape {
    var sideLength: Double = 0.0
    
    //注意EquilateralTriangle类的构造器执行了三步：
    //1.设置子类声明的属性值
    //2.调用父类的构造器
    //3.改变父类定义的属性值。其他的工作比如调用方法、getters和setters也可以在这个阶段完成。
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    //在perimeter的 setter 中，新值的名字是newValue。你可以在set之后显式的设置一个名字。
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)


//如果你不需要计算属性，但是仍然需要在设置一个新值之前或者之后运行代码，使用willSet和didSet。
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
//        didSet {
//            triangle.sideLength = 20
//        }
    }
    
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)


//处理变量的可选值时，你可以在操作（比如方法、属性和子脚本）之前加?。如果?之前的值是nil，?后面的东西都会被忽略，并且整个表达式返回nil。否则，?之后的东西都会被运行。在这两种情况下，整个表达式的值也是一个可选值。
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength



enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.Ace
let aceRawValue = ace.rawValue






































