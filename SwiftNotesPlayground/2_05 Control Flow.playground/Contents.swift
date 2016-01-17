//: Playground - noun: a place where people can play

import UIKit

//控制流（Control Flow）

//For 循环
for index in 1...5 {
    
}
//index是一个每次循环遍历开始时被自动赋值的常量。这种情况下，index在使用前不需要声明，只需要将它包含在循环的声明中，就可以对其进行隐式声明，而无需使用let关键字声明

let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
//下划线符号 _ （替代循环中的变量）能够忽略具体的值，并且不提供循环遍历时对值的访问

for var index = 0;index < 3; ++index {
    
}

var index: Int
for index = 0; index < 3; ++index {
    
}
index


//While循环
let finalSquare = 25
var board = [Int](count: finalSquare + 1, repeatedValue: 0)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
var square = 0
var diceRoll = 0
while square < finalSquare {
    //掷骰子
    if ++diceRoll == 7 {
        diceRoll = 1
    }
    //根据点数移动
    square += diceRoll
    if square < board.count {
        //如果玩家还在棋盘上，顺着梯子爬上去或者顺着蛇滑下去
        square += board[square]
    }
}
print("Game over!")

//repeat {
//    //顺着梯子爬上去或者顺着蛇滑下去
//    square += board[square]
//    //掷骰子
//    if ++diceRoll == 7 {
//        diceRoll = 1
//    }
//    //根据点数移动
//    square += diceRoll
//} while square < finalSquare
//print("Game over!")


//Switch
//不需要在case分支中显式地使用break语句。但仍可在case分支中的代码执行完毕前使用break跳出。
//每一个case分支必须包含至少一条语句
let anotherCharacter: Character = "a"
switch anotherCharacter {
//case "a"://error
case "A":
    print("The letter A")
default:
    print("Not the letter A")
}

//一个 case 也可以包含多个模式，用逗号把它们分开（如果太长了也可以分行写）：
//switch some value to consider {
//    case value 1, value 2:
//    statements
//}

let approximateCount = 62
let countedThings = "moons orbiting Satum"
var naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
//注意： 闭区间操作符(...)以及半开区间操作符(..<)功能被重载去返回IntervalType或Range。一个区间可以决定他是否包含特定的元素，就像当匹配一个switch声明的case一样。区间是一个连续值的集合，可以用for-in语句遍历它。


let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("(0, 0")
case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
    print("(0, \(somePoint.1)) is on the y-axis")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0), \(somePoint.1)) is outside the box")
}
//不像 C 语言，Swift 允许多个 case 匹配同一个值。实际上，在这个例子中，点(0, 0)可以匹配所有四个 case。但是，如果存在多个匹配，那么只会执行第一个被匹配到的 case 分支。考虑点(0, 0)会首先匹配case (0, 0)，因此剩下的能够匹配(0, 0)的 case 分支都会被忽视掉。

//case 分支的模式允许将匹配的值绑定到一个临时的常量或变量，这些常量或变量在该 case 分支里就可以被引用了——这种行为被称为值绑定（value binding）。
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}
//请注意，这个switch语句不包含默认分支。这是因为最后一个 case ——case let(x, y)声明了一个可以匹配余下所有值的元组。这使得switch语句已经完备了，因此不需要再书写默认分支。
//在上面的例子中，x和y是常量，这是因为没有必要在其对应的 case 分支中修改它们的值。然而，它们也可以是变量——程序将会创建临时变量，并用相应的值初始化它。修改这些变量只会影响其对应的 case 分支。

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let(x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}
//这三个 case 都声明了常量x和y的占位符，用于临时获取元组yetAnotherPoint的两个值。这些常量被用作where语句的一部分，从而创建一个动态的过滤器(filter)。当且仅当where语句的条件为true时，匹配到的 case 分支才会被执行。


//控制转移语句（Control Transfer Statements）
//控制转移语句改变你代码的执行顺序，通过它你可以实现代码的跳转。
//Swift 有五种控制转移语句：
//continue
//break
//fallthrough
//return
//throw

//循环语句中的 continue
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
for character in puzzleInput.characters {
    switch character {
    case "a", "e", "i", "o", "u", " ":
        continue //立即停止本次循环，重新开始下次for循环，不会执行switch后的代码
    default:
            puzzleOutput.append(character)
    }
    print(1)
}
print(puzzleOutput)

//switch中的 break
puzzleOutput = ""
for character in puzzleInput.characters {
    switch character {
    case "a", "e", "i", "o", "u", " ":
        break //立即中断switch代码块的执行，跳转到switch外的代码，并不会影响switch外的for循环
    default:
        puzzleOutput.append(character)
    }
    print(1)
}
print(puzzleOutput)

//循环语句中的 break
//当在一个循环体中使用break时，会立刻中断该循环体的执行，然后跳转到表示循环体结束的大括号(})后的第一行代码。不会再有本次循环迭代的代码被执行，也不会再有下次的循环迭代产生

//贯穿（Fallthrough）
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough //fallthrough只会落入下一个case，若要连续贯穿必须添加多个fallthrough
//case 0:
//    description
default:
    description += " an integer."
}
print(description)

//带标签的语句
//使用标签来标记一个循环体或者switch代码块，当使用break或者continue时带上该标签，显式地指明break语句想要终止的是哪个循环体或者switch代码块。continue同理。
//gameLoop: while square != finalSquare {
//    if ++diceRoll == 7 { diceRoll = 1 }
//    switch square + diceRoll {
//    case finalSquare:
//        // 到达最后一个方块，游戏结束
//        break gameLoop
//    case let newSquare where newSquare > finalSquare:
//        // 超出最后一个方块，再掷一次骰子
//        continue gameLoop
//    default:
//        // 本次移动有效
//        square += diceRoll
//        square += board[square]
//    }
//}

//提前退出
//使用guard语句来要求条件必须为真时，以执行guard语句后的代码。
func greet(person:[String: String]) {
    guard let name = person["name"] else {
        return
    }
    print("Hello \(name)")
    
    guard let location = person["location"] else {
    print("I hope the weather is nice near you.")
    return
    }
    print("I hope the weather is nice in \(location).")
}
greet(["name": "John"])






























