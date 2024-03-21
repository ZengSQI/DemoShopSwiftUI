//
//  Service.swift
//  DemoShopApp
//
//  Created by Steven Zeng on 2024/3/16.
//

import Foundation

protocol Service {
    func getList() async -> [ShopItem]
    func getCart() async -> [ShopItem]
    func addToCart(item: ShopItem) async -> [ShopItem]
}

class AppService: Service {
    func getList() async -> [ShopItem] {
        return []
    }

    func getCart() async -> [ShopItem] {
        return []
    }

    func addToCart(item: ShopItem) async -> [ShopItem] {
        return []
    }
}

class MockService: Service {
    private var cart: [ShopItem] = Array(ShopItem.testObjects.prefix(2))

    func getList() async -> [ShopItem] {
        return ShopItem.testObjects
    }

    func getCart() async -> [ShopItem] {
        return cart
    }

    func addToCart(item: ShopItem) async -> [ShopItem] {
        cart.append(item)
        return cart
    }
}
