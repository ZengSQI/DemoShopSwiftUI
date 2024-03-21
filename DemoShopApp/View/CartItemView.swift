//
//  CartItemView.swift
//  DemoShopApp
//
//  Created by Steven Zeng on 2024/3/21.
//

import SwiftUI

struct CartItemView: View {
    var cartItem: CartItem
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
                Image(cartItem.item.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
            }
            Text(cartItem.item.name)
            Spacer()
            Text("$ \(cartItem.item.price.formatted())")
        })
        .onTapGesture {
            isSelected.toggle()
        }
    }
}

#Preview {
    CartItemView(cartItem: CartItem(item: ShopItem.testObjects[0]), isSelected: .constant(true))
        .frame(width: 300, height: 300)
}
