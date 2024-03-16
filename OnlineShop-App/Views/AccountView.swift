import SwiftUI

class UserData: ObservableObject {
    @Published var receiveNotifications = false
}

struct AccountView: View {
    @AppStorage("username") private var username: String = ""
    @AppStorage("lastName") private var lastName: String = ""
    @AppStorage("email") private var email: String = ""
    
    @State var birthDate = Date()
    @State private var isDarkModeEnabled = false
    @State private var showAlert = false
    @StateObject private var userData = UserData()
    
    @State private var isDatePickerPresented = false

    var dateFormatter: DateFormatter {
         let formatter = DateFormatter()
         formatter.dateStyle = .long
         return formatter
     }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Perfil")) {
                    TextField("Nombre de Usuario", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    TextField("Apellido", text: $lastName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    TextField("Correo Electrónico", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.emailAddress)

                    Section(header: Text("Fecha de Nacimiento")) {
                        Button(action: {
                            isDatePickerPresented.toggle()
                        }) {
                            Text(dateFormatter.string(from: birthDate))
                        }
                        .sheet(isPresented: $isDatePickerPresented) {
                            DatePicker("Fecha de Nacimiento", selection: $birthDate, displayedComponents: [.date])
                                .datePickerStyle(GraphicalDatePickerStyle())
                                .labelsHidden()
                                .environment(\.colorScheme, .light) // Ajusta al esquema de color claro para una mejor apariencia
                                .accentColor(Color.gray)
                        }
                    }

                    Button(action: {
                        saveUserData()
                        showAlert = true
                    }) {
                        Text("Guardar")
                    }
                }

                Section(header: Text("Configuraciones")) {
                    Button(action: {
                        toggleDarkMode()
                    }) {
                        HStack {
                            Text("Modo Oscuro")
                            Spacer()
                            Image(systemName: isDarkModeEnabled ? "moon.fill" : "moon")
                                .foregroundColor(isDarkModeEnabled ? .yellow : .gray)
                            
                        }
                    }

                    Toggle("Recibir Notificaciones", isOn: $userData.receiveNotifications)
                }
            }
            .navigationBarTitle("Perfil y Configuraciones", displayMode: .inline)
            .onAppear {
                loadUserData()
                // Cargar el estado del modo oscuro al iniciar la vista
                isDarkModeEnabled = UserDefaults.standard.bool(forKey: "isDarkModeEnabled")
            }
            .onChange(of: isDarkModeEnabled) { _ in
                // Guardar el estado del modo oscuro cuando cambia
                UserDefaults.standard.set(isDarkModeEnabled, forKey: "isDarkModeEnabled")
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Datos Guardados"),
                    message: Text("Los datos se han guardado exitosamente."),
                    dismissButton: .default(Text("Aceptar"))
                )
            }
        }
        .environmentObject(userData)
        .preferredColorScheme(isDarkModeEnabled ? .dark : .light) // Establecer el esquema de color preferido
    }

    private func saveUserData() {
        UserDefaults.standard.set(username, forKey: "username")
        UserDefaults.standard.set(lastName, forKey: "lastName")
        UserDefaults.standard.set(email, forKey: "email")
        // Guardar la fecha de nacimiento
        UserDefaults.standard.set(birthDate, forKey: "birthDate")
    }

    private func loadUserData() {
        if let savedUsername = UserDefaults.standard.string(forKey: "username") {
            username = savedUsername
        }

        if let savedLastName = UserDefaults.standard.string(forKey: "lastName") {
            lastName = savedLastName
        }

        if let savedEmail = UserDefaults.standard.string(forKey: "email") {
            email = savedEmail
        }

        // Cargar la fecha de nacimiento
        if let savedBirthDate = UserDefaults.standard.object(forKey: "birthDate") as? Date {
            birthDate = savedBirthDate
        }
    }

    private func toggleDarkMode() {
        isDarkModeEnabled.toggle()
        // Puedes implementar lógica para cambiar el modo oscuro aquí
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
