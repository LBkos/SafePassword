//
//  DetailPassword.swift
//  SafePassword
//
//  Created by Константин Лопаткин on 30.04.2020.
//  Copyright © 2020 Konstantin Lopatkin. All rights reserved.
//

import SwiftUI
import CoreData

struct DetailPassword: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: PasswordItem.getPasswordItem()) var PasswordItems: FetchedResults<PasswordItem>
    @State var backList: Bool = false
    @State var service: String = ""
    @State var login: String = ""
    @State var password: String = ""
    @State var id: NSManagedObjectID
    @ObservedObject var model = Model()
    
    var body: some View {
        Form {
            TextField("", text: $service)
            TextField("", text: $login).keyboardType(.emailAddress)
            TextField("", text: $password)
            
        }
        .navigationBarItems(trailing: Button(action: {
            self.backList.toggle()
            self.model.update(id: self.id, service: self.service, login: self.login, password: self.password)
            self.presentationMode.wrappedValue.dismiss()
            
        }) {
            Text("Сохранить")
            }
        )
            .navigationBarTitle("\(self.service)", displayMode: .inline)
    }
}

//struct DetailPassword_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailPassword(service: "gog", login: "KOS", password: "1234", id: )
//    }
//}
