//
//  HistoryOrderListItemView.swift
//  DemoShopApp
//
//  Created by Steven Zeng on 2024/3/21.
//

import SwiftUI

struct HistoryOrderListItemView: View {
    var order: HistoryOrder

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("訂單編號: \(order.id.uuidString.prefix(8))")
                    .font(.caption)
            }
            ForEach(order.items, id: \.id) { item in
                HStack(alignment: .center, content: {
                    Image(item.item.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                    Text(item.item.name)
                        .font(.caption)
                    Spacer()
                    Text("$ \(item.item.price.formatted())")
                        .font(.caption)
                })
            }
            HStack {
                Spacer()
                Text("總金額: \(order.items.reduce(0) { $0 + $1.item.price })")
                    .font(.caption)
            }
        }
        .listStyle(.plain)
        .scrollDisabled(true)
    }
}

#Preview {
    HistoryOrderListItemView(
        order: HistoryOrder(
            items: [
                CartItem(item: ShopItem.testObjects[0]),
                CartItem(item: ShopItem.testObjects[1]),
            ]
        )
    )
}
