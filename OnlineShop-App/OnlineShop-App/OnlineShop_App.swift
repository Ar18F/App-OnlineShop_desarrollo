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
    
 
    init(){
        FirebaseApp.configure()
    }
  
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
