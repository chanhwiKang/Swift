import UIKit

// struct 이름 {
// 구현부
//}

// MARK: - 프로퍼티 및 메서드

struct Sample {
    var mutableProperty: Int = 100 // 가변 프로퍼티
    let immutabkeProperty: Int = 100 //불변 프로퍼티
    
    static var typeProperty: Int = 100 // 타입 프로퍼티
    
    // 인스턴트 메서드
    func instanceMethod() {
        print("instance Method")
    }
    
    // 타입 메서드
    static func typeMethod() {
        print("type Method")
    }
}


// MARK: - 구조체 사용

// 가변 인스턴스
var mutable: Sample = Sample()
mutable.mutableProperty = 200
//mutable.immutabkeProperty = 200  가변 인스턴스지만 불변 프로퍼티는 변경 불가

// 불변 인스턴스
let immutable: Sample = Sample()
//immutable.mutableProperty = 200 불변 인스턴스라 가변 프로퍼티도 변경 불가
//immutable.mutableProperty = 200

// 타입 프로퍼티 및 메서드
Sample.typeProperty = 300
Sample.typeProperty
Sample.typeMethod()

// MARK: - 학생 구조체

struct Student {
    var name: String = "unknown"
    var `class`: String = "Swift"
    
    static func selfIntroduce() {
        print("학생 타입입니다")
    }
    
    func selfIntroduce() {
        print("저는 \(self.class)반 \(name)입니다.")
    }
}

Student.selfIntroduce()

var yagom: Student = Student()
yagom.name = "chan"
yagom.class = "Swift"
yagom.selfIntroduce()

