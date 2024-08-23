//
//  ContentView.swift
//  Convertify
//
//  Created by Izabela Marcinkowska on 2024-08-23.
//

import SwiftUI

struct ContentView: View {
    @State private var temperatureInput: Double = 0
    @State private var chosenUnit: String = ""
    @State private var requestedUnit: String = ""
    
    let units = ["C", "F", "K"]
    
    var celciusToKelvin: Double {
        let kelvinResult = temperatureInput + 273.15
        return kelvinResult
    }
    
    var celciusToF: Double {
        let FResult = (9/5 * temperatureInput) + 32
        return FResult
    }
    
    var kelvinToCelcius: Double {
        let kelvinResult = temperatureInput - 273.15
        return kelvinResult
    }
    
    var kelvinToF: Double {
        let FResult = (temperatureInput - 273.15) * 9/5 + 32
        return FResult
    }
    
    var FToCelcius: Double {
        let celciusResult = (temperatureInput - 32) * 5/9
        return celciusResult
    }
    
    var FToKelvin: Double {
        let kelvinResult = (temperatureInput - 32) * 5/9 + 273.15
        return kelvinResult
    }
    
    var showResult: Double {
        if chosenUnit == "C" && requestedUnit == "K" {
            return celciusToKelvin
        } else if ( chosenUnit == "C" && requestedUnit == "F") {
            return celciusToF
        } else if ( chosenUnit == "K" && requestedUnit == "C") {
            return kelvinToCelcius
        } else if ( chosenUnit == "K" && requestedUnit == "F") {
            return kelvinToF
        } else if ( chosenUnit == "F" && requestedUnit == "C") {
            return FToCelcius
        } else if ( chosenUnit == "F" && requestedUnit == "K") {
            return FToKelvin
        } else {
            return temperatureInput
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section ("Temperature") {
                    TextField("Temperature", value: $temperatureInput, format: .number)
                        .keyboardType(.decimalPad)
                    Picker("Number of people", selection: $chosenUnit) {
                        ForEach(units, id: \.self) {
                            Text("\($0)")
                        }
                    }.pickerStyle(.segmented)
                }
                Section {
                    Text( showResult, format: .number)
                    Picker("Number of people", selection: $requestedUnit) {
                        ForEach(units, id: \.self) {
                            Text("\($0)")
                        }
                    }.pickerStyle(.segmented)
                }
            }
            .navigationTitle("Convertify")
        }
    }
}

#Preview {
    ContentView()
}
