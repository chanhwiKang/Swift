import UIKit

/*
 후행 클로저
 반환타입 생략
 단축 인자이름
 암시적 반환 표현
 */
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
var result: Int
result = calculate(a: 1, b: 2, method: add)
print(result)

// MARK: - 후행 클로저
// 클로저가 마지막 전달인자라면
// 마지막 매개변수 이름을 생략한 후
// 함수 소괄호 외부에 클로저를 구현할 수 있습니다

result = calculate(a: 2, b: 4) { (left: Int, right: Int) -> Int in
    return right + left
}
print(result)

// MARK: - 반환타입 생략
// calculate함수의 method 매개변수는
// Int 타입을 반환할 것을 컴파일러도 알기에
// 생략이 가능하다

result = calculate(a: 3, b: 5, method: { (left: Int, right: Int) in
    return left + right
})
print(result)

// 후행 클로저와 함께 사용 가능
result = calculate(a: 5, b: 4) { (left: Int, right: Int) in
    return left + right
}
print(result)

// MARK: - 단축 인자이름
// 매개변수 이름이 불필요하다면 단축 가능
// 순서대로 $0, $1 ... 으로 표현
result = calculate(a: 6, b: 7) {
    return $0 + $1
}
print(result)

// MARK: - 암시적 반환 표현
// 마지막줄의 결과값은 return 생략 기능
result = calculate(a: 8, b: 9) { $0 + $1 }
print(result)
