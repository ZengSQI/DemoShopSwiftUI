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
        case let .deleteCartItem(item):
            return Task {
                let items = await environment.service.deleteCart(item: item)
                return .setCart(items: items)
            }
        case let .makeOrder(items):
            Task {
                await environment.service.makeOrder(items: items)
            }
        case .getHistoryOrder:
            return Task {
                let orders = await environment.service.getHistoryOrders()
                return .setHistoryOrder(orders: orders)
            }
        case let .setHistoryOrder(orders):
            state.historyOrders = orders
        }
        return nil
    }
}
