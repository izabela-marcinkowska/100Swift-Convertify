//
//  ContentView.swift
//  Convertify
//
//  Created by Izabela Marcinkowska on 2024-08-23.
//

import SwiftUI

struct ContentView: View {
    @State private var temperatureInput = 0
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Temperature", value: $temperatureInput, format: .number)
                        .keyboardType(.decimalPad)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
