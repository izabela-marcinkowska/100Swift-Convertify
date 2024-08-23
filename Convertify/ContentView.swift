//
//  ContentView.swift
//  Convertify
//
//  Created by Izabela Marcinkowska on 2024-08-23.
//

import SwiftUI

struct ContentView: View {
    @State private var temperatureInput: Double = 0
    @State private var chosenUnit: String = "C"
    @State private var requestedUnit: String = "C"
    
    let units = ["C", "F", "K"]
    
    var showResult: Double {
        if chosenUnit == "C" && requestedUnit == "K" {
            return temperatureInput + 273.15
        } else if ( chosenUnit == "C" && requestedUnit == "F") {
            return (9/5 * temperatureInput) + 32
        } else if ( chosenUnit == "K" && requestedUnit == "C") {
            return temperatureInput - 273.15
        } else if ( chosenUnit == "K" && requestedUnit == "F") {
            return (temperatureInput - 273.15) * 9/5 + 32
        } else if ( chosenUnit == "F" && requestedUnit == "C") {
            return (temperatureInput - 32) * 5/9
        } else if ( chosenUnit == "F" && requestedUnit == "K") {
            return (temperatureInput - 32) * 5/9 + 273.15
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
                    Picker("Unit", selection: $chosenUnit) {
                        ForEach(units, id: \.self) {
                            Text("\($0)°")
                        }
                    }.pickerStyle(.segmented)
                }
                Section ("Converted temperature"){
                    Text( showResult, format: .number)
                    Picker("Unit", selection: $requestedUnit) {
                        ForEach(units, id: \.self) {
                            Text("\($0)°")
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
