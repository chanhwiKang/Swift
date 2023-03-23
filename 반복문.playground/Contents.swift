import UIKit

var integers = [1, 2, 3]
let people = ["yagom": 10, "eric": 15, "mike": 20]

// for-in 구문

// for item in items {
//    code
//}

for integer in integers {
    print(integer)
}

for (name, age) in people {
    print("\(name): \(age)")
}

/*
while integers.count > 1 {
    integers.removeLast()
    print(integers)
}
*/
repeat {
    integers.removeLast()
    print(integers)
} while integers.count > 0
