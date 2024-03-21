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
    static var previewStore: Store {
        return Store(
            initialState: AppState(
                list: ShopItem.testObjects,
                cart: ShopItem.testObjects.prefix(2).map { CartItem(item: $0) }, 
                historyOrders: [
                    HistoryOrder(items: ShopItem.testObjects.prefix(3).map { CartItem(item: $0) }),
                    HistoryOrder(items: ShopItem.testObjects.prefix(1).map { CartItem(item: $0) })
                ]
            ),
            environment: Environment(service: MockService())
        )
    }
}
