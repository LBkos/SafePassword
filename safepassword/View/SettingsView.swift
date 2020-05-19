//
//  SettingsView.swift
//  SafePassword
//
//  Created by Константин Лопаткин on 29.04.2020.
//  Copyright © 2020 Konstantin Lopatkin. All rights reserved.
//

import SwiftUI


struct SettingsView: View {
    
    @ObservedObject var biometricOn = BiometricModel()
    var body: some View {
        List {
            Toggle(isOn: self.$biometricOn.isOn) {
                Text("Использовать биометрию")
            }//.padding()
        }
            .navigationBarTitle("Настройки")
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
