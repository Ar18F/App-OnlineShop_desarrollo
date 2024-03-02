//
//  ProductoFila.swift
//  OnlineShop-App
//
//  Created by Arkaitz Lopez on 5/2/24.
//

import SwiftUI
//https://fakestoreapi.com/products
struct ProductoFila: View {
    var producto: Producto
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: producto.image)){
                imagen in
                if let image = imagen.image{
                    image.resizable()
                        .frame(width: 50, height: 50)
                }
            }
            VStack {
                Text(producto.title + "\n$ "+String(producto.price))
            }.padding()
        }.padding()
    }
}

#Preview {
    ProductoFila(producto:Mockdata.sampleProduct )
}
