//
//  ListView.swift
//  SafePassword
//
//  Created by Константин Лопаткин on 29.04.2020.
//  Copyright © 2020 Konstantin Lopatkin. All rights reserved.
//

import SwiftUI
import CoreData
import CryptoKit

struct ListView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: PasswordItem.getPasswordItem()) var PasswordItems: FetchedResults<PasswordItem>
    
    @State private var showingDetail = false
    @ObservedObject var model = Model()
    
    var body: some View {
        //NavigationView {
            VStack(alignment: .leading) {
                List {
                    ForEach(self.PasswordItems) { passwordItem in
                        NavigationLink(destination: DetailPassword(service: passwordItem.service ?? "", login: passwordItem.login ?? "", solt: self.model.AESDecrypt(solt: passwordItem.solt ?? []))) {
                            PasswordView(service: passwordItem.service ?? "")
                        }
                    }.onDelete { IndexSet in
                        let deleteItem = self.PasswordItems[IndexSet.first!]
                        self.managedObjectContext.delete(deleteItem)
                        do {
                            try self.managedObjectContext.save()
                        } catch {
                            print(error)
                        }
                    }
                }//List
                    
                NavigationLink(destination: DetailView()) {
                    Image(systemName: "plus.circle.fill")
                    Text("Новый пароль")
                    }//NavigationLink
                .font(.headline)
                .foregroundColor(.purple)
                .padding()
            }//VStack
            .navigationBarTitle("Пароли")
            .navigationBarItems(trailing: EditButton().foregroundColor(.purple))
        //}
    }//body
}//struct ListView
//struct ListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListView()
//    }
//}
