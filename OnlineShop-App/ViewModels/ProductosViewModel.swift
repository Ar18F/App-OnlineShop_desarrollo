//
//  VitoriaViewModel.swift
//  WeatherApp
//
//  Created by Arkaitz Lopez on 8/1/24.
//

import SwiftUI
//import FirebaseFirestore
import Foundation

@MainActor
class ProductosViewModel: ObservableObject {
    
    @Published var productList: [Producto] = []
   // private var db = Firestore.firestore()
    
    init() {
            // Llamada al inicializador designado con una URL predeterminada
            getProduct()
        }
    
    
    func getProduct(){
            Task{ //hace que sea asíncrona la tarea, consiguiendo concurrencia
                do{
                    let producto = try await NetworkManager.shared.getProduct()
                    self.productList = producto
                }catch{
                    
                    if let callError = error as? WEError {
                        switch callError{
                        case .invalidURL:
                            print("Invalid URL")
                        case .invalidResponse:
                            print("Invalid response")
                        case .invalidData:
                            print("Invalid data")
                        case .unableToComplete:
                            print("Unable to complete")
                        }
                        
                    }else{
                        //Generic error
                        print("Invalid response")
                    }
                }
            }
        }
    
  /*
    func all() {
        db.collection("producto").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("ERROR: No hay documentos")
                return
            }

            self.productList = documents.map { (queryDocumentSnapshot) -> Producto in
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
    
    func add(nombre: String, categoria: String, precio: Double) {
        db.collection("producto").addDocument(data: ["nombre": nombre, "categoria": categoria, "precio": precio])
    }
    
    */
}
