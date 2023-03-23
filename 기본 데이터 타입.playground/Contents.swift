import UIKit

// Swift의 기본 데이터 타입
// Bool, Int, UInt, Float, Double, Character, String

// Bool -> ture와 false만 할당가능
var someBool : Bool = true
someBool = false
/*
 아래와 같은 1, 0도 불가능 (Int타입으로 인식)
someBool = 1
someBool = 0
*/

// Int -> 64비트 정수형 타입. 양수, 음수, 0 선언가능
var someInt : Int = -100

// UInt -> 양의 정수
var someUInt : UInt = 100

// Float -> 32비트 부동 수소. 정수도 가능
var someFloat : Float = 3.14
someFloat = 3

// Double -> 64비트 부동 수소. 정수도 가능
var someDouble : Double = 3.14
someDouble = 3

// Character -> 한글자 유니코드 문자 표현 가능
var someCharcter : Character = "🍏"
print(someCharcter)

// String -> 여러 문자 표현 가능
var someString : String = "하하 🚗"
print(someString)
someString = someString + "히히 🦽"
print(someString)
