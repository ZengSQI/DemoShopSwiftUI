//
//  OrderItemView.swift
//  DemoShopApp
//
//  Created by Steven Zeng on 2024/3/21.
//

import SwiftUI

struct OrderItemView: View {
    var item: ShopItem

    var body: some View {
        HStack(alignment: .center, content: {
            HStack {
                Image(item.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
            }
            Text(item.name)
            Spacer()
            Text("$ \(item.price.formatted())")
        })
    }
}

#Preview {
    OrderItemView(item: ShopItem.testObjects[0])
}
