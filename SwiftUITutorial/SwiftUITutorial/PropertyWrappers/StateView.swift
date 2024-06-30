//
//  StateView.swift
//  SwiftUITutorial
//
//  Created by Cesar Morales Garduño on 6/29/24.
//

import SwiftUI

class UserData: ObservableObject {
    
    @Published var name = "Cesar"
    @Published var age = 37
}

struct StateView: View {

    @State private var value = 0
    @State private var selection: Int?
    @StateObject private var user = UserData()

    var body: some View {
        NavigationView {
            VStack {
                Text("El valor actual es \(value)")
                Button("Suma 1") {
                    value += 1
                }
                
                Text("Mi nombre es \(user.name) y tengo \(user.age) años")
                Button("Cambiar nombre") {
                    user.name = "Cesar Morales"
                    user.age = 38
                }

                NavigationLink(destination: BindingView(value: $value, user: user), tag: 1, selection: $selection) {
                    Button ("Ir a BindingView") {
                        selection = 1
                    }
                }
            }.navigationTitle("StateView")
        }
    }
}

#Preview {
    StateView().environmentObject(UserData())
}
