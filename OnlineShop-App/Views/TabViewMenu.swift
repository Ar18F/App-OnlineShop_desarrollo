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
                Text("AccountView()")
                    .badge("!")
                    .tabItem {
                        Label("Account", systemImage: "person.crop.circle.fill")
                    }
                Text("OrderView()")
                    .badge(2)
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
