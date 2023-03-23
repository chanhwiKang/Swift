import UIKit


// 클래스, 프로토콜등에서 상속 가능
// 열거형, 구조체는 상속 불가
// 이하 클래스의 상속

// MARK: - 클래스의 상속과 재정의

//class 이름: 상속받을 클래스 이름 {
//      구현부
//}

class Person {
    var name: String = ""
    
    func selfintroduce() {
        print("저는 \(name)입니다")
    }
    
    // final 키워드를 이용해 재정의를 방지할 수 있다
    final func sayHello() {
        print("hello")
    }
    
    // 재정의 불가 메서드 static
    static func typeMethod() {
        print("type method - static")
    }
    
    // 재정의 가능 메서드 class
    class func classMethod() {
        print("type method - class")
    }
    
    // 재정의 가능한 class 메서드라도 final을 사용하면 재정의 할 수 없다
    // 메서드 앞의 'static'과 'final class'는 같은 역할을 한다
    final class func finalClassMethod() {
        print("type mothod - final class")
    }
}

class Student: Person {
    var major: String = ""
    
    override func selfintroduce() {
        print("저는\(name)이고, 전공은\(major)입니다")
    }
    
    override class func classMethod() {
        print("overriden class method - class")
    }
    
    // static을 사용한 타입 메소드는 재정의 할 수 없다
    //override static func typeMothod {}
    
    // final 키워드를 사용한 메서드, 프로퍼티는 재정의 할 수 없다
    //override func sayHello{}
    //override class func finalClassMethod {}
    
}

let yagom: Person = Person()
let hana: Student = Student()

yagom.name = "yagom"
hana.name = "hana"
hana.major = "Swift"

yagom.selfintroduce()
hana.selfintroduce()
Person.typeMethod()
