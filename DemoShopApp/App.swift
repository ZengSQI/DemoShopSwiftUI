//
//  App.swift
//  DemoShopApp
//
//  Created by Steven Zeng on 2024/3/16.
//

import SwiftUI

@main
struct DemoShopApp: App {
    @StateObject var store = Store(
        initialState: AppState(list: [], cart: [], historyOrders: []),
        environment: Environment(
            // service: AppService()
            service: MockService()
        )
    )

    var body: some Scene {
        WindowGroup {
            RouterView {
                ShopListView()
            }.environmentObject(store)
        }
    }
}
