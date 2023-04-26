//
//  main.swift
//  algorithm
//
//  Created by 강찬휘 on 2023/04/25.
// deque의 구현과 응용. 더 적은 메모리로 문제 해결이 가능했지만, 시간복잡도 측면에선 우위였음. 

import Foundation

struct Deque { // 덱 구현
    var queue: [Int?] = []
    var head: Int = 0
    
    public var QueueCount: Int {
        return queue.count
    }
    
    public var IsEmpty: Bool {
        return queue.isEmpty
    }
    
    public mutating func InsertValueBack (_ value: Int) { // append를 이용한 stack식 입력
        queue.append(value)
    }
    
    public mutating func InsertValueFront (_ value: Int) { // insert를 이용한 queue식 입력
        queue.insert(value, at: 0)
    }
    
    public mutating func DeleteValueBack() -> Int? { // array가 비어있다면 nil 반환. 그렇지 않다면 가장 뒤의 값 삭제 및 반환
        return IsEmpty ? nil : queue.removeLast()
    }
    
    public mutating func DeleteValueFront() -> Int? {
        //return IsEmpty ? nil : queue.removeFirst() // deque 구현만이 목적이었으면 이렇게 쓰면 됨.
        
        let secondValue = queue[head] // 호출 당할 때 마다 0번째 index 부터 nil 값으로 바꾸어 오버헤드를 줄임
        queue[head] = nil
        head += 1
        
        return secondValue
    }
    
    public mutating func final() -> Int? { // 문제 해결이 초점이기에 추가한 함수 depue의 순수한 구현과는 상관 없다.
        queue.removeLast()
        return queue.removeLast()
    }
}

func FindLastValue(_ card: Int) -> Int? {
    if card == 1 { return 1} // 입력이 1이면, 볼것없으므로 출력
    var deck = Deque()
    for i in 1...card {
        deck.InsertValueBack(i)
    }
    
    while true {
        _ = deck.DeleteValueFront()
        guard let second = deck.DeleteValueFront() else { break }
        
        
        deck.InsertValueBack(second)
        if deck.queue[deck.QueueCount - 2] == nil {
            return (deck.queue.last)!
        }
        
    }
    return nil
    
}

var card_count = Int(readLine()!)!
let lastValue = FindLastValue(card_count)

if let unwrappedLastValue = lastValue {
    print(unwrappedLastValue)
} else {
    print("404 not found") // 장난으로 넣은 것
}
