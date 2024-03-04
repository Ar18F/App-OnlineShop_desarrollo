//
//  ListaProductosView.swift
//  OnlineShop-App
//
//  Created by  on 23/2/24.
//

import SwiftUI

struct ListaProductosView: View {
    @ObservedObject var list = ProductosViewModel()
    @State private var isDetailViewPresented = false // Nuevo estado para controlar la vista de detalles
    
    var body: some View {
        
        NavigationView {
            List(list.productList) { producto in
                NavigationLink(destination:
                    ProductoDetailsView(producto: producto, isPresented: $isDetailViewPresented)){
                    ProductoFila(producto: producto)
                }
            }
            .sheet(isPresented: $isDetailViewPresented) {
                // Utiliza .sheet para presentar la vista de detalles en lugar de NavigationLink
                EmptyView()
            }
        }
    }
}

struct ListaProductosView_Previews: PreviewProvider {
    static var previews: some View {
        ListaProductosView()
    }
}
