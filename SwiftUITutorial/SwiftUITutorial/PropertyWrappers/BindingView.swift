//
//  BindingView.swift
//  SwiftUITutorial
//
//  Created by Cesar Morales Garduño on 6/29/24.
//

import SwiftUI

struct BindingView: View {

    @Binding var value: Int
    @ObservedObject var user: UserData
    @State private var selection: Int?

    var body: some View {
        VStack {
            Button("Suma 2") {
                value += 2
            }
            Button("Actualizar datos") {
                user.name = "John Doe"
                user.age = 20
            }
            NavigationLink(destination: EnvironmentView(), tag: 1, selection: $selection) {
                Button ("Ir a EnvironmentView") {
                    selection = 1
                }
            }
        }
    }
}

#Preview {
    BindingView(value: .constant(5), user: UserData())
}
