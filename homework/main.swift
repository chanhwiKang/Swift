//  main.swift
//  algorithm
//
//  Created by 강찬휘 on 2023/04/25.

import Foundation

var pcNumbersSet: Set<Int>  = []
var pcNumbers: Array<Int> = []
var userNumbers: Array<Int> = []
var strike: Int = 0
var ball: Int = 0
var loop: Bool = true

CreatePcNumbers()
while loop{
    CreateUserNumbers()
    for i in 0...3{
        CheckNumbers(pcNumbers[i], userNumbers[i])
    }
    loop = Result(strike, ball)
}

func CreatePcNumbers() {
    while pcNumbersSet.count < 4 {
        pcNumbersSet.insert(Int.random(in: 0...9))
        pcNumbers = Array(pcNumbersSet)
    }
}
func CreateUserNumbers() {
    var loopCount = 1
    userNumbers.removeAll()
    loopCount = 1
    while userNumbers.count < 4 {
        print("\(loopCount)번째 숫자를 입력하세요.: ", terminator: "")
        userNumbers.append(Int(readLine()!)!)
        print("")
        loopCount += 1
    }
}
func CheckNumbers(_ pcNumbers: Int, _ userNumbers: Int) -> Void {
    if pcNumbers == userNumbers {
        strike += 1
    }
    else if pcNumbersSet.contains(userNumbers){
        ball += 1
    }
    

}
func Result(_ strike: Int, _ ball: Int) -> Bool{
    if strike != 4 {
        print("\(strike)strike, \(ball)ball")
        print(pcNumbers)
        return true
    }
    
    print("your win")
    return false
}
