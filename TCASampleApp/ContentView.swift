//
//  ContentView.swift
//  TCASampleApp
//
//  Created by Ibrahim on 2/18/24.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    let store: StoreOf<CounterFeature>
    
    var body: some View {
        VStack {
            HStack(spacing: 8) {
                Button("-") {
                    store.send(.decrementButtonTapped)
                }
                .font(.system(size: 45))
                .frame(width: 100, height: 100)
                .background(Color.black.opacity(0.1))
                .clipShape(.circle)
                Text("\(store.count)")
                    .font(.system(size: 45))
                    .frame(width: 75)
                    .clipShape(.rect(cornerRadius: 10))
                Button("+") {
                    store.send(.incrementButtonTapped)
                }
                .font(.system(size: 45))
                .frame(width: 100, height: 100)
                .background(Color.black.opacity(0.1))
                .clipShape(.circle)
            }
            .fixedSize()
        }
        Button("Fact"){
            store.send(.factButtonTapped)
        }
        .font(.largeTitle)
        .padding()
        .background(Color.black.opacity(0.1))
        .clipShape(.rect(cornerRadius: 10))
        
        if store.isLoading {
            ProgressView()
        } else if store.fact != nil {
            Text("Fact")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

#Preview {
    ContentView(store: Store(initialState: CounterFeature.State()) {
        CounterFeature()
    })
}
