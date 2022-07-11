//
//  ContentView.swift
//  WeConverted
//
//  Created by Demid Zabrodsky on 06.06.2022.
//

import SwiftUI

struct ContentView: View {
    
    let timeMeasures = ["Days", "Hours", "Minutes", "Seconds"]
    @State private var inputMeasure = "Days"
    @State private var outputMeasure = "Hours"
    
    @State private var inputValue = 0.0
    
    var resultInSeconds:Double {
        switch inputMeasure {
            case "Days": return inputValue * 86_400
            case "Hours": return inputValue * 3_600
            case "Minutes": return inputValue * 60
            case "Seconds" : return inputValue
        default: return 0
        }
    }
    
    var result:Double {
        switch outputMeasure {
            case "Days": return resultInSeconds / 86_400
            case "Hours": return resultInSeconds / 3_600
            case "Minutes": return resultInSeconds / 60
            case "Seconds" : return resultInSeconds
        default: return 0
        }
    }
   
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Choose input measure", selection: $inputMeasure){
                        ForEach(timeMeasures, id: \.self) { measure in
                            Text(measure)
                        }
                    }.pickerStyle(.segmented)
                                        
                } header: {
                    Text("Choose input unit")
                }
                Section {
                    TextField("Input value", value: $inputValue, format: .number).keyboardType(.decimalPad)
                } header: {
                    Text("your value")
                }
                
                Section {
                    Picker("Choose output measure", selection: $outputMeasure){
                        ForEach(timeMeasures, id: \.self) { measure in
                            Text(measure)
                        }
                    }.pickerStyle(.segmented)
                                        
                } header: {
                    Text("Choose output unit")
                }
                
                Section {
                    Text(result, format: .number)
                } header: {
                    Text("result")
                }
                
            }.navigationTitle("Time Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
