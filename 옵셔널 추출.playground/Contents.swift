import UIKit


// MARK: - Optional Binding - nil 체크 + 안전한 값 추출
/* myName(String) 과 printName(String?)의 타입이 달라서 호출 불가 'if - let' 방식으로 가능
func printName(_ name: String) {
    print(name)
}

var myName: String? = nil
printName(myName) */

// if - let 1
func printName(_ name: String) {
    print(name)
}

var myName: String? = nil

if let name:String = myName {
    printName(name)
} else {
    print("myName == nil")
}

// if - let 2
var myName1: String? = "chan"
var youName1: String? = nil

if let name = myName1, let friend = youName1 { //youName1이 nil이라서 실행 안됨
    print("\(name), \(friend)")
}
// MARK: - 강제 추출

func printName2(_ name: String) {
    print(name)
}

var myName2: String? = "chanhwi"
printName2(myName2!) // !를 붙여 강제 추출 6 ~ 11줄 과 !빼면 같은 코드

// 값이 nil일경우 런타임 오류
/*
var yourName: String? = nil
print(yourName) */
