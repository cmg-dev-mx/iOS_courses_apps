//
//  Pais+CoreDataProperties.swift
//  Paises DataStore
//
//  Created by Cesar Morales Garduño on 5/23/24.
//
//

import Foundation
import CoreData


extension Pais {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pais> {
        return NSFetchRequest<Pais>(entityName: "Pais")
    }

    @NSManaged public var nombre: String?

}

extension Pais : Identifiable {

}
