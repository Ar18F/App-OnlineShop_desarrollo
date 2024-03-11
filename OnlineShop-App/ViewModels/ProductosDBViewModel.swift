//
//  ProductosDBView.swift
//  OnlineShop-App
//
//  Created by Arkaitz Lopez on 3/3/24.
//

import SwiftUI
import FirebaseFirestore
import Foundation

@MainActor
class ProductosDBViewModel: ObservableObject {
    
    @Published var productoDataBase: [Producto] = []
    @Published var total: Double = 0.0
    private var db = Firestore.firestore()
    
    func all() {
        db.collection("producto").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("ERROR: No hay documentos")
                return
            }
            
            self.productoDataBase = documents.map { (queryDocumentSnapshot) -> Producto in
                let data = queryDocumentSnapshot.data()
                let identificador = data["id"] as? Int ?? 0
                let nombre = data["nombre"] as? String ?? ""
                let precio = data["precio"] as? Double ?? 0.0
                let descrip = data["descripcion"] as? String ?? ""
                let categoria = data["categoria"] as? String ?? ""
                let imagen = data["imagen"] as? String ?? ""
                let ratio = data["ratio"] as? Double ?? 0.0
                return Producto(id: identificador, title: nombre, price: precio, description: descrip, category: categoria, image: imagen, rating: Rating(rate: ratio))
            }
        }
    }
    
    func add() {
        do{
            try db.collection("producto").addDocument(from: productoDataBase)
            self.productoDataBase = []
            
            // Imprimir precios para verificar
            print(productoDataBase.map { $0.price })
           
            total = productoDataBase.reduce(0.0) { $0 + $1.price }
            /*
            Esta linea recorre todos los productos en productoDataBase y suma sus precios para calcular el total después de agregar el documento
             */
        }catch{
            print("Error")
        }
    }
}
    
    
    


