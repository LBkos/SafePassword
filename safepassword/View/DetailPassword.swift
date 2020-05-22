//
//  DetailPassword.swift
//  SafePassword
//
//  Created by Константин Лопаткин on 30.04.2020.
//  Copyright © 2020 Konstantin Lopatkin. All rights reserved.
//

import SwiftUI
import CoreData
import CryptoSwift


struct DetailPassword: View {
    @ObservedObject var model = Model()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: PasswordItem.getPasswordItem()) var PasswordItems: FetchedResults<PasswordItem>
    @State var backList: Bool = false
    @State var service: String = ""
    @State var login: String = ""
    //@State var password: String = ""
    @State var solt: String = ""
    
    var body: some View {
        
        Form {
            TextField("", text: $service)
            TextField("", text: $login).keyboardType(.emailAddress)
            TextField("", text: $solt)
        }
//                    .navigationBarItems(trailing: Button(action: {
//                        self.backList.toggle()
//                        print(self.password)
//                        //self.presentationMode.wrappedValue.dismiss()
//                    }) {
//                        Text("Сохранить")
//                        }
//                    )
            
            .navigationBarTitle("\(self.service)", displayMode: .inline)
    }
}

//struct DetailPassword_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailPassword(service: "gog", login: "KOS", password: "1234", id: )
//    }
//}
