//
//  OrderView.swift
//  OnlineShop-App
//
//  Created by Arkaitz Lopez on 3/3/24.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var vm : ProductosDBViewModel
    var producto: Producto
    
    var body: some View {
        var total = 0.0
        List(vm.productoDataBase) { producto in
            ProductoFila(producto: producto)
            //total += Double(producto.price)
        }
        
        Button(action: {
            self.vm.add(nombre: producto.title, categoria: producto.category, precio: producto.price)
        }) {
            Text("\(String(0)) € - Checkout")
                .foregroundColor(.white)
                .padding()
                .background(Color.green)
                .cornerRadius(10)
        }
        
    }
}

#Preview {
    OrderView(producto:)
}
