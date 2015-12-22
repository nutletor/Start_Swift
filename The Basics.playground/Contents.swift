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


//元组(tuples)内的值并不要求是相同类型,可以包含任意顺序所有类型的值。
let http404Error = (404, "Not Found")
//http404Error的类型是(Int, String)，值是(404, "Not Found")

//将元组的内容分解成单独的常量和变量
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")
//如果只需要一部分的元组值，可以把忽略的部分用下划线标记
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")

//此外，你还可以通过下标来访问元组中的单个元素，下标从零开始：
print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")

//可以在定义元组的时候给单个元素命名,之后便可通过名字来获取元素的值
let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")
//注意：元组在临时组织值的时候很有用，但是并不适合创建复杂的数据结构。如果你的数据结构并不是临时使用，请使用类或者结构体而不是元组。

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
//convertedNumner被推测为类型"Int?"，或者类型"optional Int"

//可以将可选变量赋值为nil来表示它没有值
var serverResponseCode: Int? = 404
serverResponseCode = nil
//注意：nil不能用于非可选的常量和变量

//如果你声明一个可选常量或者变量但没有赋值，它们会自动被置为nil
var surveyAnswer: String?
//在OC中，nil是一个指向不存在对象的指针
//在Swift中，nil不是指针——它是一个确定的值，用来表示值缺失。任何类型的可选状态都可以被设置为nil，不只是对象类型

//当确定可选类型包含值时，可以使用感叹号(!)将可选值强制解析
if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!)")
}
print(convertedNumber!)//可选值强制解析后不再是可选类型
















