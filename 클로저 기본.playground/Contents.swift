import UIKit

// MARK: 정의
/* 매개변수 생략가능, 반환타입 Void 가능
{ (매개변수 목록) -> 반환타입 in
    실행 코드
}*/

// 함수 사용 시
func sumFunc(a: Int, b: Int) -> Int {
    return a + b
}

var sumResult: Int = sumFunc(a: 1, b: 2)
print(sumResult)

// 클로저 사용 시)
var sum: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
    return a + b
}

sumResult = sum(1, 2)
print(sumResult)

sum = sumFunc(a: b:)
sumResult = sum(3, 2)
print(sumResult)

// MARK: 함수의 전달인자로서의 클로저

let add: (Int, Int) -> Int
add = { (a: Int, b: Int) -> Int in
    return a + b
}

let substract: (Int, Int) -> Int
substract = { (a: Int, b: Int) -> Int in
    return a - b
}

func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
    return method(a, b)
}

var calculated = calculate(a: 50, b: 10, method: add)
print(calculated)
