//
//  AppFeature.swift
//  TCASampleApp
//
//  Created by Ibrahim Hosseini on 2/19/24.
//

import SwiftUI
import ComposableArchitecture

struct AppView: View {
    let store: StoreOf<AppFeature>

    var body: some View {
        TabView {

            AppView(store: store.scope(state: \.tab1, action: \.tab1))
                .tabItem {
                    Text("Counter 1")
                }

            ContentView(store: store.scope(state: \.tab2, action: \.tab2))
                .tabItem {
                    Text("Counter 2")
                }
        }
    }
}


@Reducer
struct AppFeature {
    
    struct State: Equatable {
        var tab1 = CounterFeature.State()
        var tab2 = CounterFeature.State()
    }

    enum Action: Equatable {
        case tab1(CounterFeature.Action)
        case tab2(CounterFeature.Action)
    }

    var body: some ReducerOf<Self> {

        Scope(state: \.tab1, action: \.tab1) {
            CounterFeature()
        }

        Scope(state: \.tab2, action: \.tab2) {
            CounterFeature()
        }

        Reduce { state, action in

            return .none
        }
    }
}

#Preview {
    AppView(
        store: Store(initialState: AppFeature.State()) {
            AppFeature()
        }
    )
}
