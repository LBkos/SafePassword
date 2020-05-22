//
//  SignInView.swift
//  safepassword
//
//  Created by Константин Лопаткин on 12.05.2020.
//  Copyright © 2020 Konstantin Lopatkin. All rights reserved.
//

import SwiftUI
import CoreData
import LocalAuthentication


struct SignView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: User.getUser()) var Users: FetchedResults<User>
    @State var signInSuccess = false
    //@State var signUpUser = false
    
    
    var body: some View {
        return Group {
            if signInSuccess {
                RowView()
            }
            else {
                SignInView(signInSuccess: $signInSuccess)
            }
        }
    }
}

struct SignUp: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: User.getUser()) var Users: FetchedResults<User>
    
    @State var signUpSuccess = false
    @State var signInSuccess = false
    
    var body: some View {
        return Group {
            if signUpSuccess {
                SignView()
            }
            else {
                SignUpView(signUpSuccess: $signUpSuccess)
            }
        }
    }
}

struct SignUpView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: User.getUser()) var Users: FetchedResults<User>
    
    @Binding var signUpSuccess: Bool
    @State var password: String = ""
    @State var password2: String = ""
    
    @State var error: Bool = false
    
    func savePassword() {
        if self.password == "" {
            error = true
        } else if self.password == self.password2 {
            let user = User(context: self.managedObjectContext)
            user.password = self.password
            do {
                try self.managedObjectContext.save()
                self.signUpSuccess = true
            }catch let error as NSError {
                print(error.localizedDescription)
            }
        } else {
            error = true
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("SafePassword")
                    .font(.system(size: 32, weight: .heavy))
                VStack {
                    if error {
                        Text("Попробуйте ещё")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.red)
                    }//if
                    
                    SecureField("Пароль", text: $password){
                        UIApplication.shared.endEditing()
                    }
                    .font(.system(size: 14))
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder())
                    SecureField("Проверка пароля", text: $password2) {
                        UIApplication.shared.endEditing()
                    }
                    .font(.system(size: 14))
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder())
                }
                .padding(.vertical, 64)
                
                Button(action: {
                    self.savePassword()
                }) {
                    Text("Зарегистрироваться")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .bold))
                        .background(LinearGradient(gradient: Gradient(colors: [Color(.purple), (.blue)]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(5)
                }
                
                
                Spacer()
            }
        }
            
        .padding(.horizontal, 32)
    }
}

struct SignInView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: User.getUser()) var Users: FetchedResults<User>
    @State private var back = false
    @Binding var signInSuccess: Bool
    @State var userPassword: String = ""
    @State var password: String = ""
    @State var error: Bool = false
    @ObservedObject var biometricOn = BiometricModel()
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reson = "Приложите палец, чтобы войти в приложение"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reson) {  success, authenticationError in
                DispatchQueue.global().async {
                    if success {
                        self.signInSuccess = true
                    } else {
                        self.signInSuccess = false
                        //if problem
                    }
                }
            }
        } else {
            //no biometric
        }
    }
    
    
    var body: some View {
        NavigationView {
            VStack {
                Text("SafePassword")
                    .font(.system(size: 32, weight: .heavy))
                
                VStack {
                    if error {
                        Text("Неправельный пароль")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.red)
                        //.padding()
                    }
                    
                    SecureField("Пароль", text: $password)
                        .font(.system(size: 14))
                        .padding(12)
                        .background(RoundedRectangle(cornerRadius: 5).strokeBorder())
                }.onAppear {
                    if self.biometricOn.isOn {
                        self.authenticate()
                    }
                }
                .padding(.vertical, 64)
                
                Button(action: {
                    
                    for user in self.Users {
                        self.userPassword = user.password ?? ""
                    }
                    if self.userPassword == self.password {
                        self.signInSuccess = true
                    } else {
                        self.error = true
                    }
                })
                {
                    Text("Войти")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .bold))
                        .background(LinearGradient(gradient: Gradient(colors: [Color(.purple), (.blue)]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(5)
                }
                Spacer()
            }
        }
        .padding(.horizontal, 32)
    }
}


//struct SignInView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignInView(signInSuccess:)
//    }
//}
