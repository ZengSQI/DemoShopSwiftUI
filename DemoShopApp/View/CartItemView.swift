//
//  CartItemView.swift
//  DemoShopApp
//
//  Created by Steven Zeng on 2024/3/21.
//

import SwiftUI

struct CartItemView: View {
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
    CartItemView(item: ShopItem.testObjects[0])
        .frame(width: 300, height: 300)
}
