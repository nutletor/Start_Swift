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


//使用enum来创建一个枚举。就像类和其他所有命名类型一样，枚举可以包含方法。
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
let aceRawValue = ace.rawValue  //使用rawValue属性来访问一个枚举成员的原始值。
//在上面的例子中，枚举原始值的类型是Int，所以你只需要设置第一个原始值。剩下的原始值会按照顺序赋值。你也可以使用字符串或者浮点数作为枚举的原始值。

//使用init?(rawValue:)初始化构造器在原始值和枚举值之间进行转换。
if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}

//枚举的成员值是实际值，并不是原始值的另一种表达方法。实际上，以防原始值没有意义，你不需要设置。
enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()
//注意，有两种方式可以引用Hearts成员：给hearts常量赋值时，枚举成员Suit.Hearts需要用全名来引用，因为常量没有显式指定类型。在switch里，枚举成员使用缩写.Hearts来引用，因为self的值已经知道是一个suit。已知变量类型的情况下你可以使用缩写。


//使用struct来创建一个结构体。结构体和类有很多相同的地方，比如方法和构造器。它们之间最大的一个区别就是结构体是传值，类是传引用。
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDecription = threeOfSpades.simpleDescription()


//一个枚举成员的实例可以有实例值。相同枚举成员的实例可以有不同的值。创建实例的时候传入值即可。实例值和原始值是不同的：枚举成员的原始值对于所有实例都是相同的，而且你是在定义枚举的时候设置原始值。
enum ServerResponse {
    case Result(String, String)
    case Error(String)
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Error("Out of cheese.")

switch success {
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
case let .Error(error):
    let serverResponse = "Failure... \(error)"
}
switch failure {
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
case let .Error(error):
    let serverResponse = "Failure... \(error)"
}


//使用protocol来声明一个协议
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}
//类、枚举和结构体都可以实现协议
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += "(adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription
//注意声明SimpleStructure时候mutating关键字用来标记一个会修改结构体的方法。SimpleClass的声明不需要标记任何方法，因为类中的方法通常可以修改类属性（类的性质）。


//使用extension来为现有的类型添加功能，比如新的方法和计算属性。你可以使用扩展在别处修改定义，甚至是从外部库或者框架引入的一个类型，使得这个类型遵循某个协议。
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)

//你可以像使用其他命名类型一样使用协议名——例如，创建一个有不同类型但是都实现一个协议的对象集合。当你处理类型是协议的值时，协议外定义的方法不可用。
let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)
// print(protocolValue.anotherProperty)  // Uncomment to see the error
//即使protocolValue变量运行时的类型是simpleClass，编译器会把它的类型当做ExampleProtocol。这表示你不能调用类在它实现的协议之外实现的方法或者属性。



//在尖括号里写一个名字来创建一个泛型函数或者类型
func repeatItem<Item>(item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
repeatItem("knock", numberOfTimes: 4)

//也可以创建泛型函数、方法、类、枚举和结构体
enum OptionalValue<Wrapped> {
    case None
    case Some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)

//在类型名后面使用where来指定对类型的需求，比如，限定类型实现某一个协议，限定两个类型是相同的，或者限定某个类必须有一个特定的父类。
func anyCommonElements<T:SequenceType, U:SequenceType where T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element>(Ihs: T, _ rhs: U) -> Bool {
    for IhsItem in Ihs {
        for rhsItem in rhs {
            if IhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
anyCommonElements([1, 2, 3], [3])
//<T: Equatable>和<T where T: Equatable>是等价的


































