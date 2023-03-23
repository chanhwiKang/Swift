import UIKit


// 프로토콜은 특정 역할을 수행하기 위한 메서드, 프로퍼티, 이니셜라이저등의 요구사항을 정의합니다

// 구조체, 클래스, 열거형은 프로토콜을 채택(Adopted)해서 프로토콜의 요구사항을 구현할 수 있다
// 어떤 프로토콜의 요구사항을 모두 따르는 타입은 '프로토콜을 준수한다'고 표현한다
// 프로토콜의 요구사항을 충족시키려면 프로토콜이 제시하는 기능을 모두 구현해야 한다

// MARK: - 정의 문법

/*
 protocol 프로토콜 이름 {
    /* 정의부 */
 }
 */

protocol Talkable {
    // 프로퍼티 요구
    // 프로퍼티 요구는 항상 var을 사용해야 한다
    // get은 읽기만 가능, get set은 일기 쓰기 모두 가능한 프로퍼티여야 한다
    var topic: String { get set }
    var language: String { get }
    
    // 메서드 요구
    // 프로토콜에선 요구만 해서 { }를 이용하여 구현하지 않는다
    func talk()
    
    // 이니셜라이저 요구
    init(topic: String, language: String)
}

// MARK: - 프로토콜 채택 및 준수

// Person 구조체는 Talkable 프로토콜을 채택했다
struct Person: Talkable {
    var topic: String
    // language는 읽기 전용으로 let을 사용했으나 var 사용해도 무관. 반대는 안된다
    let language: String
    
    func talk() {
        print(topic, language)
    }
    
    init(topic: String, language: String) {
        self.topic = topic
        self.language = language
    }
}

// MARK: - 프로토콜 상속

// 프로토콜은 클래스와 다르게 다중상속이 가능
/*
 protocol 프로토콜 이름: 부모 프로토콜 이름 목록 {
    /*정의부*/
 }
 */
protocol Readable {
    func read()
}

protocol Writeable {
    func write()
}

protocol ReadSpeakable: Readable {
//  func read()
    func speak()
}

protocol ReadWriteSpeakable: Readable, Writeable {
//  func read()
//  func write()
    func speak()
}

struct SomeType: ReadWriteSpeakable {
    func read() {
        print("read")
    }
    func write() {
        print("write")
    }
    func speak() {
        print("speak")
    }
}

// MARK: - 클래스 상속과 프로토콜

// 클래스에서 상속과 프로토콜 채택을 동시에 하려면 클래스 명시후 프로토콜 작성

class SuperClass: Readable {
    func read() { print("read") }
}
class SubClass: SuperClass, Writeable, ReadSpeakable {
    func write() { print("write") }
    func speak() { print("speak") }
}


// MARK: - 프로토콜 준수 확인

// 인스턴스가 특정 프로토콜을 준수한느지 확인 할 수 있다
// is, as 연산자 사용

let suP: SuperClass = SuperClass()
let suB: SubClass = SubClass()

var someAny: Any = suP

someAny is Readable //true
someAny is ReadSpeakable //false

someAny = suB

someAny is Readable //true
someAny is ReadSpeakable //true

someAny = suP

if let someReadable: Readable = someAny as? Readable {
    someReadable.read()
} //read

if let someReadSpeakable: ReadSpeakable = someAny as? ReadSpeakable {
    someReadSpeakable.speak()
} // suP변수에 ReadSpeakable이 상속되어있지 않아 다운 캐스팅 불가
