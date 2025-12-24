//
//  ContentView.swift
//  CheckMate
//
//  Created by Alex Senu on 17/7/25.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCoount = Double(numberOfPeople)     //to fix problem that shows number of people 4 instead of 2
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCoount
        
        return amountPerPerson
        
    }
    
    var totalAmount: Double {
        return checkAmount + (checkAmount * Double(tipPercentage) / 100)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "EUR"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                        .accessibilityIdentifier("amountField")
                    
                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach(2..<100){ people in
                            Text("\(people) people").tag(people) //.tag για να φτιαξει το προβλημα με τα 2 ατομα απο 4
                        }
                    }
                    //.pickerStyle(.navigationLink)
                }.cardStyle()
                
                Section("How much do you want to tip?"){
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<101) { Text("\($0)%").tag($0) }
                    }.accessibilityIdentifier("tipPicker")
                    //.pickerStyle(.segmented)
                    //.pickerStyle(.navigationLink)
                }.cardStyle()
                
                Section("Amount per person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "EUR"))
                        .accessibilityIdentifier("perPersonLabel")
                }.cardStyle()
                
                Section("Total amount") {
                    Text(totalAmount, format: .currency(code: Locale.current.currency?.identifier ?? "EUR"))
                        .accessibilityIdentifier("totalLabel")
                }.cardStyle()
                
            }
            
            .navigationTitle("CheckMate")
            .scrollContentBackground(.hidden)
            .background(Color("AppBackground").ignoresSafeArea())
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
