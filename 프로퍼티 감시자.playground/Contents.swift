import UIKit


// 프로퍼티 감시자를 사용하면 프로퍼티 값이 변경될 때 원하는 동작을 수행할 수 있다

// MARK: - 정의

struct Money {
    //프로퍼티 감시자 사용
    var currencyRate: Double = 1100 {
        willSet(newRate) {
            print("환율이 \(currencyRate)에서 \(newRate)로 변경될 예정입니다")
        }
        didSet(oldRate) {
            print("환율이 \(oldRate)에서 \(currencyRate)로 변경되었습니다")
        }
    }
    
    var dollar: Double = 0 {
        //프로퍼티 감시자 사용
        willSet {
            //willSet의 암시적 매개변수 이름 newValue
            print("\(dollar)달러에서 \(newValue)달러로 변경될 예정입니다")
        }
        didSet {
            //didSet의 암시적 매개변수 이름 oldValue
            print("\(oldValue)달러에서 \(dollar)로 변경되었습니다")
        }
    }
    
    // 연산 프로퍼티
    
    var won: Double {
        get {
            return dollar * currencyRate
        }
        set {
            dollar = newValue / currencyRate
        }
    }
    
    // 감시자와 연산 프로퍼티를 동시에 사용 할 수 없다
    // willSet{}
}

// MARK: - 사용

var myMoney = Money()

myMoney.currencyRate = 1150
myMoney.dollar = 10

// 프로퍼티 감시자는 함수, 메서드, 클로저, 타입등의 외부에 위치한 지역, 전역변수에 모두 사용 가능
