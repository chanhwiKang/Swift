import UIKit


// 어플리케이션이 동작 도중 생성하는 다양한 결과값을 동적으로 확인하고
// 안전하게 처리 할 수 있도록 처리할 수 있다


//MARK: - Assertion
// assert(_:_:file:line:)함수를 사용
// assert함수는 디버깅 모드에서만 동작합니다
// 배포하는 어플리케이션에서는 제외됩니다
// 주로 디버깅 중 조건의 검증을 위하여 사용합니다

var someInt: Int = 0

// someInt가 0이면 그대로 pass하고 0이 아니면 하기 메세지 출력
assert(someInt == 0, "someInt는 0이 아니다")

func funcWithAssert(age: Int?) {
    assert(age != nil, "age==nil")
    
    assert((age! >= 0) && (age! <= 130), "age is wrong")
    print(age!)
}
funcWithAssert(age: 50)
//funcWithAssert(age: -1)
//funcWithAssert(age: nil)

// MARK: - Early Exit
// guard를 사용하여 잘못된 값의 전달시 특정 실행문구를 빠르게 종료
// 디버깅 모드 뿐 아니라 어떤 조건에서도 동작함
// guard의 else 블럭 내부에는 특정 코드블럭을 종료하는 지시어(return, break)가 있어야 함
// 타입 캐스팅, 옵셔널과도 자주 사용됨

func funcWithGuard(age: Int?) {
    guard let unwrappedAge = age,
        unwrappedAge < 130,
        unwrappedAge >= 0 else {
        print("나이 입력이 잘못됨")
        return
    }
    print("나이는 \(age)")
}



func someFunc(info: [String:Any]) {
    guard let name = info["name"] as? String else {
        return
    }
    
    guard let age = info["age"] as? Int else {
        return
    }
    print("\(name):\(age)")
}

someFunc(info:["name" : "jenny", "age" : "10"]) //age 값이 Int가 아니라 52줄 guard let에서 막힘
someFunc(info: ["name" : "jenny"]) //age 값이 없어서 52줄 guard let에서 막힘
someFunc(info: ["name" : "chan", "age" : 10])
