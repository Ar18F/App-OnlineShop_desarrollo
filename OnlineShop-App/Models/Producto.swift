//
//  Productos.swift
//  OnlineShop-App
//
//  Created by Arkaitz Lopez on 5/2/24.
//

import Foundation
import SwiftUI
import FirebaseFirestore
//https://fakestoreapi.com/products
struct Producto: Codable, Identifiable{
    var id :Int
    var title: String
    var price: Double
    var description: String
    var category: String
    var image: String
    var rating: Rating
}

struct Rating: Codable {
    
    var rate: Double
}


struct Mockdata{
    static let rating = Rating (rate: 3.9)
    static let sampleProduct = Producto(id:1,title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops", price: 109.95, description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday", category:"men's clothing", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg", rating: rating)
    
    static let sampleProduct2 = Producto(id:2, title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops", price: 109.95, description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday", category: "men's clothing", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg", rating: rating)
    
    static let sampleProduct3 = Producto(id:3,title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops", price: 109.95, description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday", category: "men's clothing", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg", rating: rating)
    
    static let productos = [sampleProduct,sampleProduct2,sampleProduct3]
    
}



