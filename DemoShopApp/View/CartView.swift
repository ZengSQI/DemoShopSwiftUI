//
//  CartView.swift
//  DemoShopApp
//
//  Created by Steven Zeng on 2024/3/21.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var store: Store
    @EnvironmentObject var router: Router

    @State var selectedItem: Set<ShopItem> = []

    var body: some View {
        List(store.state.cart, id: \.id) { item in
            CartItemView(item: item, isSelected: .constant(selectedItem.contains(item)))
                .contentShape(Rectangle())
                .onTapGesture {
                    selectedItem.formSymmetricDifference([item])
                }
        }
        .safeAreaInset(edge: .bottom) {
            Button("結算") {

            }
            .buttonStyle(CustomButtonStyle(color: .green))
            .frame(maxWidth: .infinity)
        }
        .onAppear(perform: {
            store.dispatch(.getCart)
        })
        .navigationTitle("購物車")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    RouterView {
        CartView()
    }
    .environmentObject(
        Store.previewStore
    )
}
