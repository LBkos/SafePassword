//
//  Model.swift
//  safepassword
//
//  Created by Константин Лопаткин on 15.05.2020.
//  Copyright © 2020 Konstantin Lopatkin. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData
//@EnvironmentObject var observ: observer

class Model: ObservableObject {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: PasswordItem.getPasswordItem()) var PasswordItems: FetchedResults<PasswordItem>
    
//    func update(id: NSManagedObjectID, service: String, login: String, password: String) {
//           do {
//               for item in PasswordItems.indices {
//                   if PasswordItems[item].objectID == id {
//                       PasswordItems[item].setValue(service, forKey: "service")
//                       PasswordItems[item].setValue(login, forKey: "login")
//                       PasswordItems[item].setValue(password, forKey: "password")
//                       try managedObjectContext.save()
//                   }
//               }//if
//           } catch {
//               print(error.localizedDescription)
//           }
//       }
}





extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
