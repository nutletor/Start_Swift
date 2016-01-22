//: Playground - noun: a place where people can play

import UIKit

//函数（Functions）

func sayHello(personName: String) -> String {
    let greeting = "Hello," + personName + "!"
    return greeting
}
print(sayHello("Jared"))


//无参函数
func sayHelloWorld() -> String {
    return "Hello, world"
}
print(sayHelloWorld())

//多参函数
func sayHello(personName: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return "How you doing"
    } else {
        return sayHello(personName)
    }
}
print(sayHello("Tim", alreadyGreeted: true))

//无返回值函数
func sayGoodbye(personName: String) {
    print("Goodbye, \(personName)!")
}
sayGoodbye("Dave")
//注意：严格上来说，虽然没有返回值被定义，sayGoodbye(_:) 函数依然返回了值。没有定义返回类型的函数会返回特殊的值，叫 Void。它其实是一个空的元组（tuple），没有任何元素，可以写成()。
//返回值可以被忽略，但定义了有返回值的函数必须返回一个值，如果在函数定义底部没有返回任何值，将导致编译错误（compile-time error）。


//多重返回值函数
//func minMax(array: [Int]) -> (min: Int, max: Int) {
//    var currentMin = array[0]
//    var currentMax = array[0]
//    for value in array[1..<array.count] {
//        if value < currentMin {
//            currentMin = value
//        } else if value > currentMax {
//            currentMax = value
//        }
//    }
//    return (currentMin, currentMax)
//}
//let bounds = minMax([8, -6, 2, 109, 3, 71])
//bounds.min
//bounds.0
//bounds.max
//bounds.1

//可选元组返回类型
//注意：可选元组类型如(Int, Int)?与元组包含可选类型如(Int?, Int?)是不同的.可选的元组类型，整个元组是可选的，而不只是元组中的每个元素值。
//前面的minMax(_:)函数返回了一个包含两个Int值的元组。但是函数不会对传入的数组执行任何安全检查，如果array参数是一个空数组，如上定义的minMax(_:)在试图访问array[0]时会触发一个运行时错误。
//为了安全地处理这个“空数组”问题，将minMax(_:)函数改写为使用可选元组返回类型，并且当数组为空时返回nil：
func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
//使用可选绑定来检查返回的元组是否为nil
if let bounds = minMax([8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}

//函数参数名称
//外部参数名用于在函数调用时标注传递给函数的参数，局部参数名在函数的实现内部使用。
//一般情况下，第一个参数省略其外部参数名，第二个以及随后的参数使用其局部参数名作为外部参数名。所有参数必须有独一无二的局部参数名。尽管多个参数可以有相同的外部参数名。























































































