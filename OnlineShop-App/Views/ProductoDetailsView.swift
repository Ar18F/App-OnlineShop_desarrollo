import SwiftUI

struct ProductoDetailsView: View {
    @EnvironmentObject private var vm : ProductosDBViewModel
    var producto: Producto
    
    var body: some View {
        ZStack {
            // Fondo semiopaco
            Color.black.opacity(0.3)
                .edgesIgnoringSafeArea(.all)
            
            // Contenido principal
            VStack {
                AsyncImage(url: URL(string: producto.image)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .frame(width: 120, height: 120)
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .frame(width: 180, height: 180)
                            .foregroundColor(.gray)
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
                    .font(.system(size:16))
                
                HStack {
                    ForEach(1..<6) { index in
                        Image(systemName: index <= Int(producto.rating.rate) ? "star.fill" : "star")
                            .foregroundColor(.yellow)
                    }
                }
                
                
                Button(action: {
                    self.vm.productoDataBase.append(producto)
                    print(self.vm.productoDataBase.count)
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
        ProductoDetailsView(producto: Mockdata.sampleProduct)
    }
}
