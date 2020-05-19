//
//  PasswordItem+CoreDataProperties.swift
//  safepassword
//
//  Created by Константин Лопаткин on 12.05.2020.
//  Copyright © 2020 Konstantin Lopatkin. All rights reserved.
//
//

import Foundation
import CoreData


extension PasswordItem {

    static func getPasswordItem() -> NSFetchRequest<PasswordItem> {
        let request: NSFetchRequest<PasswordItem> = PasswordItem.fetchRequest() as! NSFetchRequest<PasswordItem>

            let sortDescriptor = NSSortDescriptor(key: "service", ascending: true)
            
            request.sortDescriptors = [sortDescriptor]

        return request
    }
}
