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
}

class MockService: Service {
    private var cart: [CartItem] = ShopItem.testObjects.prefix(2).map { CartItem(item: $0) }

    func getList() async -> [ShopItem] {
        return ShopItem.testObjects
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
}
