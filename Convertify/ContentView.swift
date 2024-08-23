//
//  ContentView.swift
//  Convertify
//
//  Created by Izabela Marcinkowska on 2024-08-23.
//

import SwiftUI

struct ContentView: View {
    @State private var temperatureInput: Double = 0
    
    var celciusToKelvin: Double {
        let kelvinResult = temperatureInput + 273.15
        return kelvinResult
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
            }
            .navigationTitle("Convertify")
        }
    }
}

#Preview {
    ContentView()
}
