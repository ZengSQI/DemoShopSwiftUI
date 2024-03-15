//
//  Store.swift
//  DemoShopApp
//
//  Created by Steven Zeng on 2024/3/16.
//

import Foundation

@MainActor
final class Store: ObservableObject {
    @Published private(set) var state: AppState

    private let environment: Environment

    init(initialState: AppState, environment: Environment) {
        self.state = initialState
        self.environment = environment
    }

    @discardableResult
    func dispatch(_ action: AppAction) -> Task<Void, Never>? {
        Task {
            if let task = reducer(state: &state, action: action, environment: environment) {
                do {
                    let action = try await task.value
                    dispatch(action)
                } catch {
                    print(error)
                }
            }
        }
    }
}

extension Store {
    func reducer(state: inout AppState, action: AppAction, environment: Environment) -> Task<AppAction, Error>? {
        switch action {
        case .getList:
            return Task {
                let list = await environment.service.getList()
                return .setList(items: list)
            }
        case .setList(items: let items):
            state.list = items
        case .addToCart(item: let item):
            break
        }
        return nil
    }
}

extension Store {
    static var previewStore: Store {
        return Store(
            initialState: AppState(list: []),
            environment: Environment(service: MockService())
        )
    }
}
