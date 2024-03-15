//
//  Item.swift
//  DemoShopApp
//
//  Created by Steven Zeng on 2024/3/16.
//

import Foundation

struct ShopItem: Decodable {
    let name: String
    let description: String
    let price: Int
    let createdAt: TimeInterval
    let imageName: String
}

extension ShopItem {
    static var testObjects: [ShopItem] {
        return [
            ShopItem(name: "item 1", description: "test", price: 100, createdAt: Date().timeIntervalSince1970, imageName: ""),
            ShopItem(name: "item 2", description: "test", price: 200, createdAt: Date().timeIntervalSince1970, imageName: ""),
            ShopItem(name: "item 3", description: "test", price: 300, createdAt: Date().timeIntervalSince1970, imageName: ""),
        ]
    }
}
