//
//  CartItem.swift
//  DemoShopApp
//
//  Created by Steven Zeng on 2024/3/21.
//

import Foundation

struct CartItem: Hashable, Equatable {
    let id: UUID = .init()
    var item: ShopItem

    init(item: ShopItem) {
        self.item = item
    }
}
