//
//  CounterFeatureTest.swift
//  TCASampleAppTests
//
//  Created by Ibrahim Hosseini on 2/18/24.
//

import XCTest
import ComposableArchitecture

@testable import TCASampleApp

@MainActor
final class CounterFeatureTest: XCTestCase {

    func testCounter() async {
        let store = TestStore(initialState: CounterFeature.State()) {
            CounterFeature()
        }

        await store.send(.incrementButtonTapped) {
            $0.count = 1
        }
        await store.send(.decrementButtonTapped) {
            $0.count = 0
        }
    }
}
