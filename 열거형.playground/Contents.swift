import UIKit

// MARK: 정의
// enum은 타입이므로 대문자 카멜케이스를 사용하여 이름을 정의
// 각 case는 소문자 카멜케이스로 정의
// 각 case는 그 자체가 고유의 값

// MARK: 열거형 사용
enum Weekend {
    case mon
    case tue
    case wed
    case thu, fri, sat, sun
}

var day: Weekend = Weekend.mon
day
day = .tue
day

// switch문에서도 사용 가능
switch day {
case .mon, .tue, .wed, .thu:
    print("평일")
case .fri:
    print("불금")
case .sat, .sun:
    print("주말")
}

// MARK: 원시값
// 정수값을 갖기위해 사용
// rawValue를 사용
// case별로 다른 값을 가져야 한다

enum Fruit: Int {
    case apple = 0
    case grape = 1
    case peach // 직전 case + 1이 됨
}
print(Fruit.grape)
print(Fruit.grape.rawValue)

enum School: String {
    case ele = "초등"
    case mid = "중등"
    case high = "고등"
    case uni
}
print(School.high.rawValue)
print(School.uni.rawValue) // 원시값 명시가 없어 uni가 출력됨

// MARK: 원시값을 통한 초기화
// rawValue를 통해 초기화 할 수 있다
// rawValue가 case가 없을 수 있으므로 옵셔널로 받아진다

let apple: Fruit? = Fruit(rawValue: 0)

if let orange: Fruit = Fruit(rawValue: 5) {
    print(orange)
} else {
    print("rawValue에 해당하는 값이 없습니다")
}

// MARK: method

enum Month {
    case dec, jan, feb
    case mar, apr, may
    case jun, jul, aug
    case sep, oct, nov
    
    func printMassage() {
        switch self {
        case .mar, .apr, .may:
            print("Spring")
        case .jun, .jul, .aug:
            print("Summer")
        case .sep, .oct, .nov:
            print("fall")
        case .dec, .jan, .feb:
            print("winter")
        }
    }
}
Month.dec.printMassage()
