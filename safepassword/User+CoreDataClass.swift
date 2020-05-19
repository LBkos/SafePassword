//
//  User+CoreDataClass.swift
//  safepassword
//
//  Created by Константин Лопаткин on 12.05.2020.
//  Copyright © 2020 Konstantin Lopatkin. All rights reserved.
//
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject, Identifiable {
    @NSManaged public var password: String?
}
