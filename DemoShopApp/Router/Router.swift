//
//  Router.swift
//  DemoShopApp
//
//  Created by Steven Zeng on 2024/3/21.
//

import SwiftUI

class Router: ObservableObject {
    enum Route: Hashable {
        case detail(item: ShopItem)
        case cart
        case confirmOrder(items: [CartItem])
        case historyOrder
    }

    @Published var path: NavigationPath = NavigationPath()

    @ViewBuilder func view(for route: Route) -> some View {
        switch route {
        case let .detail(item):
            ItemDetailView(item: item)
        case .cart:
            CartView()
        case let .confirmOrder(items):
            ComfirmOrderView(items: items)
        case .historyOrder:
            HistoryOrderListView()
        }
    }

    func navigateTo(_ appRoute: Route) {
        path.append(appRoute)
    }

    func navigateBack() {
        path.removeLast()
    }

    func popToRoot() {
        path.removeLast(path.count)
    }
}
