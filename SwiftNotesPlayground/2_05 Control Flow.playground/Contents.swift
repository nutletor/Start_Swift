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










































































