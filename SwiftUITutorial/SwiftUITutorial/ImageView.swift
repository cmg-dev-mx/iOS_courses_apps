//
//  ImageView.swift
//  SwiftUITutorial
//
//  Created by Cesar Morales Garduño on 6/29/24.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        VStack {
            Image("android-icon")
                .resizable()
                // .scaleToFit()
                .padding(50)
                .frame(width:300, height:300)
                .background(Color.gray)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.blue, lineWidth: 4))
            .shadow(color: Color.gray, radius: 5)

            Image(systemName: "person.fill.badge.minus")
                .resizable()
                .padding(50)
                .frame(width: 300, height: 300)
                .foregroundColor(.blue)
                .background(Color.gray)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.blue, lineWidth: 4))
                .shadow(color: Color.gray, radius: 5)
        }
    }
}

#Preview {
    ImageView()
}
