//
//  ItemDetailView.swift
//  DemoShopApp
//
//  Created by Steven Zeng on 2024/3/16.
//

import SwiftUI

struct ItemDetailView: View {
    @EnvironmentObject var store: Store
    @EnvironmentObject var router: Router
    var item: ShopItem
    @State private var showingAlert = false

    var body: some View {
        VStack(alignment: .leading, content: {
            HStack {
                Image(item.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Text(item.name)
            Text(item.description)
                .font(.caption)
            HStack {
                Text("$ \(item.price.formatted())")
                    .font(.caption)
                    .underline()
                Spacer()
                Text("上架時間: \(Date(timeIntervalSince1970: item.createdAt).formatted())")
                    .font(.caption2)
            }
            HStack {
                Button("加入購物車") {
                    store.dispatch(.addToCart(item: item))
                    showingAlert.toggle()
                }
                .buttonStyle(CustomButtonStyle(color: .yellow))
                .frame(maxWidth: .infinity)
                Button("立即購買") {
                    router.navigateTo(.confirmOrder(items: [CartItem(item: item)]))
                }
                .buttonStyle(CustomButtonStyle(color: .green))
                .frame(maxWidth: .infinity)
            }
        })
        .padding()
        .navigationTitle("商品詳情")
        .navigationBarTitleDisplayMode(.inline)
        .alert("已加入購物車", isPresented: $showingAlert) {
            Button("OK", role: .cancel) {}
        }
    }
}

#Preview {
    RouterView {
        ItemDetailView(item: ShopItem.testObjects[0])
    }
    .environmentObject(
        Store.previewStore
    )
}

struct CustomButtonStyle: ButtonStyle {
    let color: Color

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(color)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
