//
//  PasswordItem+CoreDataClass.swift
//  safepassword
//
//  Created by Константин Лопаткин on 12.05.2020.
//  Copyright © 2020 Konstantin Lopatkin. All rights reserved.
//
//

import Foundation
import CoreData

@objc(PasswordItem)
public class PasswordItem: NSManagedObject, Identifiable {
    @NSManaged public var service: String?
    @NSManaged public var password: String?
    @NSManaged public var login: String?
    //@NSManaged public var id: NSManagedObjectID?
}
