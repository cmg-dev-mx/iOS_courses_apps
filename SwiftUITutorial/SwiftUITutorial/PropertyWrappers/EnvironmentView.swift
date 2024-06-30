//
//  EnvironmentView.swift
//  SwiftUITutorial
//
//  Created by Cesar Morales Garduño on 6/29/24.
//

import SwiftUI

struct EnvironmentView: View {

    @EnvironmentObject var user: UserData
    
    var body: some View {
        Text(user.name)
    }
}

#Preview {
    EnvironmentView().environmentObject(UserData())
}
