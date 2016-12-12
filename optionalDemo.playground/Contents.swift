//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

extension Array where Element: Equatable{
    func find(_ element: Element) -> Optional<Index>{
        var index = startIndex
        
        while index != endIndex {
            if self[index] == element {
                return .some(index)
            }
            
            formIndex(after: &index)
        }
        
        return .none
    }
    
    
    func find02(_ element: Element) -> Index?{
        var index = startIndex
        
        while index != endIndex {
            if self[index] == element {
                return index
            }
            
            formIndex(after: &index)
        }
        
        return nil
    }
    
}


var numbers = [1,2,3]
let index = numbers.find(2)

print(type(of: index))


switch index {
case .some(let index):
    numbers.remove(at: index)
case .none:
    print("Not exits")
}


var numbers02 = [3,4,5]
let index02 = numbers02.find02(5)
switch index02 {
case let index?:
    numbers02.remove(at: index)
case nil:
    print("Not exits")

}

// force unwrapping => value!
// optinal binding  => if let value = value
// optional chaining => value?.
// nil coalescing => value ?? default

let stringOnes: [String] = ["1", "one", "100"]
let intOnes = stringOnes.map { (str) -> Int? in
   return Int(str)
}
// 迭代器
var i = intOnes.makeIterator()
while let i = i.next() {
    print(i ?? "nil")
}

// 改进 force unwrapping 的错误信息

infix operator !!

func !!<T>(optional: T?, errorMsg: @autoclosure () -> String) -> T {
    
    if let value = optional {
        return value
    }
    
    fatalError(errorMsg)
}

var record = ["name": "11"]
//record["type"] !! "Do not have the name key"
record["name"] !! "Do not have the name key"


// 改进 force unwrapping 的安全性

infix operator !?

// assert仅在debug mode生效
func !?<T: ExpressibleByStringLiteral>(optional: T?, nilDefault: @autoclosure () -> (errorMsg: String, value: T)) -> T{
    
    assert(optional != nil, nilDefault().errorMsg)
    return optional ?? nilDefault().value
}

//record["type"] !? ("Do not have the name key", "Free")

record["type"]?.write("aaa")


