//
//  User+CoreDataProperties.swift
//  safepassword
//
//  Created by Константин Лопаткин on 12.05.2020.
//  Copyright © 2020 Konstantin Lopatkin. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    static func getUser() -> NSFetchRequest<User> {
        let request: NSFetchRequest<User> = User.fetchRequest() as! NSFetchRequest<User>

            let sortDescriptor = NSSortDescriptor(key: "password", ascending: true)
            
            request.sortDescriptors = [sortDescriptor]

        return request
    }
}
