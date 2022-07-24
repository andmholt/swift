//
//  ContentView.swift
//  Unit Conversion
//
//  Created by Andrew Holt on 6/6/21.
//  Copyright © 2021 Andrew Holt. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var inputNum = ""
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    
    //convert to mm
    var convertedInput: Double {
        let _input = Double(inputNum) ?? 0
        
        switch inputUnit {
        case 0:
            return _input
        case 1:
            return _input * 60
        case 2:
            return _input * 60 * 60
        case 3:
            return _input * 60 * 60 * 24
        case 4:
            return _input * 60 * 60 * 24 * 7
        case 5:
            return _input * 60 * 60 * 24 * 7 * 4
        case 6:
            return _input * 60 * 60 * 24 * 7 * 4 * 12
        default:
            return 0
        }
    }
    
    var outputNum: Double {
        
        switch outputUnit {
        case 0:
            return convertedInput
        case 1:
            return convertedInput / 60
        case 2:
            return convertedInput / 60 / 60
        case 3:
            return convertedInput / 60 / 60 / 24
        case 4:
            return convertedInput / 60 / 60 / 24 / 7
        case 5:
            return convertedInput / 60 / 60 / 24 / 7 / 4
        case 6:
            return convertedInput / 60 / 60 / 24 / 7 / 4 / 12
        default:
            return 0
        }
        
    }
    
    let unitTypes = ["seconds", "minutes", "hours", "days", "weeks", "months", "years"]
    
    var body: some View
    {
        NavigationView {
            Form {
                Section(header: Text("Input")) {
                    TextField("In unit amount", text: $inputNum)
                        .keyboardType(.decimalPad)
                    
                    Picker("In unit type", selection: $inputUnit) {
                        ForEach(0..<unitTypes.count) {
                            Text("\(self.unitTypes[$0])")
                        }
                    }
                .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Output")) {
                    Picker("Out unit type", selection: $outputUnit) {
                        ForEach(0..<unitTypes.count) {
                            Text("\(self.unitTypes[$0])")
                        }
                    }
                    
                    Text("\(outputNum)")
                }
            }
            .navigationBarTitle("Time Conversion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
