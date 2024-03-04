//
//  TabView.swift
//  OnlineShop-App
//
//  Created by Arkaitz Lopez on 5/2/24.
//

import SwiftUI
//https://fakestoreapi.com/docs
//https://github.com/keikaavousi/fake-store-api
struct TabViewMenu: View {
    
    @ObservedObject private var vm = ProductosDBViewModel()
        var body: some View {
            
        VStack {
            HStack {
                Image("logo")
                    .resizable()
                    .frame(width: 90,height: 80)
                .offset(x: -90)
                Text("Products")
            }
            
            TabView {
                ListaProductosView()
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
                AccountView()
                    .badge("!")
                    .tabItem {
                        Label("Account", systemImage: "person.crop.circle.fill")
                    } 
                OrderView()
                    .badge(vm.productoDataBase.count)
                    .tabItem {
                        Label("Order", systemImage: "cart.fill")
                    }
            }
        }
    }
}



#Preview {
    TabViewMenu()
}
