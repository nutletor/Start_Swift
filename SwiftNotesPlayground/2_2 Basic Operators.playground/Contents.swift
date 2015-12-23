//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//基本运算符(Basic Operators)


//术语
//运算符有一元、二元和三元运算符。
//• 一元运算符对单一操作对象操作(如 -a )。一元运算符分前置运算符和后置运算符,前置运算符需紧跟在操 作对象之前(如 !b ),后置运算符需紧跟在操作对象之后(如 i++ )。
//• 二元运算符操作两个操作对象(如 2 + 3 ),是中置的,因为它们出现在两个操作对象之间。
//• 三元运算符操作三个操作对象,和 C 语言一样,Swift 只有一个三元运算符,就是三目运算符( a ? b : c)。
//受运算符影响的值叫操作数,在表达式 1 + 2 中,加号 + 是二元运算符,它的两个操作数是值 1 和 2 。

//赋值运算符
//如果赋值的右边是一个多元组,它的元素可以马上被分解成多个常量或变量:
let (x, y) = (1, 2)
// 现在 x 等于 1, y 等于 2

//与 C 和 OC 不同,Swift 的赋值操作并不返回任何值。
//    if x = y {
        // 此句错误, 因为 x = y 并不返回任何值
//    }
//这个特性使你无法把( == )错写成( = ),由于 if x = y 是错误代码,Swift帮你避免此类错误的的发生。

//算术运算符
//Swift 中所有数值类型都支持了基本的四则运算:
//• 加法(+)
//• 减法(-)
//• 乘法(*)
//• 除法(/)
//与 C 语言和 OC 不同的是,Swift 中算术运算符( + , - , * , / , % 等)会 检测并不允许值溢出,以此来避免保存变量时由于变量大于或小于其类型所能承载的范围时导致的异常结果。但是你可以使用 Swift 的溢出运算符来实现溢出运算(如 a &+ b )

//加法运算符也可用于 String 的拼接:
"hello, " + "world"

//求余运算符
//求余运算( a % b )是计算 b 的多少倍刚刚好可以容入 a ,返回多出来的那部分(余数)。
//注意:求余运算( % )在其他语言也叫取模运算。然而严格说来,我们看该运算符对负数的操作结果,"求余"比"取 模"更合适些。
9 % 4
-9 % 4
9 % -4
//在对负数 b 求余时, b 的符号会被忽略。这意味着 a % b 和 a % -b 的结果是相同的。




























