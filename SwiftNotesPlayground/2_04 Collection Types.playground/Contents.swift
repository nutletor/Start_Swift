//: Playground - noun: a place where people can play

import UIKit

//集合类型 (Collection Types)


//数组（Arrays）
var someInts = [Int]()
someInts.count

someInts.append(3)
someInts = []
//someInts现在是空数组，但仍然是[Int]类型

var threeDoubles = [Double](count: 3, repeatedValue: 0.0)

var anotherThreeDoubles = Array(count: 3, repeatedValue: 2.5)
var sixDoubles = threeDoubles + anotherThreeDoubles

var shoppingList = ["Eggs", "Milk"]
//var shoppingList:[String] = ["Eggs", "Milk"]
//鉴于Swift类型推断机制，当用字面量构造只拥有相同类型值数组时，不必把数组的类型定义清楚

shoppingList.isEmpty

shoppingList.append("Flour")
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

var firstItem = shoppingList[0]
shoppingList[0] = "Six eggs"//修改
shoppingList
shoppingList[4...6] = ["Bananas", "Apples"]//部分替换
shoppingList
//注意：不可以用下标访问的形式在数组尾部添加新项

shoppingList.insert("Maple Syrup", atIndex: 0)

let mapleSyrup = shoppingList.removeAtIndex(0)
//该方法把数组在特定索引值中存储的数据项移除并返回该被移除的数据项
let apples = shoppingList.removeLast()

for item in shoppingList {
    print(item)
}

//enumerate()返回一个由每一个数据项索引值和数据值组成的元组
for (index, value) in shoppingList.enumerate() {
    print("Item \(String(index + 1)):\(value)")
}
//Item 1:Six eggs
//Item 2:Milk
//Item 3:Flour
//Item 4:Baking Powder
//Item 5:Bananas


//集合（Sets）
var letters = Set<Character>()
letters.count

letters.insert("a")
letters = []
//letters现在是一个空的Set，但是它仍然是Set<Character>类型

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
//一个Set类型不能从数组字面量中被单独推断出来，因此Set类型必须显式声明
//var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]

favoriteGenres.isEmpty

favoriteGenres.insert("Jazz")

//你可以通过调用Set的remove(_:)方法去删除一个元素，如果该值是该Set的一个元素则删除该元素并且返回被删除的元素值，否则如果该Set不包含该值，则返回nil。
if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}
//另外，Set中的所有元素可以通过它的removeAll()方法删除。

favoriteGenres.contains("Funk")

for genre in favoriteGenres {
    print("\(genre)")
}
//Classical
//Jazz
//Hip hop

//按照特定顺序遍历
for genre in favoriteGenres.sort() {
    print("\(genre)")
}
//Classical
//Hip hop
//Jazz

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
//intersect(_:) 方法根据两个集合中都包含的值创建的一个新的集合
oddDigits.intersect(evenDigits).sort()
//union(_:) 方法根据两个集合的值创建一个新的集合
oddDigits.union(evenDigits).sort()
//subtract(_:) 方法根据不在该集合中的值创建一个新的集合。
oddDigits.subtract(singleDigitPrimeNumbers).sort()
//exclusiveOr(_:) 方法根据在各自集合中但不在两个集合交集中的值创建一个新的集合
oddDigits.exclusiveOr(singleDigitPrimeNumbers).sort()


let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]
//使用“是否相等”运算符(==)来判断两个集合是否包含全部相同的值
houseAnimals == farmAnimals
//使用isSubsetOf(_:)方法来判断一个集合中的值是否也被包含在另外一个集合中
houseAnimals.isSubsetOf(farmAnimals)
//使用isSupersetOf(_:)方法来判断一个集合中包含另一个集合中所有的值
farmAnimals.isSupersetOf(houseAnimals)
//使用isStrictSubsetOf(_:)或者isStrictSupersetOf(_:)方法来判断一个集合是否是另外一个集合的子集合或者父集合并且两个集合并不相等
houseAnimals.isStrictSubsetOf(farmAnimals)
//使用isDisjointWith(_:)方法来判断两个集合是否不含有相同的值
houseAnimals.isDisjointWith(cityAnimals)


//字典（Dictionary）
//注意：一个字典的Key类型必须遵循Hashable协议，就像Set的值类型

var namesOfIntegers = [Int: String]()

namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]
//namesOfIntegers现在为[Int: String]类型的空字典

var airports:[String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
//var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

airports.count

airports.isEmpty

airports["LHR"] = "London"
airports["LHR"] = "London Heathrow"

//updateValue(_:forKey:)方法在这个键不存在对应值的时候会设置新值或者在存在时更新已存在的值。和上面的下标方法不同的，updateValue(_:forKey:)这个方法返回更新值之前的原值。这样使得我们可以检查更新是否成功。
//updateValue(_:forKey:)方法会返回对应值的类型的可选值。如果有值存在于更新前，则这个可选值包含了旧值，否则它将会是nil。
let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB")

//字典的下标访问会返回对应值的类型的可选值。如果字典不包含请求键对应的值，将返回nil
let airportName = airports["DUB"]

airports["APL"] = "Apple Interation"
airports["APL"] = nil
//使用下标语法可以通过给某个键的对应值赋值为nil来从字典中移除一个键值对：

let removedValue = airports.removeValueForKey("DUB")
//该方法在键值对不存在的情况下返回nil

//使用for-in遍历字典键值对时，字典中的数据项都以（key, value）元组形式返回
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}
//YYZ: Toronto Pearson
//LHR: London Heathrow

for airportCode in airports.keys {
    
}
for airportName in airports.values.sort() {
    
}

let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)



























































