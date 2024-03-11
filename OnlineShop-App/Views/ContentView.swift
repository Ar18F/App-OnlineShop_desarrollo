//
//  ContentView.swift
//  OnlineShop-App
//
//  Created by Arkaitz Lopez on 5/2/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var app = ProductosViewModel()
    var body: some View {
        TabViewMenu()
    }
}

#Preview {
    ContentView()
}
