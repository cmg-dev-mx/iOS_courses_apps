//
//  ListView.swift
//  SwiftUITutorial
//
//  Created by Cesar Morales Garduño on 6/29/24.
//

import SwiftUI

struct ListView: View {

    private let programmers = [
        Programmer(id: 1, name: "Cesar", languages: "Kotlin, Swift, TypeScript", avatar: Image(systemName: "person.fill")),
        Programmer(id: 2, name: "John", languages: "Java, Python, Ruby", avatar: Image(systemName: "person.fill")),
        Programmer(id: 3, name: "Jane", languages: "C++, C#, JavaScript", avatar: Image(systemName: "person.fill")),
        Programmer(id: 4, name: "Paul", languages: "Go, Rust, Scala", avatar: Image(systemName: "person.fill")),
        Programmer(id: 5, name: "Ringo", languages: "Perl, PHP, SQL", avatar: Image(systemName: "person.fill")),
        Programmer(id: 6, name: "George", languages: "Haskell, Lua, Objective-C", avatar: Image(systemName: "person.fill")),
        Programmer(id: 7, name: "Stuart", languages: "Assembly, Bash, Clojure", avatar: Image(systemName: "person.fill")),
        Programmer(id: 8, name: "Pete", languages: "Elixir, Erlang, F#", avatar: Image(systemName: "person.fill")),
        Programmer(id: 9, name: "Brian", languages: "Groovy, Julia, Lisp", avatar: Image(systemName: "person.fill")),
        Programmer(id: 10, name: "Mick", languages: "Pascal, R, Ruby", avatar: Image(systemName: "person.fill"))
        
    ]

    var body: some View {
        List {
            ForEach(programmers, id: \.id) { programmer in
                RowView(programmer: programmer)
            }
        }
    }
}

#Preview {
    ListView()
}
