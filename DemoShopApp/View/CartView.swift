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
    @State var selectedItems: Set<CartItem> = []
    @State private var showingAlert = false

    var body: some View {
        List {
            ForEach(store.state.cart, id: \.id) { item in
                let isSelected = Binding(
                    get: {
                        selectedItems.contains(item)
                    }, set: { _ in
                        selectedItems.formSymmetricDifference([item])
                    }
                )
                CartItemView(cartItem: item, isSelected: isSelected)
                    .contentShape(Rectangle())
            }
            .onDelete(perform: { indexSet in
                let items = indexSet.map { store.state.cart[$0] }
                items.forEach { item in
                    selectedItems.remove(item)
                    store.dispatch(.deleteCartItem(item: item))
                }
            })
        }
        .safeAreaInset(edge: .bottom) {
            Button("結算") {
                guard !selectedItems.isEmpty else {
                    showingAlert.toggle()
                    return
                }
                let items = store.state.cart.filter { selectedItems.contains($0) }.map { $0.item }
                router.navigateTo(.confirmOrder(items: items))
            }
            .buttonStyle(CustomButtonStyle(color: .green))
            .frame(maxWidth: .infinity)
        }
        .onAppear(perform: {
            store.dispatch(.getCart)
        })
        .navigationTitle("購物車")
        .navigationBarTitleDisplayMode(.inline)
        .alert("請至少選取一樣商品", isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        }
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
