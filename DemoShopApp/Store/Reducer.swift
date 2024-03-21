//
//  Reducer.swift
//  DemoShopApp
//
//  Created by Steven Zeng on 2024/3/16.
//

import Foundation

extension Store {
    func reducer(state: inout AppState, action: AppAction, environment: Environment) -> Task<AppAction, Error>? {
        switch action {
        case .getList:
            return Task {
                let items = await environment.service.getList()
                return .setList(items: items)
            }
        case let .setList(items):
            state.list = items
        case .getCart:
            return Task {
                let items = await environment.service.getCart()
                return .setCart(items: items)
            }
        case let .setCart(items):
            state.cart = items
        case let .addToCart(item):
            return Task {
                let items = await environment.service.addToCart(item: item)
                return .setCart(items: items)
            }
        }
        return nil
    }
}
