//
//  HistoryOrder.swift
//  DemoShopApp
//
//  Created by Steven Zeng on 2024/3/21.
//

import Foundation

struct HistoryOrder: Hashable, Equatable {
    let id: UUID = UUID()
    let items: [CartItem]
}
