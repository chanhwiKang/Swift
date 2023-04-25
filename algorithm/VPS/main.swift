//
//  main.swift
//  algorithm
//
//  Created by 강찬휘 on 2023/04/25.
//

import Foundation

let loop_count = Int(readLine()!)!
for _ in 0..<loop_count {
    var arr = [Character]()
    var isVps = true
    let vps = readLine()!
    for sc in vps {
        if sc == "(" {
            arr.append(sc)
        }
        else {
            if arr.count > 0 {
                arr.removeLast()
            }
            else {
                isVps = false
            }
        }
    }
    if arr.count > 0 {
        isVps = false
    }
  
    isVps ? print("YES") : print("NO")
    
}

