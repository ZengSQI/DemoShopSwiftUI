//
//  ShopListView.swift
//  DemoShopApp
//
//  Created by Steven Zeng on 2024/3/16.
//

import SwiftUI

struct ShopListView: View {
    @EnvironmentObject var store: Store
    var body: some View {
        List {
            ForEach(store.state.list, id: \.name) { item in
                ListItemView(item: item)
                    .frame(height: 200)
            }
        }.onAppear(perform: {
            store.dispatch(.getList)
        })
    }
}

#Preview {
    ShopListView()
        .environmentObject(
            Store.previewStore
        )
}
