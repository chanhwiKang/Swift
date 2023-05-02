//  main.swift
//  algorithm
//
//  Created by 강찬휘 on 2023/04/25.

import Foundation

var numbers1: [Int] = Array(0...9)
var numbers2: [Int] = Array(0...9)
var numbers3: [Int] = Array(0...9)
var num1: Int = 0
var num2: Int = 0
var num3: Int = 0
var candidate1: [Int] = []
var candidate2: [Int] = []
var candidate3: [Int] = []
var strikeBall: [Int] = []
var answer1: [Int] = []
var answer2: [Int] = []
var answer3: [Int] = []
var beforeStrike: Int = 0
var finder: Int = 0
var changeAllNum: Bool = true
var key: Bool = false
var loop: Bool = true
var answerCnt: Int = 0
while loop {
    QuestionNumbers()
    GetStrikeBall()
    FindNumbers()
}

func QuestionNumbers() {
    var selectedNum1: Int
    var selectedNum2: Int
    var selectedNum3: Int
    
    if changeAllNum { // 각 숫자간 중복 피하기
        selectedNum1 = numbers1[num1]
        if numbers1[num1] == numbers2[num2]{
            num2 += 1
            selectedNum2 = numbers2[num2]
        } else { selectedNum2 = numbers2[num2] }
        if numbers1[num1] == numbers3[num3] || numbers2[num2] == numbers3[num3]{
            num3 += 1
            if numbers1[num1] == numbers3[num3] || numbers2[num2] == numbers3[num3]{
                num3 += 1
                selectedNum3 = numbers3[num3]
            }
            else { selectedNum3 = numbers3[num3] }
        } else { selectedNum3 = numbers3[num3] }
        changeAllNum = false
    }
    else {
        selectedNum1 = numbers1[num1]
        selectedNum2 = numbers2[num2]
        selectedNum3 = numbers3[num3]
    }
    print(selectedNum1, selectedNum2, selectedNum3,"?")
    
}
func GetStrikeBall() {
    if strikeBall.isEmpty == false { beforeStrike = strikeBall[0]}
    print("Strike와 Ball수를 알려주세요. 예)0 1: ", terminator: "")
    strikeBall = readLine()!.split(separator: " ").map { Int(String($0))! }
}
func FindNumbers(){
    
    
    if strikeBall[0] + strikeBall[1] == 0 { // strike, ball 모두 없는가
        changeAllNum = true
        DelNum(numbers1[num1], numbers2[num2] , numbers3[num3])
    }
    else if strikeBall[0] + strikeBall[1] <= 2{
        if candidate1.isEmpty {
            Candidate(numbers1[num1], numbers2[num2], numbers3[num3])
        }
        else { // strike + ball의 수가 1개 혹은 2개이면서, candidate 작성이 되었는가 
            if strikeBall[0] + strikeBall[1] == 2 { // strike + ball의 수가 2개인가
                
                if strikeBall[1] > 0 { // 1s 1b or 0s 2b
                    if strikeBall[0] == 1 && strikeBall[1] == 1{ // 1s 1b
                        if finder == 0 {
                            finder = 2
                            key = true
                        }
                        else if key == true {
                            AddAnswer(3, 3, 3)
                            answerCnt += 2
                        }
                            
                    } else { //0s 2b
                        
                        if finder != 2 {
                            finder += 1
                        }
                        else {
                            AddAnswer(4, 4, 4)
                            answerCnt += 2
                        }
                    }
                }
                else if strikeBall[0] == 2 { //2s 0b
                    AddAnswer(finder, finder, finder)
                    answerCnt += 2
                }
            }
            else if strikeBall[0] + strikeBall[1] == 1 { // 1s 0b or 0s 1b
                if strikeBall[0] == 1 { // 1s 0b
                    answerCnt += 1
                }
                else { // 0s 1b
                    finder += 1
                }
            }
        }
    }
    else if strikeBall[0] == 3 || answerCnt == 3 { // stirke가 3개 or 3개를 다 찾음
        if answerCnt == 3 {
            
        }
        // 답을 말해주고 game set
    }
    else if strikeBall[0] + strikeBall [1] == 3 { // 0s 3b, 1s 2b
        
    }
    
    if candidate1.count != 0{
        num1 = candidate1[finder]
        num2 = candidate2[finder]
        num3 = candidate3[finder]
    }
    else {
        num1 = 0
        num2 = 0
        num3 = 0
    }
    
}
func Candidate(_ numA: Int, _ numB: Int, _ numC: Int, _ a: Int = 0){
    if a == 0 {
        if strikeBall[0] + strikeBall[1] == 2 {
            candidate1.append(numA)
            candidate1.append(numB)
            candidate1.append(numB)
            candidate1.append(numC)
            candidate1.append(numC)
            
            candidate2.append(numC)
            candidate2.append(numA)
            candidate2.append(numC)
            candidate2.append(numA)
            candidate2.append(numB)
            
            candidate3.append(numB)
            candidate3.append(numC)
            candidate3.append(numA)
            candidate3.append(numB)
            candidate3.append(numA)
        }
        else if strikeBall[0] + strikeBall[1] == 1 {
            candidate1.append(numC)
            candidate2.append(numA)
            candidate3.append(numB)
            
            candidate1.append(numB)
            candidate2.append(numC)
            candidate3.append(numA)
        }
    }
    else if a == 1{ // 1s 0b를 먼저 찾고 2s 0b를 찾은 경우
        // 이미 1s(a, b, c)가 있고 2s(d, e, f)를 찾았다면
        //(a, e, f), (d, b, f), (d, e, c) 순서대로 넣는다
        
    }
    else if a == 2{ // 2s 0b를 먼저 찾고 1s 0b를 찾은 경우
        // 이미 2s(a, b, c)가 있고 1s(d, e, f)를 찾았다면
        // (d, b, c), (a, e, c), (a, b, f) 순서대로 넣는다
    }
}
func AddAnswer(_ a: Int, _ b: Int, _ c: Int){
    answer1.append(candidate1[a])
    answer2.append(candidate2[b])
    answer3.append(candidate3[c])
    DelNum(candidate1[a], candidate2[b], candidate3[c])
    if answer1.count == 2 && answerCnt == 2 { // 1s 0b를 두번 찾았다면
        // 2s 0b를 찾기위한 candidate를 생성한다
        // 찾아서 answer1[0]에 넣고 다른 index는 삭제한다
    }
    else if answer1.count == 2 && answerCnt == 3 { // 1s 0b, 2s 0b를 찾은 경우
        candidate1.append(answer1[1])
        candidate1.append(answer1[0])
        //candidate1.appnd
        
        
    }
}
func DelNum(_ a: Int, _ b: Int, _ c: Int) {
    var chk :Int = 0
    var i :Int = 0
    while true {
        if a == numbers1[i] || b == numbers1[i] || c == numbers1[i]{
            numbers1.remove(at: i)
            numbers2.remove(at: i)
            numbers3.remove(at: i)
            chk += 1
            i = 0
        }
        else {i += 1}
        
        if chk == 3 { break }
    }
    candidate1.removeAll()
    candidate2.removeAll()
    candidate3.removeAll()
    changeAllNum = true
}

