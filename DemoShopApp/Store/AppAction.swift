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
    case getCart
    case setCart(items: [CartItem])
    case addToCart(item: ShopItem)
    case deleteCartItem(item: CartItem)
    case makeOrder(items: [CartItem])
    case getHistoryOrder
    case setHistoryOrder(orders: [HistoryOrder])
}
