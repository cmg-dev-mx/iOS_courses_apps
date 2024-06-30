//
//  ListDetailView.swift
//  SwiftUITutorial
//
//  Created by Cesar Morales Garduño on 6/29/24.
//

import SwiftUI

struct ListDetailView: View {

    var programmer: Programmer

    var body: some View {
        VStack {
            programmer.avatar
                .resizable()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black, lineWidth: 4))
                .shadow(color: Color.gray, radius: 10)
            
            Text(programmer.name).font(.largeTitle)
            Text(programmer.languages).font(.title)
            Spacer()
        }
    }
}

#Preview {
    ListDetailView(programmer: Programmer(
        id: 1,
        name: "Cesar",
        languages: "Kotlin, Swift, TypeScript",
        avatar: Image(systemName: "person.fill")
    ))
}
