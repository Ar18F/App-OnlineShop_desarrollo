import SwiftUI

struct ProductoDetailsView: View {
    @EnvironmentObject private var vm: ProductosDBViewModel
    var producto: Producto
    @Binding var isPresented: Bool // Agregado un binding para controlar la presentacion de la vista
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        ZStack {
            // Fondo semiopaco
            Color.black.opacity(0.3)
                .edgesIgnoringSafeArea(.all)
            
            // Contenido principal
            VStack {
                HStack {
                    Spacer() // Mover el botón al extremo derecho
                    Button(action: {
                        isPresented = false
                        presentationMode.wrappedValue.dismiss() // Cierra la vista actual y vuelve a la anterior
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                            .font(.title)
                            .padding()
                    }
                }
                
                AsyncImage(url: URL(string: producto.image)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .frame(width: 120, height: 120)
                            .foregroundColor(.white)
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .frame(width: 180, height: 180)
                            .foregroundColor(.white)
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(height: 130)
                
                Text(producto.title)
                    .font(.system(size: 20))
                    .bold()
                    .padding()
                
                
                Text(producto.description)
                    .padding()
                    .font(.system(size: 16))
                
                
                HStack {
                    let fullStars = Int(producto.rating.rate)
                    let fractionalPart = producto.rating.rate - Double(fullStars)
                    
                    // Dibujar las estrellas completas
                    ForEach(1...fullStars, id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                    
                    // Dibujar la estrella fraccionaria
                    if fractionalPart > 0 {
                        Image(systemName: "star.leadinghalf.fill")
                            .foregroundColor(.yellow)
                    }
                    
                    // Dibujar las estrellas vacias restantes
                    let emptyStars = max(0, 5 - fullStars - (fractionalPart > 0 ? 1 : 0))
                    ForEach(0..<emptyStars, id: \.self) { _ in
                        Image(systemName: "star")
                            .foregroundColor(.yellow)
                    }
                }
                
                Button(action: {
                    self.vm.productoDataBase.append(producto)
                    isPresented = false
                    presentationMode.wrappedValue.dismiss() // Cierra la vista actual y vuelve a la anterior
                    
                }) {
                    Text("\(String(producto.price)) € - Añadir al carrito")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
            }
            .padding()
            .cornerRadius(15)
            .background(.background)
            .frame(width: 300)
        }
    }
}

struct ProductoDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductoDetailsView(producto: Mockdata.sampleProduct, isPresented: .constant(true))
    }
}
