//
//  OrderView.swift
//  OnlineShop-App
//
//  Created by Arkaitz Lopez on 3/3/24.
//

import SwiftUI

struct OrderView: View {
    @ObservedObject private var vm = ProductosDBViewModel()
    var body: some View {
        List(vm.productoDataBase) { producto in
            ProductoFila(producto: producto)
            
            VStack {
                Text(producto.title + "\n$ "+String(producto.price))
            }.padding()
        }.onAppear() {
            self.vm.all()
        }.navigationTitle("Productos")
    }
}

#Preview {
    OrderView()
}
