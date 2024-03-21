//
//  ComfirmOrderView.swift
//  DemoShopApp
//
//  Created by Steven Zeng on 2024/3/21.
//

import SwiftUI

struct ComfirmOrderView: View {
    @EnvironmentObject var router: Router

    var items: [ShopItem]

    var body: some View {
        List {
            Section {
                ForEach(items, id: \.id) { item in
                    OrderItemView(item: item)
                }
            }
            Section {
                HStack {
                    Text("總金額:")
                    Spacer()
                    Text("$ \(items.reduce(0, { $0 + $1.price }))")

                }
            }
            Section {
                Button("提交訂單") {

                }
                .buttonStyle(CustomButtonStyle(color: .green))
                .frame(maxWidth: .infinity)
                .listRowBackground(Color.clear)
            }
        }
        .navigationTitle("確認訂單")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    RouterView {
        ComfirmOrderView(items: Array(ShopItem.testObjects.prefix(3)))
    }
    .environmentObject(
        Store.previewStore
    )
}
