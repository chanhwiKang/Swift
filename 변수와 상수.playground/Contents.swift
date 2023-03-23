import UIKit

// 상수의 선언
// let 이름: 타입 = 값

// 변수의 선언
// var 이름: 타입 = 값

// 타입이 명확하다면 생략가능
// let 이름 = 값
// var 이름 = 값

let constant: String = "차후 변경이 가능한 상수 let"
var variable: String = "차후 변경이 불가능한 변수 var"

variable = "변수는 변경이 가능하다"
//constant = "상수는 변경이 불가능하다"

///-----------------------------------------------------

let sum: Int // 상수와 변수 모두 값을 나중에 선언하기위해선 타입 입력이 필수적
let inputA: Int = 100
let inputB: Int = 200

// sum선언 후 첫 할당
sum = inputA + inputB

var nickname: String

nickname = "yagom"

nickname = "야곰" //변수라 이후에 재할당 가능
