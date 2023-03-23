import UIKit

/*
 저장 프로퍼티(sotred property)
 연산 프로퍼티(computed property)
 인스턴스 프로퍼티(instance property)
 타입 프로퍼티(type property)
 */

// 프로퍼티는 구조체, 클래스, 열거형 내부에 구현할 수 있다
// 단, 열거형 내부에는 연산 프로퍼티만 구현 가능
// 연산 프로퍼티는 var로만 선언할 수 있다

// MARK: - 정의

struct Student {
    
    //인스턴트 저장 프로퍼티
    var name: String = ""
    var `class`: String = "Swift"
    var koreanAge: Int = 0
    
    //인스턴트 연산 프로퍼티
    var westernAge: Int {
        get{
            return koreanAge - 1
        }
        
        set(inputValue) {
            koreanAge = inputValue + 1
        }
    }
    
    //타입 저장 프로퍼티
    static var typeDescription = "학생"
}

// MARK: - 사용

var school: Student = Student()
print(school.westernAge)
school.westernAge = 2
print(school.koreanAge)

// MARK: - 응용

struct Money {
    var currencyRate: Double = 1100
    var dollar: Double = 0
    var won: Double {
        get {
            return dollar * currencyRate
        }
        set {
            dollar = newValue / currencyRate
        }
    }
}

var myMoney = Money()
myMoney.won = 11000
print(myMoney.won)
print(myMoney.dollar)

// MARK: - 지역변수, 전역변수
// 저장 프로퍼티와 연산 프로퍼티의 기능은
// 함수, 메서드, 클로저, 타입등의 외부에 위치한
// 지역, 전역 변수에도 사용 가능

var a: Int = 100
var b: Int = 50
var sum: Int {
    return a + b
}
print(sum)
