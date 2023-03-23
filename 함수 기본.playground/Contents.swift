import UIKit


// MARK: - 함수의 선언
/* 기본형태
func 함수이름(매개변수1이름: 매개변수1타입, 매개변수2이름: 매개변수2타입 ...) -> 반환타입 {
    함수 구현부
    return 반환값
} */
func sum(a: Int, b: Int) -> Int{
    return a + b
}

// MARK: 반환값이 없는 함수
//반환값이 없다면 반환타입에 Void입력 또는 생략가능
func printMyname1(name: String) -> Void{
    print(name)
}

func printMyname2(name: String) {
    print(name)
}

// MARK: - 매개변수가 없는 함수
func maximumIntgerValue() -> Int {
    return Int.max
}

// MARK: - 매개변수와 반환값이 없는 함수
func hello() { print("hello1") }

// MARK: - 함수의 호출
sum(a: 3, b: 5)
printMyname1(name: "찬휘")
maximumIntgerValue() //Int의 최댓값
hello()
