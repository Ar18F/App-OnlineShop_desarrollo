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
        
        List(vm.productoDataBase) { producto in
            ProductoFila(producto: producto)
        }
    }
}

#Preview {
    OrderView()
}
