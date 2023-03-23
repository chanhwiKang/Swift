import UIKit

//제네릭이란 타입에 의존하지 않는 범용 코드를 작성할 때 사용한다
//제네릭을 사용하면 중복을 피하고, 코드를 유연하게 작성할 수 있다


// 아래처럼 같은 타입끼리의 값의 swap은 간단하나 다른 타입끼리는 불가능하다
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let tempA = a
    a = b
    b = tempA
}
func swapTwoString(_ a: inout String, _ b: inout String) {
    let tempA = a
    a = b
    b = tempA
}

var a = 1
var b = 2
print(a, b)
swapTwoInts(&a, &b)
print(a, b)

var c = "aa"
var d = "bb"
print(c, d)
swapTwoString(&c, &d)
print(c, d)

// 위처럼 타입별로 함수를 만들어줘야하지만 아래 generic을 사용하면 함수 하나로 해결 가능
func swapTwoVault<T>(_ a: inout T, _ b: inout T) {
    let tempA = a
    a = b
    b = tempA
}

var aa = 1
var bb = 2
var cc = "aa"
var dd = "bb"

print(aa, bb, cc, dd)
swapTwoVault(&aa, &bb)
swapTwoVault(&cc, &dd)
print(aa, bb, cc, dd)
