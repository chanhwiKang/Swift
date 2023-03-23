import UIKit


// if
var a : String = "철수"
var b : String = "짱구"
var c : String = "맹구"
 
if a == "철수" {
    print("정답!")
}
else {
    print("a는 \(a)입니다.")
}

if b == "유리" {
    print("정답!")
}
else {
    print("b는 \(b)입니다.")
}
// switch

var aa : String = "A"

switch aa {
case "A":
    print("A")
case "a":
    print("a")
default:
    print("?")
}

var bb : String = "b"

switch bb {
case "A"..."Z":
    print("대문자")
case "a"..."z":
    print("소문자")
default:
    print("?")
}

