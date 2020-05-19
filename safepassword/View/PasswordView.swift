//
//  PasswordView.swift
//  SafePassword
//
//  Created by Константин Лопаткин on 30.04.2020.
//  Copyright © 2020 Konstantin Lopatkin. All rights reserved.
//

import SwiftUI

struct PasswordView: View {
    
    var service: String = ""
    
    var body: some View {
        Text(service)
            .font(.headline)
    }
}

struct PasswordView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordView(service: "hello")
    }
}
