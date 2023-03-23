import UIKit

// 컬렉션 타입 - Array, Dictionary, Set
/*
 Array - 순서가 있는 리스트 컬렉션
 Dictionary - 키와 값의 쌍으로 이루어진 컬렉션
 Set - 순서가 없고, 멤버가 유일한 컬렉션
 */

// Int 타입의 빈 어레이 선언
// 변수명: Array<타입> = Array<타입>()
// 'Array<타입>()'는 빈 어레이 선언을 위함
var integers: Array<Int> = Array<Int>()

// 어레이에 값 추가를 위해 append사용
integers.append(100)
integers.append(20)
integers.append(3)

// 어레이에 해당 값이 있는지 확인하기 위해 contains사용
integers.contains(100)
integers.contains(1)

// 어레이에 값 제거를 위해 remove사용(순서 명시)
integers.remove(at: 0)
// 어레이의 가장 마지막 값 제거를 위해 removeLast사용
integers.removeLast()
// 모든 어레이의 값 제거를 위해 removeAll사용
integers.removeAll()

// 어레이에 몇개의 값이 있는지 확인위해 count사용
integers.count

// 'Array<Double>'은 '[Double]' 과 같다
var array_Double : [Double] = [Double]()

// '[]'은 빈 어레이 생성
var array_Flout : [Float] = []

// let을 사용하면 불변 어레이
let immutableArray = [1, 2, 3]

// MARK: - Dictionary

// Key가 String타입이고 Value가 Any인 빈 Dictionary 생성하는 법
var anyDictionary : Dictionary<String, Any> = [String : Any]()

// key가 somekey, value가 벨류인 Dictionary와 key가 anotherkey, value가 100인 Dictionary 선언법
anyDictionary["somekey"] = "벨류"
anyDictionary["anotherkey"] = 100

anyDictionary

// somekey의 value 바꾸기
anyDictionary["somekey"] = "VALUE"
anyDictionary

// key에 해당하는 value를 제거하는 방법 두개
anyDictionary.removeValue(forKey: "anotherkey")
anyDictionary["somekey"] = nil
anyDictionary

// [:]로 빈 Dictionary 생성 가능
// 'let emptyDictionary : Dictionary[String, String] = [String : String]()' 와 같은 선언
let emptyDictionary : [String : String] = [:]
emptyDictionary

// 값을 선언
let initializedDicitionary : [String : String] = ["이름":"찬휘", "나이":"스물 여섯"]
initializedDicitionary


// MARK: - set

// 빈 Int Set 생성
var intergerSet: Set<Int> = Set<Int>()

// insert를 이용하여 추가 가능. set는 중복값 추가 불가
intergerSet.insert(1)
intergerSet.insert(100)
intergerSet.insert(200)
intergerSet.insert(200)
intergerSet

// 값 유무 확인 contains
intergerSet
intergerSet.contains(1)
intergerSet.contains(2)

// 값 제거위해 remvoe 사용. 값의 수량 파악위해 count 사용
intergerSet.remove(100)
intergerSet
intergerSet.removeFirst()
intergerSet
intergerSet.count

// set 응용
let setA: Set<Int> = [1, 2, 3, 4, 5]
let setB: Set<Int> = [3, 4, 5, 6, 7]

// 합집합 union
let union: Set<Int> = setA.union(setB)

// 정렬 sorted
let sortedUnion: [Int] = union.sorted()

// 교집합 intersection, 차집합 subtracting
let intersecion: Set<Int> = setA.intersection(setB)
let subtracting: Set<Int> = setA.subtracting(setB)
