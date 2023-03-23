import UIKit


// MARK: - 옵셔널 선언방법
// 1. ! - 암시적 추출 옵셔널
// 기존 변수처럼 사용 가능 optionalValue = optionalValue + 1
// nil 할당 가능 optionalValue = nil

// 2. ?
// nill 할당 가능
// 기존 변수처럼 사용 '불가'
/*
var optionalValue: Int? = 100

switch optionalValue {
case .none: // 값이 존재하지 않는 경우 none
    print("This Optional variable nil")
case .some(let value): // 값이 존재하는 경우 some
    print("Value is \(value)")
}*/

// MARK: - 옵셔널 추출

// 1. Optional Binding - nil 체크 + 안전한 값 추출
/* myName(String) 과 printName(String?)의 타입이 달라서 호출 불가 'if - let' 방식으로 가능
func printName(_ name: String) {
    print(name)
}

var myName: String? = nil
printName(myName) */

// if - let
func printName(_ name: String) {
    print(name)
}

var myName: String! = nil

if let name: String = myName {
    printName(name)
} else {
    print("myName == nil")
}

// 2. 강제 추출
