import SwiftUI

struct TabViewMenu: View {
    
    @EnvironmentObject private var vm : ProductosDBViewModel
    
 
    var body: some View {
        TabView {
            NavigationView {
                VStack {
                    // Contenido específico para la pestaña "Home"
                    HomeTabContent()

                    // Lista de productos
                    ListaProductosView()
                }
            }
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }
            NavigationView {
                VStack {
                    // Contenido específico para la pestaña "Home"
                    AccountTabContent()

                    // Lista de productos
                    AccountView()
                }
            }
            .badge("!")
            .tabItem {
                Label("Account", systemImage: "person.crop.circle.fill")
            }
            NavigationView {
                VStack {
                    // Contenido específico para la pestaña "Home"
                    OrderViewTabContent()
                    OrderView()
                }
            }
            .badge(vm.productoDataBase.count)
            .tabItem {
                Label("Order", systemImage: "cart.fill")
            }
        }
    }
}

struct HomeTabContent: View {
    var body: some View {
        HStack {
            Image("logo")
                .resizable()
                .frame(width: 90, height: 80)
                .offset(x: -40)

            Text("Products")
                .font(.system(size: 40))
                .bold()
                .offset(x: -20)
        }
    }
}

struct AccountTabContent: View {
    var body: some View {
        HStack {
            Text("😊Account ") // Agregamos el emoji aquí
                .font(.system(size: 40))
                .bold()
                .offset(x: -20)
        }
    }
}

struct OrderViewTabContent: View {
    var body: some View {
        VStack {
            HStack {
                Text("🫰 Shopping Cart ") // Agregamos el emoji aquí
                    .font(.system(size: 40))
                    .bold()
                    .offset(x: -20)
            }
        }
    }
}
    
    
    struct TabViewMenu_Previews: PreviewProvider {
        static var previews: some View {
            TabViewMenu()
        }
    }

