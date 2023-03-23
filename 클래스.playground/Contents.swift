import UIKit


// MARK: 프로퍼티와 메소드
class Sample {
    var mutableProperty: Int = 100
    let immutableProperty: Int = 100
    
    static var typeProperty: Int = 100
    
    // instance method
    func instanceMethod() {
        print("instance method")
    }
    
    // type metod
    // 재정의 불가 타입 메서드 - static
    static func typeMethod() {
        print("type method - statc")
    }
    
    // 재정의 가능 타입 메서드 - class
    class func classMethod() {
        print("type method - class")
    }
}

// MARK: class 사용
// struct와 다르게 let을 이용한 instance도 값 변경 가능
var mutablereference: Sample = Sample()
mutablereference.mutableProperty = 200
//mutablereference.immutableProperty = 200  불변 프로퍼티

let immutablereference: Sample = Sample()
immutablereference.mutableProperty = 200 // let이지만 변경 가능
//immutablereference.immutableProperty = 200  불변 프로퍼티

// 타입 프로퍼티 및 메서드
Sample.typeProperty = 200
Sample.typeMethod()
Sample.classMethod()
