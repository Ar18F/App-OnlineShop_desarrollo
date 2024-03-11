//
//  OnlineShop_AppApp.swift
//  OnlineShop-App
//
//  Created by Arkaitz Lopez on 5/2/24.
//

import SwiftUI
import FirebaseCore

@main
struct OnlineShop_App: App {
    var vm : ProductosDBViewModel
 
    init(){
        FirebaseApp.configure()
        vm = ProductosDBViewModel()
    }
  
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(vm)
        }
    }
}
