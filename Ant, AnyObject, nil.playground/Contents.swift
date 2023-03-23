import UIKit

/*
 Any - swift의 모든 타입을 지칭하는 키워드
 AnyObject - 모든 클래스 타입을 지칭하는 프로토콜
 nil - 없음을 의미하는 키워드
 */

// MARK: - Any
var someAny: Any = 100
someAny = "어떤 타입도 수용 가능합니다"
someAny = 3.14

// MARK: - AnyObject

class SomeClass {}
var someanyObject: AnyObject = SomeClass()

// MARK: - nil

//someAny = nil
//someanyObject = nil
