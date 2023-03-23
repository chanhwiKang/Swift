import UIKit

// 전달인자로 함수를 전달받거나 함수실행의 결과를 함수로 반환하는 함수

// map, filter, reduce

// MARK: - map
// 컨테이너 내부의 기존 데이터를 변형(transform)하여 새로운 컨테이너 생성

let numbers: [Int] = [0, 1, 2, 3, 4]
var doubleNumbers: [Int]
var strings: [String]

// 이하 numbers array안의 값을 두배와 문자열로 변형시킴
// MARK: - for구문 사용
doubleNumbers = [Int]()
strings = [String]()

for number in numbers {
    doubleNumbers.append(number * 2)
    strings.append("\(number)")
}

print(doubleNumbers)
print(strings)

// MARK: - map 사용
doubleNumbers = numbers.map({ (number: Int) -> Int in
    return number * 2
})

strings = numbers.map({ (number: Int) -> String in
    return "\(number)"
})

print(doubleNumbers)
print(strings)

// 매개변수, 반환 타입, return 생략
doubleNumbers = numbers.map ({ $0 * 3 })
print(doubleNumbers)
// MARK: - for구문
// 변수 사용에 주목
var filtered: [Int] = [Int]()

for number in numbers {
    if number % 2 == 0 {
        filtered.append(number)
    }
}
print(filtered)

// filter 메서드 사용

let evenNumbers: [Int] = numbers.filter {
    (number: Int) -> Bool in
    
    return number % 2 == 0
}
print(evenNumbers)

let oddNumbers: [Int] = numbers.filter { $0 % 2 != 0}
print(oddNumbers)


// MARK: - reduce
// 컨테이너 내부의 컨텐츠를 하나로 통합

let someNumbers: [Int] = [2, 8, 15]
var result: Int = 0

// someNumbers의 모든 요소를 더합니다
for number in someNumbers {
    result += number
}
print(result)

// result 메서드 사용
// 초기값이 0이고 someNumbers 내부의 값을 모두 더함
let sum: Int = someNumbers.reduce(0, {
    (first: Int, second: Int) -> Int in
    return first + second
})
print(sum)

// 초기값이 3이고 someNumbers 내부의 값을 모두 더함
let sum2 = someNumbers.reduce(3) { $0 + $1 }

print(sum2)
