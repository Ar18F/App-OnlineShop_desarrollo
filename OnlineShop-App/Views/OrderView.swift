import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var vm: ProductosDBViewModel
    
    var body: some View {
        VStack {
            List(vm.productoDataBase) { producto in
                ProductoFila(producto: producto)
            }
            
            Button(action: {
                self.vm.add()
            }) {
                Text("\(String(format: "%.2f", self.calculateTotal())) € - Checkout")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
        }
    }

    private func calculateTotal() -> Double {
        return vm.productoDataBase.reduce(0.0) { $0 + $1.price }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
