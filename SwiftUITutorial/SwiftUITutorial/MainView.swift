//
//  MainView.swift
//  SwiftUITutorial
//
//  Created by Cesar Morales Garduño on 6/29/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ScrollView{
            VStack {
                MapView()
                    .frame(height: 400)
                ImageView()
                    .offset(y:-150)
                Divider()
                    .padding()
                ContentView()
            }
        }
    }
}

#Preview {
    MainView()
}
