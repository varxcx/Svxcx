//
//  CartView.swift
//  Svxcx
//
//  Created by Vardhan Chopada on 11/25/22.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    var body: some View {
        ScrollView {
            if cartManager.products.count > 0 {
                ForEach(cartManager.products, id: \.id) {
                    product in
                    ProductRoq(product: product)
                }
                HStack {
                    Text("Your Cart Total is")
                    Spacer()
                    Text("$\(cartManager.total).00")
                        .bold()
                }
                .padding()
            } else {
                Text("Your Cart is Empty")
            }
            
        }
        .navigationTitle(Text("My Cart"))
        .padding(.top)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        
        CartView()
            .environmentObject(CartManager())
    }
}
