//
//  ContentView.swift
//  RandomNumberPickingGameUI_Level1
//
//  Created by gnksbm on 2023/06/19.
//

import SwiftUI

struct ContentView: View {
    // 배열의 배열로 처리해서 index값을 사용?
    var numberArray0: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    var numberArray1: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    var numberArray2: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    var numberArray3: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    var numberArray4: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    
    @State var selectedNums: [Int?] = [nil, nil, nil, nil, nil] {
        didSet {
            var matchCount: Int = 0
            for (index, selectedNum) in selectedNums.enumerated() {
                guard let selectedNum else { return }
                if selectedNum == randomNums[index] {
                    matchCount += 1
                }
            }
            if matchCount > 4 {
                message = "모두 맞추셨습니다!!"
            } else {
                message = "\(matchCount)개 맞추셨습니다"
            }
        }
    }
    @State var randomNums: [Int] = [
        Int.random(in: 0...10),
        Int.random(in: 0...10),
        Int.random(in: 0...10),
        Int.random(in: 0...10),
        Int.random(in: 0...10),
        ]
    
    @State var message: String = ""
    
    var body: some View {
        VStack() {
            HStack() {
                ForEach(numberArray0, id: \.self){ number in
                    Button("\(number)") {
                        selectedNums[0] = number
                    }
                }
            }
            HStack() {
                ForEach(numberArray1, id: \.self){ number in
                    Button("\(number)") {
                        selectedNums[1] = number
                    }
                }
            }
            HStack() {
                ForEach(numberArray2, id: \.self){ number in
                    Button("\(number)") {
                        selectedNums[2] = number
                    }
                }
            }
            HStack() {
                ForEach(numberArray3, id: \.self){ number in
                    Button("\(number)") {
                        selectedNums[3] = number
                    }
                }
            }
            HStack() {
                ForEach(numberArray4, id: \.self){ number in
                    Button("\(number)") {
                        selectedNums[4] = number
                    }
                }
            }
            HStack {
                ForEach(selectedNums, id: \.self) { picker in
                    if picker == nil {
                        Text("X" )
                    } else {
                        Text("\(picker!)" )
                    }
                }
            }
            Text(message)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
