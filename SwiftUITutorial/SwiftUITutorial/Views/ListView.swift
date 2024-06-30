//
//  ListView.swift
//  SwiftUITutorial
//
//  Created by Cesar Morales Garduño on 6/29/24.
//

import SwiftUI

final class ProgrammersModelData: ObservableObject {

    @Published var programmers = [
        Programmer(id: 0, name: "Cesar", languages: "Kotlin, Swift, TypeScript", avatar: Image(systemName: "person.fill"), favorite: true),
        Programmer(id: 1, name: "John", languages: "Java, Python, Ruby", avatar: Image(systemName: "person.fill"), favorite: false),
        Programmer(id: 2, name: "Jane", languages: "C++, C#, JavaScript", avatar: Image(systemName: "person.fill"), favorite: false),
        Programmer(id: 3, name: "Paul", languages: "Go, Rust, Scala", avatar: Image(systemName: "person.fill"), favorite: true),
        Programmer(id: 4, name: "Ringo", languages: "Perl, PHP, SQL", avatar: Image(systemName: "person.fill"), favorite: false),
        Programmer(id: 5, name: "George", languages: "Haskell, Lua, Objective-C", avatar: Image(systemName: "person.fill"), favorite: false),
        Programmer(id: 6, name: "Stuart", languages: "Assembly, Bash, Clojure", avatar: Image(systemName: "person.fill"), favorite: false),
        Programmer(id: 7, name: "Pete", languages: "Elixir, Erlang, F#", avatar: Image(systemName: "person.fill"), favorite: true),
        Programmer(id: 8, name: "Brian", languages: "Groovy, Julia, Lisp", avatar: Image(systemName: "person.fill"), favorite: false),
        Programmer(id: 9, name: "Mick", languages: "Pascal, R, Ruby", avatar: Image(systemName: "person.fill"), favorite: false)
        
    ]
}

struct ListView: View {
    @EnvironmentObject var ProgrammersModelData: ProgrammersModelData
    @State private var showFavorites = false

    private var filteredProgrammers: [Programmer] {
        return ProgrammersModelData.programmers.filter { programmer in
            return !showFavorites || programmer.favorite
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                Toggle(isOn: $showFavorites) {
                    Text("Show Favorites Only")
                }.padding()
                
                List {
                    ForEach(filteredProgrammers, id: \.id) { programmer in
                        NavigationLink(
                            destination: ListDetailView(
                                programmer: programmer, 
                                favorite: $ProgrammersModelData.programmers[programmer.id].favorite
                            )
                        ) {
                            RowView(programmer: programmer) 
                        }
                    }
                }
            }.navigationTitle("Programmers")
        }        
    }
}

#Preview {
    ListView().environmentObject(ProgrammersModelData())
}
