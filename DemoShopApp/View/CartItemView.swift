//
//  CartItemView.swift
//  DemoShopApp
//
//  Created by Steven Zeng on 2024/3/21.
//

import SwiftUI

struct CartItemView: View {
    var item: ShopItem
    @Binding var isSelected: Bool

    var body: some View {
        HStack(alignment: .center, content: {
            if isSelected {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundStyle(.green)
            } else {
                Image(systemName: "circle")
            }
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
    CartItemView(item: ShopItem.testObjects[0], isSelected: .constant(true))
        .frame(width: 300, height: 300)
}
