//
//  Service.swift
//  DemoShopApp
//
//  Created by Steven Zeng on 2024/3/16.
//

import Foundation

protocol Service {
    func getList() async -> [ShopItem]
}

class AppService: Service {

    func getList() async -> [ShopItem] {
        return ShopItem.testObjects
    }
}

class MockService: Service {

    func getList() async -> [ShopItem] {
        return ShopItem.testObjects
    }
}
