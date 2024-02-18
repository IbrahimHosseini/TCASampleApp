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

    private let buttonFontSize = 40.0
    private let radius = 10.0
    private let size = 80.0

    var body: some View {
        VStack {
            HStack(spacing: 8) {
                Button("-") {
                    store.send(.decrementButtonTapped)
                }
                .font(.system(size: buttonFontSize))
                .frame(width: size, height: size)
                .background(Color.black.opacity(0.1))
                .clipShape(.circle)

                Text("\(store.count)")
                    .font(.system(size: 60, weight: .bold))
                    .frame(width: size)
                    .clipShape(.rect(cornerRadius: radius))

                Button("+") {
                    store.send(.incrementButtonTapped)
                }
                .font(.system(size: buttonFontSize))
                .frame(width: size, height: size)
                .background(Color.black.opacity(0.1))
                .clipShape(.circle)

            }
            .fixedSize()
        }

        Button(store.isTimerRunning ? "Stop Timer" : "Start Timer") {
            store.send(.toggleTimerButtonTapped)
        }
        .font(.system(size: buttonFontSize))
        .padding()
        .background(Color.black.opacity(0.1))
        .clipShape(.rect(cornerRadius: radius))

        Button("Fact"){
            store.send(.factButtonTapped)
        }
        .font(.largeTitle)
        .padding()
        .background(Color.black.opacity(0.1))
        .clipShape(.rect(cornerRadius: radius))

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
