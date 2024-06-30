//
//  ContentView.swift
//  SwiftUITutorial
//
//  Created by Cesar Morales Garduño on 6/29/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack( // Solamente permite 10 elementos internos
            alignment: .leading,
            spacing: 20
        ) {
            Text("Hello, world!")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
                .background(Color.gray)
            
            Spacer()

            ZStack {
                Text("")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.gray)
                    .padding()
                Text("")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.blue)
                    .padding(40)
                Text("")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.red)
                    .padding(60)
                Text("")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.green)
                    .padding(80)
            }

            Spacer()

            HStack {
            
            Text("Saludos a todos!")
                .padding()
                .background(Color.gray)

            Spacer()

            Text("Hola")
                .padding()
                .background(Color.gray)
            }
        }
        .background(Color.yellow)
        .padding()
    }
}

#Preview {
    ContentView()
}
