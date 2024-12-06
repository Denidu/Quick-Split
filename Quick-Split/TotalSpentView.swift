//
//  TotalSpentView.swift
//  Quick-Split
//
//  Created by Denidu Gamage on 2024-12-06.
//

import SwiftUI

struct TotalSpentView: View {
    @AppStorage("totalExpenses") private var totalExpenses: Double = 0.0
    @State private var newOwe : Double = 0.0
    @State private var total : Double = 0.0
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Overall You spent")
                    .padding()
                    .font(.system(size: 28))
                
                Text("LKR \(String(format: "%.2f", totalExpenses))")
        
                Button("Reset") {
                    totalExpenses = 0.0
                }.padding()
                    .tint(.red)
                    .buttonStyle(.bordered)
            }
            .navigationTitle("Expenses")
        }
    }
}

#Preview {
    TotalSpentView()
}
