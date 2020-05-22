//
//  DetailView.swift
//  SafePassword
//
//  Created by Константин Лопаткин on 29.04.2020.
//  Copyright © 2020 Konstantin Lopatkin. All rights reserved.
//

import SwiftUI
import CoreData
import CryptoSwift


struct DetailView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: PasswordItem.getPasswordItem()) var PasswordItems: FetchedResults<PasswordItem>
    //var context: NSManagedObjectContext!
    //var passwordItem: PasswordItem!
    @State private var back = false
    @State private var service = ""
    @State private var login = ""
    @State private var password = ""
    //@State var encrypted: Array<UInt8> = []

    @ObservedObject var model = Model()
    
    var body: some View {
        
            Form {
                TextField("Сервис", text: self.$service)
               // TextField("URL", text: self.$URLItems)
                TextField("Логин", text: self.$login)
                    .keyboardType(.emailAddress)
                TextField("Пароль", text: self.$password) {
                   // UIApplication.shared.endEditing()
                }
            }
                

            .navigationBarItems(trailing: Button(action: {
                self.back.toggle()
                let passwordItem = PasswordItem(context: self.managedObjectContext)
                passwordItem.setValue(self.service, forKey: "service")
                passwordItem.setValue(self.login, forKey: "login")
                //passwordItem.setValue(self.password, forKey: "password")
                do {
                    let solt = self.model.AESEncrypt(password: self.password)
                    passwordItem.setValue(solt, forKey: "solt")

                    try self.managedObjectContext.save()
                    
                   // print("good save")
                }catch let error as NSError {
                    print(error.localizedDescription)
                }
                
                self.password = ""
                self.service = ""
                self.login = ""
                self.presentationMode.wrappedValue.dismiss()
                }) { Text("Сохранить")}
            )
                .navigationBarTitle("\(self.service)", displayMode: .inline)
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
