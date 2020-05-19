//
//  RowView.swift
//  SafePassword
//
//  Created by Константин Лопаткин on 07.05.2020.
//  Copyright © 2020 Konstantin Lopatkin. All rights reserved.
//

import SwiftUI

struct RowView: View {
    @State var biometricOn = false
    @State var signInSuccess = false
let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var body: some View {
        NavigationView {
                    Form {
                        NavigationLink(destination: ListView()) {
                            Image(systemName: "lock.fill")
                            Text("Пароли").padding(.horizontal,17)
                        }
                        NavigationLink(destination: GeneratePasswordView()) {
                            Image(systemName: "signature")
                            Text("Генерация пароля").padding(.horizontal, 4)
                        }
                        NavigationLink(destination: SettingsView()) {
                            Image(systemName: "gear")
                            Text("Настройки").padding(.horizontal, 9)
                        }
                    }
                   .navigationBarTitle("Общее")
            
                }
        
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView()
    }
}
