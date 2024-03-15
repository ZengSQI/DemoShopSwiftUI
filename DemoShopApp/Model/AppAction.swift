//
//  AppAction.swift
//  DemoShopApp
//
//  Created by Steven Zeng on 2024/3/16.
//

import Foundation

enum AppAction {
    case getList
    case setList(items: [ShopItem])
    case addToCart(item: ShopItem)
}
