//
//  ContentView.swift
//  Quick-Split
//
//  Created by Denidu Gamage on 2024-12-06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            CalculatorView().tabItem {
                Label("Calculator", systemImage: "calendar.badge.checkmark")
            }
            TotalSpentView().tabItem {
                Label("List", systemImage: "list.bullet")
            }
        }
    }
}

#Preview {
    ContentView()
}
