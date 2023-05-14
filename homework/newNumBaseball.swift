var num = Array<Int>(1...9)
var answer: [Int] = []
var candi: [Int] = []
var except: [Int] = []
var strikeBall: [Int] = []
var num0: Int = 0
var num1: Int = 0
var num2: Int = 0
var numCount: Int = 0

num.shuffle()
while true{
    if num.count >= 7{
        if answer.count == 0{ Filter() }
        else {
            Lucky()
            break
        }
    }else {
        FindNum()
        break
    }
}
print("End")

func Filter(){
    // numCount 변수를 지역변수로 쓰고 싶었음.
    num0 = num.popLast()!
    num1 = num.popLast()!
    num2 = num.popLast()!
    
    InOutput(num0, num1, num2)
    
    if strikeBall.reduce(0, +) == 3{
        answer.append(num0)
        answer.append(num1)
        answer.append(num2)
        num.insert(num0, at: 0)
        num.insert(num1, at: 0)
        num.insert(num2, at: 0)
    }else if strikeBall.reduce(0, +) == 0{
        except.append(num0)
        except.append(num1)
        except.append(num2)
    }else {
        candi.append(num0)
        candi.append(num1)
        candi.append(num2)
        num.insert(num0, at: 0)
        num.insert(num1, at: 0)
        num.insert(num2, at: 0)
    }
    
    if numCount==2{
        num.removeAll()
        num.append(contentsOf: candi)
        candi.removeAll()
        num.shuffle()
        numCount = 0
    }else { numCount += 1 }
}

func FindNum(){
    for i in 0..<num.count{
        num0 = num[i]
        num1 = except[0]
        num2 = except[1]
        
        InOutput(num0, num1, num2)
        
        if strikeBall[0] == 1{
            answer.append(num[i])
            num.remove(at: i)
            break
        }
    }
    for i in 0..<num.count{
        num0 = answer[0]
        num1 = num[i]
        num2 = except[1]
        
        InOutput(num0, num1, num2)
        
        if strikeBall[0] == 2{
            answer.append(num[i])
            num.remove(at: i)
            break
        }
    }
    for i in 0..<num.count{
        num0 = answer[0]
        num1 = answer[1]
        num2 = num[i]
        
        InOutput(num0, num1, num2)
        
        if strikeBall[0] == 3{
            answer.append(num[i])
            num.remove(at: i)
            break
        }
    }
    
    
}

func Lucky(){
    var move = 0
    while true{
        move = answer.popLast()!
        answer.insert(move, at: 0)
        
        InOutput(answer[0], answer[1], answer[2])
        
        if strikeBall[0] == 3{
            break
        }
    }
}

func InOutput(_ one: Int, _ two: Int, _ three: Int){
    print(one, two, three)
    print("Strike와 Ball을 입력해주세요.: ", terminator: "")
    strikeBall = readLine()!.split(separator: " ").map { Int(String($0))! }
}
