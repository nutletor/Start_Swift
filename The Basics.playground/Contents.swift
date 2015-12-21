//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
print(str)
print(str, terminator: "")

var string = "Hi, Steve"
print("输入", separator: ",", terminator: "0", toStream: &string)
print(string)

let minValue = UInt8.min
let maxValue = UInt8.max

//在32位平台上，Int和Int32长度相同。
//在64位平台上，Int和Int64长度相同。

//Float代表32位浮点数，最少只有6位数字
//Double代表64位浮点数，最少只有15位数字
let floatValue: Float = 100 / 3
let doubleValue: Double = 100 / 3


//当你声明常量或者变量并赋初值的时候「类型推断」非常有用。
//当推断浮点数的类型时，Swift会选择Double


//一个二进制数，前缀是0b
//一个八进制数，前缀是0o
//一个十六进制数，前缀是0x
//浮点字面量还有一个可选的指数（exponent，在十进制浮点数中通过大写或者小写的e来指定，在十六进制浮点数中通过大写或者小写的p来指定。
print(1.25e2)
print(1.25e-2)
print(0xFp2)
print(0xFp-2)

//整数和浮点数可以添加额外的零并且包含下划线，来增强字面量的可读性
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1


//通常来讲，即使代码中的整数常量和变量已知非负，也请使用Int类型。总是使用默认的整数类型可以保证你的整数常量和变量可以直接被复用并且可以匹配整数类字面量的类型推断
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)
//SomeType(ofInitialValue)是调用 Swift 构造器并传入一个初始值的默认方法。在语言内部，UInt16有一个构造器，可以接受一个UInt8类型的值，所以这个构造器可以用现有的UInt8来创建一个新的UInt16。注意，你并不能传入任意类型的值，只能传入UInt16内部有对应构造器的值。不过你可以扩展现有的类型来让它可以接收其他类型的值（包括自定义类型）

//整数和浮点数的转换必须显式指定类型
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine

let integerPi = Int(pi)
//整数类型可以用Double或者Float类型来初始化，浮点值会被截断。即4.75会变成4，-3.9会变成-3

//使用typealias关键字来定义类型别名
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min


























