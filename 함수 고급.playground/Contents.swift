import UIKit

// MARK: - 매개변수 기본값

// 기본값을 갖는 매개변수는 뒤쪽에 위치하는것이 좋다
/* func 함수이름(매개변수1이름: 매개변수1타입, 매개변수2이름: 매개변수2타입 = 매개변수2 기본값 ...) -> 반환타입 {
        함수 구현부
        return 반환값
 }
*/
func greeting(friend: String, me: String = "찬휘") {
    print("hello \(friend)!, I'm \(me)")
}

// 매개변수 기본값을 가지는 매개변수는 생략 가능
greeting(friend: "승민") // hello 승민!, I'm 찬휘
greeting(friend: "태림", me: "강찬휘") // hello 태림!, I'm 강찬휘

// MARK: - 전달인자 레이블

// 전달인자 레이블은 함수를 호출 할 때 매개변수의 역할을 명확히 하거나, 함수 사용자 입장에서 표현하고자 할 때 사용
/*
 func 함수이름(전달인자 레이블 변수1이름: 변수1타입, 전달인자 레이블 변수2이름: 변수2타입 ...) -> 반환타입 {
        함수 구현부
        return
 }
 */
func greeting(to friend: String, from me: String) {
    print("hello \(friend)! i'm \(me)")
}

// 함수를 호출 할 때에는 전달인자 레이블을 사용해야 함
greeting(to: "승민", from: "찬휘")

// MARK: - 가변 매개변수

// 전달받을 값의 개수를 알기 어려울 때 사용
// 가변 매개변수는 함수당 하나만 가질 수 있다
/*
func 함수이름(매개변수1이름: 매개변수1타입, 전달인자 레이블 매개변수2이름: 매개변수2타입...) -> 반환타입 {
    함수 구현부
    return
 } */
func sayHelloToFriend(me: String, friends: String...) -> String {
    return "Hello \(friends)! i'm \(me)"
}
print(sayHelloToFriend(me: "찬휘", friends: "승민", "태림", "찬영"))

// 가변인자에 어떤 값도 넣고싶지 않다면 레이블을 생략한다
print(sayHelloToFriend(me: "찬휘"))

// MARK: - 함수의 타입 표현
// (매개변수1타입, 매개변수2타입 ...) -> 반환타입
// 반환타입 생략 불가

// 밑의 지문은
// 변수 someFunction에 String, String타입에 반환타입 Void인 함수가 선언될 수 있다
// 는 표현
var someFunction: (String, String) -> Void

func sayHello(friend: String, me: String = "찬휘") {
    print("hello \(friend)!, I'm \(me)")
}

someFunction = sayHello(friend:me:)
someFunction("aaa", "bbb")
