import UIKit


// MARK: - 오류표현
//Error 프로토콜과 (주로) 열거형을통해서 오류를 표현합니다

/*
 enum 오류종류이름: Error {
    case 종류1
    case 종류2
 ...
 }
 */

// 자판기 동작 오류의 종류를 표현한 vendingMahcineError 열거형
enum VendingMahcineError: Error {
    case invalidInput
    case insufficientFunds(moneyNeeded: Int)
    case outofStock
}

// MARK: - 함수에서 발생한 오류 던지

// 자판기 동작 도중 발생한 오류 던지기
// 오류 발생의 여지가 있는 메서드는 throw를 사용하여 오류를 내포하는 함수임을 표시한다
class VendingMachine {
    let itemPrice: Int = 50
    var itemCount: Int = 6
    var deposited: Int = 0

    //돈받기 메서드
    func receiveMoney(_ money: Int) throws {
        
        //입력한 돈이 0이하면 오류를 던진다
        guard money > 0 else {
            throw VendingMahcineError.invalidInput
        }
        
        //오류가 없으면 정상처리를 한다
        self.deposited += money
        print("\(money)원 받음")
    }
    
    // 물건 팔기 메서드
    func vend(numberOfItems numberOfItemsToVend: Int) throws -> String {
        
        // 원하는 아이템의 수량이 잘못 입력되었으면 오류를 던진다
        guard numberOfItemsToVend > 0 else {
            throw VendingMahcineError.invalidInput
        }
        
        // 구매하려는 수량보다 미리 넣어둔 돈이 적으면 오류를 던진다
        guard numberOfItemsToVend * itemPrice <= deposited else {
            let moneyNeeded: Int
            moneyNeeded = numberOfItemsToVend * itemPrice - deposited
            throw VendingMahcineError.insufficientFunds(moneyNeeded: moneyNeeded)
        }
        
        // 구하려는 수량보다 요구하는 수량이 많으면 오류를 던진다
        guard itemCount >= numberOfItemsToVend else {
            throw VendingMahcineError.outofStock
        }
        
        // 오류가 없으면 정상처리한다
        let totalPrice = numberOfItemsToVend * itemPrice
        
        self.deposited -= totalPrice
        self.itemCount -= numberOfItemsToVend
        
        return "\(numberOfItemsToVend)개 제공함"
    }
}

// 자판기 인스턴스
let machine: VendingMachine = VendingMachine()

// 판매 결과를 전달받을 변수
var result: String?

// MARK: - 오류처리

// 오류발생의 여지가 있는 throw 함수(메서드)는 try를 사용하여 호출해야한다
// try, try?, try!

// MARK: - do-catch

// 오류발생의 여지가 있는 throws 함수(메서드)는 do-catch구문을 활용하여 오류에 대비한다

do {
    try machine.receiveMoney(0) // machine.receiveMoney(0)에 대한 오류를 catch함
} catch VendingMahcineError.invalidInput {
    print("입력이 잘못됨")
} catch VendingMahcineError.insufficientFunds(let moneyNeeded) {
    print("\(moneyNeeded)원 부족함")
} catch VendingMahcineError.outofStock {
    print("수량이 부족함")
} //입력이 잘못되었다

// 위와는 다른 방법으로 사용
do {
    try machine.receiveMoney(300)
} catch /*(let error)*/ { //let errors는 안써줘도 switch구문에서 사용 시 암시적으로 사용됨
    
    switch error {
    case VendingMahcineError.invalidInput:
        print("입력이 잘못됨")
    case VendingMahcineError.insufficientFunds(let moneyNeeded):
        print("\(moneyNeeded)원이 부족함")
    case VendingMahcineError.outofStock:
        print("수량이 부족함")
    default:
        print("알 수 없는 오류 \(error)")
    }
} // 300원 받음
    
// 아래처럼 간단하게 가능
do {
    result = try machine.vend(numberOfItems: 4)
} catch {
    print(error)
}


/*
do {
    result = try machine.vend(numberOfItems: 4)
}
*/
// MARK: - try? try!

// try?는 별도의 오류처리 결과를 통보받지 않고 오류 발생 시 nil값을 돌려받는다
// 정상 동작후에는 옵셔널 타입으로 정상값을 반환받는다

result = try? machine.vend(numberOfItems: 2)
result

// 아이템 수량 부족 및 잔금 부족으로 반환
result = try? machine.vend(numberOfItems: 2)
result
machine

// try!는 오류가 발생하지 않을 것이라는 확신을 가질 때 사용 시 결과값을 바로 돌려받는다 (옵셔널이 아님)
// 오류 발생시 런타임 오류 발생으로 인한 애플리케이션 동작이 중지됨
machine.deposited = 50
machine.itemCount = 1
result = try! machine.vend(numberOfItems: 1)
machine
// result = try! machine.vend(numberOfItems: 1)
