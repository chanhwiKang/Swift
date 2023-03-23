import UIKit


// 인스턴스의 타입을 확인하는 용도
// 또는 클래스의 인스턴스를 부모 혹은 자식클래스의 타입으로 사용할 수있는지 확인하는 용도 is, as를 사용

// 타입캐스팅을 위한 클래스정의
class Person {
    var name: String = "1"
    func breath() {
        print("숨쉬는중")
    }
}

class Student: Person {
    var school: String = "2"
    func goToSchool() {
        print("학교감")
    }
}

class UnivStudent: Student {
    var major: String = "3"
    func goToMT() {
        print("MT감")
    }
}

var yagom: Person = Person()
var hana: Student = Student()
var jason: UnivStudent = UnivStudent()

// MARK: - 타입 확인
// is를 사용하여 타입을 확인함

var result: Bool

result = yagom is Person
result = yagom is Student
result = yagom is UnivStudent

result = hana is Person
result = hana is Student
result = hana is UnivStudent

result = jason is Person
result = jason is Student
result = jason is UnivStudent

if yagom is UnivStudent {
    print("대학생")
} else if yagom is Student {
    print("학생")
} else if yagom is Person {
    print("사람")
}

switch jason {
case is Person:
    print("사람")
case is Student:
    print("학생")
case is Person:
    print("사람")
default:
    print("?")
}

// MARK: - 업 캐스팅
// as를 사용하여 부모클래스의 인스턴스로 사용할 수 있도록 컴파일러에게 타입정보를 전환해줍니다
// Any 또는 AnyObject로도 타입정보를 변환할 수 있다.
// 암시적 처리되므로 생략해도 무방

var mike: Person = UnivStudent() as Person
type(of: mike)
mike.breath()

var mike2: UnivStudent = UnivStudent()
type(of: mike2)
mike2.breath()
mike2.goToMT()

var mike3 : Person = Student()
type(of: mike3)
if let downmike3 = mike3 as? Person {
    type(of: downmike3)
} else {
    print("실패")
}
var jenny: Student = Student()
var jina: Any = Person()

// MARK: - 다운 캐스팅
// as? 또는 as!를 사용하여 자식 클래스의 인스턴스로 사용할 수있도록 컴파일러에게 인스턴스의 타입정보를 전환해줌

// MARK: - 조건부 다운 캐스팅
// as?

var opCasted: Student?

opCasted = mike as? UnivStudent
opCasted = jenny as? UnivStudent
opCasted = jina as? UnivStudent
opCasted = jina as? Student

// MARK: - 강제 다운 캐스팅
// as!

var forcedCasted: Student?

forcedCasted = mike as! UnivStudent
//forcedCasted = jenny as! UnivStudent 런타임 오류
//forcedCasted = jina as! UnivStudent 런타임 오류
//forcedCasted = jina as! Student 런타임 오류

//활용
func doSomethingWithSwitch(someone: Person) {
    switch someone {
    case is UnivStudent:
        (someone as! UnivStudent).goToMT()
    case is Student:
        (someone as! Student).goToSchool()
    case is Person:
        (someone as! Person).breath()
    }
}

doSomethingWithSwitch(someone: mike as Person)
doSomethingWithSwitch(someone: mike)
doSomethingWithSwitch(someone: jenny)
doSomethingWithSwitch(someone: yagom)


func doSomething(someone: Person) {
    if let univStudent = someone as? UnivStudent {
        univStudent.goToMT()
    } else if let student = someone as? Student {
        student.goToSchool()
    } else if let person = someone as? Person {
        person.breath()
    }
}
