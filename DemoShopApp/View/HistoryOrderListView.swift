//
//  HistoryOrderListView.swift
//  DemoShopApp
//
//  Created by Steven Zeng on 2024/3/21.
//

import SwiftUI

struct HistoryOrderListView: View {
    @EnvironmentObject var store: Store
    @EnvironmentObject var router: Router

    var body: some View {
        List(store.state.historyOrders, id: \.id) { order in
            Section {
                HistoryOrderListItemView(order: order)
            }
        }
        .onAppear(perform: {
            store.dispatch(.getHistoryOrder)
        })
        .navigationTitle("歷史訂單")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    RouterView {
        HistoryOrderListView()
    }
    .environmentObject(
        Store.previewStore
    )
}
