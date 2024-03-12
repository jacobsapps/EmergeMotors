//
//  ContentView.swift
//  EmergeMotors
//
//  Created by Jacob Bartlett on 08/03/2024.
//

import EmergeUI
import SwiftUI
import SwiftUILayouts

struct ContentView: View {
    
    @State private var isLoading = true
    
    var body: some View {
        NavigationStack {
            contentBody
                .navigationTitle("Emerge Motors")
        }
    }
    
    @ViewBuilder
    private var contentBody: some View {
        if isLoading {
            LoadingAnimation()
                .task {
                    try? await Task.sleep(for: .seconds(2))
                    withAnimation {
                        isLoading.toggle()
                    }
                }
                .frame(alignment: .center)
            
        } else {
            ScrollView {
                VerticalWaterfallLayout(columns: 2) {
                    ForEach(Car.sample()) {
                        CarView(car: $0)
                    }
                }
                .padding()
                
                Text("Images from Unsplash")
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
}

#Preview {
    ContentView()
}
