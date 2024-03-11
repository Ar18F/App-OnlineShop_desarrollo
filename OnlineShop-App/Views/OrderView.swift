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
        
        VStack{
            List(vm.productoDataBase) { producto in
                ProductoFila(producto: producto)
            }
            
            Button(action: {
                self.vm.add()
            }) {
                Text("\(String(vm.total)) € - Checkout")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
        }
    }
}

#Preview {
    OrderView()
}
