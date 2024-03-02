//
//  ListaProductosView.swift
//  OnlineShop-App
//
//  Created by  on 23/2/24.
//

import SwiftUI

struct ListaProductosView: View {
    @ObservedObject var list = ProductosViewModel()
    
    var body: some View {
        NavigationView {
            List(list.productList) { producto in
                NavigationLink(destination:
                    ProductoDetailsView(producto: producto)){
                    ProductoFila(producto: producto)
                }
            }
        }
    }
}

struct ListaProductosView_Previews: PreviewProvider {
    static var previews: some View {
        ListaProductosView()
    }
}
