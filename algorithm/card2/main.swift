//
//  main.swift
//  algorithm
//
//  Created by 강찬휘 on 2023/04/25.
// public, mutating

import Foundation

struct Deque {
    var queue: [Int?] = []
    var head: Int = 0
    
    public var QueueCount: Int {
        return queue.count
    }
    
    public var IsEmpty: Bool {
        return queue.isEmpty
    }
    
    public mutating func InsertValueBack (_ value: Int) {
        queue.append(value)
    }
    
    public mutating func InsertValueFront (_ value: Int) {
        queue.insert(value, at: 0)
    }
    
    public mutating func DeleteValueBack() -> Int? {
        return IsEmpty ? nil : queue.removeLast()
    }
    
    public mutating func DeleteValueFront() -> Int? {
        let secondValue = queue[head]
        queue[head] = nil
        head += 1
        
        return secondValue
    }
    
    public mutating func final() -> Int? {
        queue.removeLast()
        return queue.removeLast()
    }
}

func FindLastValue(_ card: Int) -> Int? {
    if card == 1 { return 1}
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
//        if deck.QueueCount == 1 {
//            return deck.queue[0]!
//        }
        
        
    }
    return nil
    
}

var card_count = Int(readLine()!)!
let lastValue = FindLastValue(card_count)

if let unwrappedLastValue = lastValue {
    print(unwrappedLastValue)
} else {
    print("404 not found")
}
