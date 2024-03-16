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
                    .foregroundColor(.black)
                    
                Text(producto.description)
                    .padding()
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                
                HStack {
                    ForEach(1..<6) { index in
                        Image(systemName: index <= Int(producto.rating.rate) ? "star.fill" : "star")
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
            .background(Color.white)
            .cornerRadius(15)
            .frame(width: 300)
        }
    }
}

struct ProductoDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductoDetailsView(producto: Mockdata.sampleProduct, isPresented: .constant(true))
    }
}
