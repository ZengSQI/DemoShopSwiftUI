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

    var body: some View {
        VStack {
            List(store.state.cart, id: \.name) { item in
                CartItemView(item: item)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        router.navigateTo(.detail(item: item))
                    }
            }
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
