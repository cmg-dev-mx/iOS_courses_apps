//
//  ListDetailView.swift
//  SwiftUITutorial
//
//  Created by Cesar Morales Garduño on 6/29/24.
//

import SwiftUI

struct ListDetailView: View {

    var programmer: Programmer
    @Binding var favorite: Bool

    var body: some View {
        VStack {
            programmer.avatar
                .resizable()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black, lineWidth: 4))
                .shadow(color: Color.gray, radius: 10)
            
            HStack {
                Text(programmer.name).font(.largeTitle)
                Button {
                    favorite.toggle()
                } label: {
                    if favorite {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.yellow)
                    } else {
                        Image(systemName: "star")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.gray)
                    }
                }
            }
            Text(programmer.languages).font(.title)
            Spacer()
        }
    }
}

#Preview {
    ListDetailView(
        programmer: Programmer(
            id: 1,
            name: "Cesar",
            languages: "Kotlin, Swift, TypeScript",
            avatar: Image(systemName: "person.fill"),
            favorite: true),
        favorite: .constant(false)
    )
}
