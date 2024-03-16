//
//  ListItemView.swift
//  DemoShopApp
//
//  Created by Steven Zeng on 2024/3/16.
//

import SwiftUI

struct ListItemView: View {
    var item: ShopItem

    var body: some View {
        VStack(alignment: .leading, content: {
            HStack {
                Image(item.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Text(item.name)
            Text("$ \(item.price.formatted())")
                .font(.caption)
        })
    }
}

#Preview {
    ListItemView(item: ShopItem.testObjects[0])
        .frame(width: 200, height: 200)
}
