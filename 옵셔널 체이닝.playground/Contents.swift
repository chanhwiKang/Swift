import UIKit

// 옵셔널 체이닝은 옵셔널 요소 내부의 프로퍼티로
// 또다시 옵셔널이 연속적으로 연결되는 경우 유용하게 사용할 수 있다

class Person {
    var name: String
    var job: String?
    var home: Apartment?
    
    init(name: String) {
        self.name = name
    }
}

class Apartment {
    var buildingNumber: String
    var roomNumber: String
    var protect: Person?
    var owner: Person?
    
    init(dong: String, ho: String) {
        buildingNumber = dong
        roomNumber = ho
    }
}

let yagom: Person? = Person(name: "yagom")
let apart: Apartment? = Apartment(dong: "101", ho: "202")
let superman: Person? = Person(name: "superman")

guardJob(owner: yagom)

func guardJob(owner: Person?) {
    if let guardJob = owner?.home?.protect?.job {
        print("\(guardJob)")
    } else {
        print("no")
    }
}


yagom?.home = apart

yagom?.home?.protect = superman
yagom?.home?.protect

yagom?.home?.protect?.job = "경비원"
yagom?.home?.protect?.job


// nil 변환 연산자
// nil이 아니면 ?? 앞의 값을 반환하고, nil이라면 ??뒤의 값을 반환한다
var guardJob: String

guardJob = yagom?.home?.protect?.job ?? "슈퍼맨"
print(guardJob)

yagom?.home?.protect?.job = nil

guardJob = yagom?.home?.protect?.job ?? "슈퍼맨"
print(guardJob)
