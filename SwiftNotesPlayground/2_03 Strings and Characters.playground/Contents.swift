//: Playground - noun: a place where people can play

import UIKit

//字符串和字符(Strings and Characters)


//String是例如"hello, world"，"albatross"这样的有序的Character（字符）类型的值的集合。通过String类型来表示。一个String的内容可以用变量的方式读取，它包括一个Character值的集合。
//创建和操作字符串的语法与 C 语言中字符串操作相似，轻量并且易读。 字符串连接操作只需要简单地通过+符号将两个字符串相连即可。
//与 Swift 中其他值一样，能否更改字符串的值，取决于其被定义为常量还是变量。你也可以在字符串内插过程中使用字符串插入常量、变量、字面量表达成更长的字符串，这样可以很容易的创建自定义的字符串值，进行展示、存储以及打印。
//尽管语法简易，但String类型是一种快速、现代化的字符串实现。每一个字符串都是由编码无关的 Unicode 字符组成，并支持访问字符的多种 Unicode 表示形式（representations）
//注意：Swift 的String类型与 Foundation NSString类进行了无缝桥接。就像 AnyObject类型 中提到的一样，在使用 Cocoa 中的 Foundation 框架时，您可以将创建的任何字符串的值转换成NSString，并调用任意的NSString API。您也可以在任意要求传入NSString实例作为参数的 API 中用String类型的值代替。


//字符串字面量(String Literals)
//您可以在您的代码中包含一段预定义的字符串值作为字符串字面量。字符串字面量是由双引号 ( "" ) 包裹着的具有固定顺序的文本字符集。 字符串字面量可以用于为常量和变量提供初始值:
let someString = "Some string literal value"
//注意 someString 常量通过字符串字面量进行初始化,Swift 会推断该常量为 String 类型。


//初始化空字符串 (Initializing an Empty String) 
//要创建一个空字符串作为初始值,可以将空的字符串字面量赋值给变量,也可以初始化一个新的 String 实例:
var emptyString = "" // 空字符串字面量 
var anotherEmptyString = String() // 初始化方法
// 两个字符串均为空并等价。
//您可以通过检查其 Boolean 类型的 isEmpty 属性来判断该字符串是否为空:
if emptyString.isEmpty {
    print("Nothing to see here")
}

//字符串可变性 (String Mutability) 
//可以通过将一个特定字符串分配给一个变量来对其进行修改:
var variableString = "Horse"
variableString += " and carriage"
//或者分配给一个常量来保证其不会被修改：
let constantString = "Highlander"
//constantString += " and another Highlander"
//注意: 在 Objective-C 和 Cocoa 中,您需要通过选择两个不同的类( NSString 和 NSMutableString )来指定字符串是否可以被修改

//字符串是值类型(Strings Are Value Types)
//Swift 的 String 类型是值类型。 如果你创建了一个新的字符串,那么当其进行常量、变量赋值操作,或在函数/方法中传递时,会进行值拷贝。 任何情况下,都会对已有字符串值创建新副本,并对该新副本进行传递或赋值操作。
//Swift 默认字符串拷贝的方式保证了在函数/方法中传递的是字符串的值。 很明显无论该值来自于哪里,都是你独自拥有的。 你可以确信传递的字符串不会被修改,除非你自己去修改它。
//在实际编译时,Swift 编译器会优化字符串的使用,使实际的复制只发生在绝对必要的情况下,这意味着您将字符串作为值类型的同时可以获得极高的性能。

//使用字符(Working with Characters)
//你可通过 for-in 循环来遍历字符串中的 characters 属性来获取每一个字符的值:
for character in "Dog!🐶".characters {
    print(character)
}
// D
// o
// g
// !
// 🐶
//另外,通过标明一个 Character 类型并用字符字面量进行赋值,可以建立一个独立的字符常量或变量:
let exclamationMark: Character = "!"
//字符串可以通过传递一个值类型为 Character 的数组作为自变量来初始化:
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)

//连接字符串和字符 (Concatenating Strings and Characters) 字符串可以通过加法运算符( + )相加在一起(或称“连接”)创建一个新的字符串:
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
//您也可以通过加法赋值运算符 ( += ) 将一个字符串添加到一个已经存在字符串变量上:
var instruction = "look over"
instruction += string2
//您可以用 append() 方法将一个字符附加到一个字符串变量的尾部:
welcome.append(exclamationMark)
//注意: 您不能将一个字符串或者字符添加到一个已经存在的字符变量上,因为字符变量只能包含一个字符。

//字符串插值 (String Interpolation)
//字符串插值是一种构建新字符串的方式,可以在其中包含常量、变量、字面量和表达式。插入的字符串字面量的每一项都在以反斜线为前缀的圆括号中:
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
//在上面的例子中，multiplier作为\(multiplier)被插入到一个字符串常量量中。 当创建字符串执行插值计算时此占位符会被替换为multiplier实际的值。
//注意：插值字符串中写在括号中的表达式不能包含非转义反斜杠 (\)，并且不能包含回车或换行符。不过，插值字符串可以包含其他字面量。

//Unicode
//Unicode 是一个国际标准，用于文本的编码和表示。 它使你可以用标准格式表示来自任意语言几乎所有的字符，并能够对文本文件或网页这样的外部资源中的字符进行读写操作。 Swift 的String和Character类型是完全兼容 Unicode 标准的。

//Unicode 标量（Unicode Scalars）
//Swift 的String类型是基于 Unicode 标量 建立的。 Unicode 标量是对应字符或者修饰符的唯一的21位数字，例如U+0061表示小写的拉丁字母("a")，U+1F425表示小鸡表情("🐥")。
//注意： Unicode 码位(code poing) 的范围是U+0000到U+D7FF或者U+E000到U+10FFFF。Unicode 标量不包括 Unicode 代理项(surrogate pair) 码位，其码位范围是U+D800到U+DFFF。
//注意不是所有的21位 Unicode 标量都代表一个字符，因为有一些标量是留作未来分配的。已经代表一个典型字符的标量都有自己的名字，例如上面例子中的LATIN SMALL LETTER A和FRONT-FACING BABY CHICK。



















