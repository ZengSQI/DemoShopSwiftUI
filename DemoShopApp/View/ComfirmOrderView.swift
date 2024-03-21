//
//  ComfirmOrderView.swift
//  DemoShopApp
//
//  Created by Steven Zeng on 2024/3/21.
//

import SwiftUI

struct ComfirmOrderView: View {
    @EnvironmentObject var store: Store
    @EnvironmentObject var router: Router
    @State private var showingAlert = false

    var items: [CartItem]

    var body: some View {
        List {
            Section {
                ForEach(items, id: \.id) { item in
                    OrderItemView(item: item.item)
                }
            }
            Section {
                HStack {
                    Text("總金額:")
                    Spacer()
                    Text("$ \(items.reduce(0) { $0 + $1.item.price })")
                }
            }
            Section {
                Button("提交訂單") {
                    store.dispatch(.makeOrder(items: items))
                    showingAlert.toggle()
                }
                .buttonStyle(CustomButtonStyle(color: .green))
                .frame(maxWidth: .infinity)
                .listRowBackground(Color.clear)
            }
        }
        .navigationTitle("確認訂單")
        .navigationBarTitleDisplayMode(.inline)
        .alert("訂單已送出", isPresented: $showingAlert) {
            Button("OK", role: .cancel) {
                router.popToRoot()
            }
        }
    }
}

#Preview {
    RouterView {
        ComfirmOrderView(items: ShopItem.testObjects.prefix(3).map { CartItem(item: $0) })
    }
    .environmentObject(
        Store.previewStore
    )
}
