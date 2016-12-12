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

