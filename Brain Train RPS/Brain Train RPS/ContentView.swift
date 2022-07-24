//
//  ContentView.swift
//  Brain Train RPS
//
//  Created by Andrew Holt on 6/7/21.
//  Copyright © 2021 Andrew Holt. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var moves = ["Rock", "Paper", "Scissors"]
    @State private var appMove = 0
    @State private var win = true
    
    @State private var randMove = Int.random(in: 0...2)
    @State private var randObjective = Bool.random()
    
    @State private var score: Int = 0
    
    @State private var showResults = false
    @State private var result = ""
    @State private var alertMessage = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.pink, .purple]), startPoint: .top, endPoint: .bottom)
            
            VStack {
                Text("Score:")
                    .foregroundColor(.white)
                Text("\(score)")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.black)
                Text("Computer's move: \(moves[randMove])")
                    .foregroundColor(.white)
                
                if randObjective {
                    Text("Objective: win")
                        .foregroundColor(.white)
                } else {
                    Text("Objective: lose")
                        .foregroundColor(.white)
                }
                
                ForEach(0..<3) {choice in
                    Button(action: {
                        self.playerMove(choice)
                    }) {
                        Text(self.moves[choice])
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    }
                }
                
            }
            .alert(isPresented: $showResults) {
                Alert(title: Text(result), message: Text(alertMessage), dismissButton: .default(Text("Continue")) {
                    self.nextRound()
                })
            }
        }
    }
    func playerMove(_ choice: Int)
    {
        var winningMove: Int = 2
        //0=loss, 1=win, 2=draw
        
        if choice==0 {
            switch randMove {
            case 0:
                winningMove = 2
            case 1:
                winningMove = 0
            default:
                winningMove = 1
            }
        }
        else if choice==1 {
            switch randMove {
            case 0:
                winningMove = 1
            case 1:
                winningMove = 2
            default:
                winningMove = 0
            }
        }
        else {
            switch randMove {
            case 0:
                winningMove = 0
            case 1:
                winningMove = 1
            default:
                winningMove = 2
            }
        }
        
        if winningMove==0 && randObjective {
            result = "Incorrect"
            alertMessage = "You were supposed to win, not lose!"
        }
        else if winningMove==1 && randObjective {
            score+=1
            result = "Correct"
            alertMessage = "Good job!"
        }
        else if winningMove==2 {
            result = "Incorrect"
            alertMessage = "Incorrect! A draw counts as neither a lose nor a win."
        }
        else if winningMove==0 && !randObjective {
            score+=1
            result = "Correct"
            alertMessage = "Good job!"
        }
        else if winningMove==1 && !randObjective {
            result = "Incorrect"
            alertMessage = "You were supposed to lose, not win!"
        }
        
        showResults = true
    }
    
    func nextRound() {
        randMove = Int.random(in: 0..<3)
        randObjective = Bool.random()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
