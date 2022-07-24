//
//  ContentView.swift
//  Edutainment
//
//  Created by Andrew Holt on 6/9/21.
//  Copyright © 2021 Andrew Holt. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var maxNum = 10
    @State private var questionNum = 10
    @State private var answer = ""
    
    @State private var int1Prev = [Int]()
    @State private var int2Prev = [Int]()
    
    @State private var play = false
    
    @State private var int1 = 0
    @State private var int2 = 0
    
    var answerInt: Int {
        return Int(answer) ?? 0
    }
    
    var body: some View {
        Group {
            if !play {
                VStack {
                    Stepper("Practice multiplication up to", value: $maxNum, in: 1...12)
                    Stepper("Number of questions", value: $questionNum, in: 5...20, step: 5)
                    
                    Button(action: {self.playGame()}) {
                        Text("Play game!")
                    }
                }
            }
            if play {
                VStack {
                    Text("What is \(int1) x \(int2)?")
                    TextField("Answer: ", text: $answer)
                    Button(action: {self.checkAnswer()}) {
                        Text("Submit")
                    }
                }
            }
        }
    }
    
    func checkAnswer() {
        if int1 * int2 == answerInt {
            s
        }
    }
    
    func playGame() {
        generatePair()
        play = true
    }
    
    func generatePair() {
        for _ in 1...questionNum {
            var same: Bool = true
            var int1a = 0
            var int2a = 0
            
            while same {
                int1a = Int.random(in: 1...maxNum)
                int2a = Int.random(in: 1...maxNum)
                
                if !int1Prev.contains(int1a) && !int2Prev.contains(int2a) {
                    same = false
                    int1Prev.append(int1a)
                    int2Prev.append(int2a)
                }
            }
            
            int1 = int1a
            int2 = int2a
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
