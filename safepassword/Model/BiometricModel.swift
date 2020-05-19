//
//  BiometricModel.swift
//  safepassword
//
//  Created by Константин Лопаткин on 17.05.2020.
//  Copyright © 2020 Konstantin Lopatkin. All rights reserved.
//

import Foundation

class BiometricModel: ObservableObject {
    
    @Published var isOn: Bool = UserDefaults.standard.bool(forKey: "useTouchID") {
        didSet {
            UserDefaults.standard.set(self.isOn, forKey: "useTouchID")
        }
    }
    
}
