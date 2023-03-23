import UIKit
/*
 표현식 as  (변환 할)Type
 표현식 as? (변환 할)Type
 표현식 as! (변환 할)Type
 */
class Human {
    let name: String = "휴먼"
}
class Teacher: Human {
    let subject: String = "Swift"
}
class Student: Human {
    let grade: Int = 1
}

let human = Teacher.init() as Human

print(human.name)

if let teacher: Teacher = human as? Teacher {
    print("변수 teacher는 다운 캐스팅 됨")
    print(teacher.subject)
} else {
    print("?")
}

//print(human.subjact)
