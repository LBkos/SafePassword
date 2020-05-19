//
//  ContentView.swift
//  safepassword
//
//  Created by Константин Лопаткин on 11.05.2020.
//  Copyright © 2020 Konstantin Lopatkin. All rights reserved.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: User.getUser()) var Users: FetchedResults<User>
    @State var signUpUser = false
    @State var signInSuccess = false
    //let appDelegate = UIApplication.shared.delegate as! AppDelegate
    @State var userPass: String = ""
    
    
    var body: some View {
        
        Group {
            if userPass != "" {
                SignView()
            } else {
                SignUp()
            }
        }.onAppear {
            //self.authenticate()
            for user in self.Users {
                self.userPass = user.password ?? ""
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
