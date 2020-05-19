//
//  GeneratePasswordView.swift
//  safepassword
//
//  Created by Константин Лопаткин on 15.05.2020.
//  Copyright © 2020 Konstantin Lopatkin. All rights reserved.
//

import SwiftUI

struct GeneratePasswordView: View {
    @State var lerght: Double = 8
    @State var genPass: String = ""
    
    func randomPass(length: Int = 7) -> String {
        //(-~!@#$%^&*_+=`|(){}[:;"'<>,.? ]
        enum source {
            static let source = Array("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ0123456789")
            static let count = UInt64(source.count)
        }
        
        var result = [Character](repeating: "-", count: length)
        
        for item in 0..<length {
            let rand = Int(arc4random_uniform(UInt32(source.count)))
            result[item] = source.source[rand]
        }
        return String(result)
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("\(randomPass(length: Int(lerght)))")
                    .font(.system(size: 18))
                    .cornerRadius(25)
                
                Spacer()
                Button(action: {
                    UIPasteboard.general.string = (self.randomPass(length: Int(self.lerght)))
                }) {
                    Image(systemName: "doc.on.doc.fill")
                        .foregroundColor(.secondary)
                }
            }
            Slider(value: $lerght, in: 8...28, step: 1)
            Spacer()
        }
        .padding([.vertical, .horizontal], 32)
        .navigationBarTitle("Генератор Пароля")
    }
}

struct GeneratePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        GeneratePasswordView()
    }
}
