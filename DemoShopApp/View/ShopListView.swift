//
//  ShopListView.swift
//  DemoShopApp
//
//  Created by Steven Zeng on 2024/3/16.
//

import SwiftUI

struct ShopListView: View {
    @EnvironmentObject var store: Store
    @EnvironmentObject var router: Router

    var body: some View {
        List(store.state.list, id: \.name) { item in
            ListItemView(item: item)
                .frame(height: 200)
                .contentShape(Rectangle())
                .onTapGesture {
                    router.navigateTo(.detail(item: item))
                }
        }
        .toolbar {
            ToolbarItem {
                Button(action: {
                    router.navigateTo(.cart)
                }, label: {
                    Image(systemName: "cart.fill")
                })
            }
        }
        .onAppear(perform: {
            store.dispatch(.getList)
        })
        .navigationTitle("商品列表")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    RouterView {
        ShopListView()
    }
    .environmentObject(
        Store.previewStore
    )
}
