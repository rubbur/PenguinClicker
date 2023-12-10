//
//  Player+CoreDataProperties.swift
//  PenguinClicker
//
//  Created by Michael Mathews on 12/9/23.
//
//

import Foundation
import CoreData


extension Player {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Player> {
        return NSFetchRequest<Player>(entityName: "Player")
    }

    @NSManaged public var coinCount: Int32

}

extension Player : Identifiable {

}
