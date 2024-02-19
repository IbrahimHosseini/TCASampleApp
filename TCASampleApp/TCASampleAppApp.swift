//
//  TCASampleAppApp.swift
//  TCASampleApp
//
//  Created by Ibrahim on 2/18/24.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCASampleAppApp: App {
    
    static let store = Store(initialState: CounterFeature.State()) {
        CounterFeature()
            ._printChanges()
    }

    static let appStore = Store(initialState: AppFeature.State()) {
        AppFeature()
    }

    var body: some Scene {
        WindowGroup {
//            ContentView(store: TCASampleAppApp.store)
            AppView(store: TCASampleAppApp.appStore)
        }
    }
}
