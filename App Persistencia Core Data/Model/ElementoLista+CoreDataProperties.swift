//
//  ElementoLista+CoreDataProperties.swift
//  App Persistencia Core Data
//
//  Created by Cesar Morales Garduño on 5/23/24.
//
//

import Foundation
import CoreData


extension ElementoLista {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ElementoLista> {
        return NSFetchRequest<ElementoLista>(entityName: "ElementoLista")
    }

    @NSManaged public var nombre: String?

}

extension ElementoLista : Identifiable {

}
