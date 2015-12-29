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


//浮点数求余计算
//不同于 C 和 OC,Swift 中是可以对浮点数进行求余的。
8 % 2.5
//结果是一个 Double 值 0.5


//自增和自减运算
//对变量本身加1或减1的自增( ++ )和自减( -- )的缩略算符，操作对象可以是整形和浮点型。
//++i是i = i + 1的简写；--i是i = i - 1的简写
//运算符即可修改了i的值也可以返回i的值
//当 ++ 前置的时候,先自増再返回；当 ++ 后置的时候,先返回再自增。

//一元负号运算符
//数值的正负号可以使用前缀 - (即一元负号)来切换:
let three = 3
let minusThree = -three // minusThree 等于 -3
let plusThree = -minusThree // plusThree 等于 3, 或 "负负3"
//一元正号运算符
//一元正号( + )不做任何改变地返回操作数的值:
let minusSix = -6
let alsoMinusSix = +minusSix // alsoMinusSix 等于 -6

//组合赋值运算符(Compound Assignment Operators)
var a = 1
a += 2 // a 现在是 3
//注意：复合赋值运算没有返回值, let b = a += 2 这类代码是错误

//比较运算符
//所有标准 C 语言中的比较运算都可以在 Swift 中使用:
//• 等于( a == b )
//• 不等于( a != b )
//• 大于( a > b )
//• 小于( a < b )
//• 大于等于( a >= b )
//• 小于等于( a <= b )
//注意: Swift 也提供恒等 === 和不恒等 !== 来判断两个对象是否引用同一个对象实例。
//每个比较运算都返回了一个标识表达式是否成立的布尔值

//三目运算符(Ternary Conditional Operator) 
//三目运算符的特殊在于它是有三个操作数的运算符,它的原型是 问题 ? 答案1 : 答案2
//如果 问题 成立,返回 答案1 的结果; 如果不成立,返回 答案2 的结果。

//空合运算符(Nil Coalescing Operator)
//空合运算符(a ?? b)将对可选类型 a 进行空判断,如果 a 包含一个值就进行解封,否则就返回一个默认值 b
//该运算符有两个条件:
//• 表达式 a 必须是Optional类型
//• 默认值 b 的类型必须要和 a 存储值的类型保持一致
//空合运算符是对以下代码的简短表达方法：
//a != nil ? a! : b
//注意: 如果 a 为非空值( non-nil ),那么值 b 将不会被估值。这也就是所谓的短路求值。


//区间运算符
//闭区间运算符
//闭区间运算符( a...b )定义一个包含从 a 到 b (包括 a 和 b )的所有值的区间, b 必须大于等于 a
for index in 1...5 {
    print("\(index) * 5 = \(index * 5)")
}
// 1 * 5 = 5
// 2 * 5 = 10
// 3 * 5 = 15
// 4 * 5 = 20
// 5 * 5 = 25

//半开区间运算符
//半开区间( a..<b )定义一个从 a 到 b 但不包括 b 的区间
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("第 \(i + 1) 个人叫 \(names[i])") }
// 第 1 个人叫 Anna // 第 2 个人叫 Alex // 第 3 个人叫 Brian // 第 4 个人叫 Jack


//逻辑运算
//逻辑运算的操作对象是逻辑布尔值。Swift 支持基于 C 语言的三个标准逻辑运算。
//    • 逻辑非(!a)
//    • 逻辑与( a && b )
//    • 逻辑或( a || b )
//注意：逻辑或、逻辑与的短路计算

//逻辑运算符组合计算
//    if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
//        print("Welcome!")
//} else {
//    print("ACCESS DENIED")
//}
//无论怎样, && 和 || 始终只能操作两个值。所以这实际是三个简单逻辑连续操作的结果。
//注意: Swift 逻辑操作符 && 和 || 是左结合的,这意味着拥有多元逻辑操作符的复合表达式优先计算最左边的子表达式。
//为了一个复杂表达式更容易读懂,在合适的地方使用括号()来明确优先级是很有效的









