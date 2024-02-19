//
//  AppFeatureTests.swift
//  TCASampleAppTests
//
//  Created by Ibrahim Hosseini on 2/19/24.
//

import XCTest
import ComposableArchitecture

@testable import TCASampleApp

@MainActor
final class AppFeatureTests: XCTestCase {

    func testIncrementInFirstTab() async {
        let store = TestStore(initialState: AppFeature.State()) {
            AppFeature()
        }

        await store.send(.tab1(.incrementButtonTapped)) {
            $0.tab1.count = 1
        }
    }
}
