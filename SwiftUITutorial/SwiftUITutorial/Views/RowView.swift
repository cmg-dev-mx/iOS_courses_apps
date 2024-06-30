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
        }
    }
}

#Preview(traits: .fixedLayout(width: 400, height: 60)) {
    RowView(programmer: Programmer(
        id: 1,
        name: "Cesar",
        languages: "Kotlin, Swift, TypeScript",
        avatar: Image(systemName: "person.fill")
    ))
}
