//
//  Service.swift
//  DemoShopApp
//
//  Created by Steven Zeng on 2024/3/16.
//

import Foundation

class Service {

    func getList() async -> [ShopItem] {
        return ShopItem.testObjects
    }
}
