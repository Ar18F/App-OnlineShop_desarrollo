//
//  OrderView.swift
//  OnlineShop-App
//
//  Created by Arkaitz Lopez on 3/3/24.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var vm : ProductosDBViewModel
    
    var body: some View {
        NavigationView {
            List(vm.productoDataBase) { producto in
                VStack {
                    Text(producto.title + "\n$ "+String(producto.price))
                }.padding()
            }
        }
    }
}

#Preview {
    OrderView()
}
