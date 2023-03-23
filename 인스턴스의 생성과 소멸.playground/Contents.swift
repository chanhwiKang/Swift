import UIKit

// 이니셜라이저와 디이니셜라이저
// init, deinit

// MARK: - 프로퍼티 기본값
// 스위프트의 모든 인스턴스는 초기화와 동시에 모든 프로퍼티에 유효한 값이 할당되어 있어야 한다
// 프로퍼티에 미리 기본값을 할당해두면 인스턴스가 생성됨과 동시에 초기값을 지니게 됨

class PersonA {
    // 모든 저장 프로퍼티에 기본값 할당
    var name: String = "unknown"
    var age: Int = 0
    var nickName: String = "chan"
}

let jason: PersonA = PersonA()
jason.name = "Jason"
jason.age = 30
jason.nickName = "j"

// MARK: - 이니셜라이저

class PersonB {
    var name: String
    var age: Int
    var nickName : String
    
    // 이니셜라이저
    init(name: String, age: Int, nickName: String) {
        self.name = name
        self.age = age
        self.nickName = nickName
    }
}

let hana: PersonB = PersonB(name: "hana", age: 20, nickName: "HAHA")

// MARK: - 프로퍼티의 초기값 없음
// 아래와 같이 프로퍼티의 초기값이 꼭 필요없을 때 욥셔널을 이용한다 (nickName 부분)
// let hana: PersonB = PersonB(name: "hana", age: 20, nickName: "")

class PersonC {
    var name: String
    var age: Int
    var nickName : String?
    
    init(name: String, age: Int, nickName: String) {
        self.name = name
        self.age = age
        self.nickName = nickName
    }
    
    // 옵셔널을 사용했다면, 아래와같이 이니셜라이징을 안해도 된다
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let jenny: PersonC = PersonC(name: "jenny", age: 10)
let mike: PersonC = PersonC(name: "mike", age: 15, nickName: "m")

// 암시적 추출 옵셔널은 인스턴스 사용에 꼭 필요하지만, 초기값을 할당하지 않고자 할 때 사용
class Puppy {
    var name: String
    var owner: PersonC!
    
    init(name: String) {
        self.name = name
    }
    
    func goOut() {
        print("\(name)가 주인 \(owner.name)와 산책을 합니다")
    }
}

let happy: Puppy = Puppy(name: "happy")
// Puppy.owner가 이니셜라이징되지 않아 아래의 함수 호출불가
//happy.goOut()
happy.owner = jenny
happy.goOut()

// MARK: - 실패가능한 이니셜라이저
// 이니셜라이저 매개변수로 전달되는 초기값이 잘못된 경우 인스턴스 생성에 실패할 수 있다
// 실패한 경우 nil을 반환한다. 그래서 실패가능한 이니셜라이저의 반환타입은 옵셔널이다

class PersonD {
    var name: String
    var age: Int
    var nickName : String?
  
    init?(name: String, age: Int) {
        // 만약 나이가 0~120살에 포함되어 있지 않다면
        if (0...120).contains(age) == false {
            return nil
        }
        // 만약 이름의 길이가 0이라면 (이름이 제대로 입력되어있지 않다면)
        if name.count == 0 {
            return nil
        }
        
        self.name = name
        self.age = age
    }
}

// 아래 코드중 PersonD class는 init?를 사용하여 실패가능한 이니셜라이저로 옵셔널해야한다
//let john: PersonD = PersonD(name: "john", age: 23)
let john: PersonD? = PersonD(name: "john", age: 23)
let joker: PersonD? = PersonD(name: "joker", age: 123)
let batman: PersonD? = PersonD(name: "", age: 10)

print(batman)
print(joker)

// MARK: - 디이니셜라이저

// deinit은 클래스의 인스턴스가 메모리에서 해제되는시점에 호출된다
// 인스턴스가 해제되는 시점에 해야할 일을 구현할 수 있다

class PersonE {
    var name: String
    var pet: Puppy?
    var child: PersonC
    
    init(name: String, child: PersonC) {
        self.name = name
        self.child = child
    }
    // class에서만 구현가능. 매개변수를 갖지 않는다
    
    deinit {
        if let petName = pet?.name {
            print("\(name)가 \(child.name)에게 \(petName)를 인도합니다")
            self.pet?.owner = child
        }
    }
}
//
//var donald: PersonE? = PersonE(name: "donald", child: jenny)
//donald?.pet = happy
//donald = nil


var donald: PersonE? = PersonE(name: "donald", child: jenny)
donald?.pet = happy
donald = nil
