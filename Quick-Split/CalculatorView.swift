//
//  CalculatorView.swift
//  Quick-Split
//
//  Created by Denidu Gamage on 2024-12-06.
//

import SwiftUI

struct CalculatorView: View {
    @State private var totalAmount: Double? = nil
    @State private var tip: Double? = nil
    @State private var numberOfPeople: Int? = nil
    @AppStorage("yourOwe") private var yourOwe : Double = 0.0
    @AppStorage("totalExpenses") private var totalExpenses: Double = 0.0
    @State private var showAlert = false
    @State private var alertMessage : String = ""
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Total Amount", value: $totalAmount, formatter: NumberFormatter())
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(Color.gray,lineWidth: 2)
                    }
                    .keyboardType(.decimalPad)
                    
                
                TextField("Tip Amount", value: $tip, formatter: NumberFormatter())
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(Color.gray,lineWidth: 2)
                    }
                    .keyboardType(.decimalPad)
                
                TextField("Number of People", value: $numberOfPeople, formatter: NumberFormatter())
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(Color.gray,lineWidth: 2)
                    }
                    .keyboardType(.decimalPad)
                
                
                Button("Calculate") {
                    if validateFields(){
                        calculateOwe()
                        showAlert = true
                    }
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Your Owe"),
                        message: Text("LKR \(String(format: "%.2f", yourOwe))"),
                        primaryButton: .default(
                            Text("Save to Expenses"),
                            action: saveToExpenses
                        ),
                        secondaryButton: .destructive(
                            Text("Cancel"),
                            action: resetTextFields
                        )
                    )
                }
                .padding()
                .tint(.green)
                .buttonStyle(.bordered)
                
                Spacer()
            }
            .onAppear{
                resetTextFields()
            }
            .padding()
            .navigationTitle("QuickSplit")
        }
    }
    
    func calculateOwe() {
        guard let totalAmount = totalAmount, let tip = tip, let numberOfPeople = numberOfPeople else { return }
        
        yourOwe = (totalAmount + tip) / Double(numberOfPeople)
        totalExpenses += yourOwe 
    }
    
    func resetTextFields(){
        totalAmount = nil
        tip = nil
        numberOfPeople = nil
    }
    
    func saveToExpenses() {
        totalExpenses += yourOwe
        resetTextFields()
    }
    
    func validateFields() -> Bool {
           if totalAmount == nil || totalAmount! <= 0 {
               alertMessage = "Please enter a valid total amount."
               showAlert = true
               return false
           }
           
           if tip == nil || tip! < 0 {
               alertMessage = "Please enter a valid tip amount."
               showAlert = true
               return false
           }
           
           if numberOfPeople == nil || numberOfPeople! <= 0 {
               alertMessage = "Please enter a valid number of people."
               showAlert = true
               return false
           }
           
           return true
       }
}

#Preview {
    CalculatorView()
}
