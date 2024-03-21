//
//  Service.swift
//  DemoShopApp
//
//  Created by Steven Zeng on 2024/3/16.
//

import Foundation

protocol Service {
    func getList() async -> [ShopItem]
    func getCart() async -> [CartItem]
    func addToCart(item: ShopItem) async -> [CartItem]
    func deleteCart(item: CartItem) async -> [CartItem]
    func makeOrder(items: [CartItem]) async -> HistoryOrder
    func getHistoryOrders() async -> [HistoryOrder]
}

class AppService: Service {
    func getList() async -> [ShopItem] {
        return []
    }

    func getCart() async -> [CartItem] {
        return []
    }

    func addToCart(item: ShopItem) async -> [CartItem] {
        return []
    }

    func deleteCart(item: CartItem) async -> [CartItem] {
        return []
    }

    func makeOrder(items: [CartItem]) async -> HistoryOrder {
        return HistoryOrder(items: items)
    }

    func getHistoryOrders() async -> [HistoryOrder] {
        return []
    }
}

class MockService: Service {
    var list = ShopItem.testObjects
    var cart: [CartItem] = ShopItem.testObjects.prefix(2).map { CartItem(item: $0) }
    var historyOrders: [HistoryOrder] = [
        HistoryOrder(items: ShopItem.testObjects.prefix(3).map { CartItem(item: $0) }),
        HistoryOrder(items: ShopItem.testObjects.prefix(1).map { CartItem(item: $0) })
    ]

    func getList() async -> [ShopItem] {
        return list
    }

    func getCart() async -> [CartItem] {
        return cart
    }

    func addToCart(item: ShopItem) async -> [CartItem] {
        cart.append(CartItem(item: item))
        return cart
    }

    func deleteCart(item: CartItem) async -> [CartItem] {
        cart.removeAll(where: { $0 == item })
        return cart
    }

    func makeOrder(items: [CartItem]) async -> HistoryOrder {
        let order = HistoryOrder(items: items)
        historyOrders.append(
            order
        )
        return order
    }

    func getHistoryOrders() async -> [HistoryOrder] {
        return historyOrders
    }
}
