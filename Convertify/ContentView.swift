//
//  ContentView.swift
//  Convertify
//
//  Created by Izabela Marcinkowska on 2024-08-23.
//

import SwiftUI

struct ContentView: View {
    @State private var temperatureInput: Double = 0
    @State private var chosenUnit: Unit = Unit.C
    @State private var requestedUnit: Unit = Unit.F
    
    enum Unit {
        case C, F, K
    }
    
    
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
        if chosenUnit == Unit.C && requestedUnit == Unit.K {
            return celciusToKelvin
        } else if ( chosenUnit == Unit.C && requestedUnit == Unit.F) {
            return celciusToF
        } else if ( chosenUnit == Unit.K && requestedUnit == Unit.C) {
            return kelvinToCelcius
        } else if ( chosenUnit == Unit.K && requestedUnit == Unit.F) {
            return kelvinToF
        } else if ( chosenUnit == Unit.F && requestedUnit == Unit.C) {
            return FToCelcius
        } else {
            return FToKelvin
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Temperature", value: $temperatureInput, format: .number)
                        .keyboardType(.decimalPad)
                }
                Section {
                    Text( celciusToKelvin, format: .number)
                }
                Section {
                    Text( celciusToF, format: .number)
                }
            }
            .navigationTitle("Convertify")
        }
    }
}

#Preview {
    ContentView()
}
