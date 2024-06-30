//
//  RowView.swift
//  SwiftUITutorial
//
//  Created by Cesar Morales Garduño on 6/29/24.
//

import SwiftUI

struct RowView: View {

    var programmer: Programmer

    var body: some View {
        HStack {
            programmer.avatar
                .resizable()
                .frame(width:40, height:40)
                .padding(10)
            
            VStack(alignment: .leading) {
                Text(programmer.name).font(.title)
                Text(programmer.languages).font(.subheadline)
            }

            Spacer()

            if (programmer.favorite) {
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(10)
                    .foregroundColor(.yellow)
            }
        }
    }
}

#Preview(traits: .fixedLayout(width: 400, height: 60)) {
    RowView(programmer: Programmer(
        id: 1,
        name: "Cesar",
        languages: "Kotlin, Swift, TypeScript",
        avatar: Image(systemName: "person.fill"),
        favorite: true
    ))
}
