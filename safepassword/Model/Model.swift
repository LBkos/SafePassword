//
//  Model.swift
//  safepassword
//
//  Created by Константин Лопаткин on 15.05.2020.
//  Copyright © 2020 Konstantin Lopatkin. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData
import CryptoSwift
import CryptoKit
//@EnvironmentObject var observ: observer

class Model: ObservableObject {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: PasswordItem.getPasswordItem()) var PasswordItems: FetchedResults<PasswordItem>
     @State var password: String = ""
 
    
//    let key = SymmetricKey(size: .bits256)
//
//    func encryptArr(password: String) -> Array<UInt8> {
//        let solt: Data = password.data(using: .utf8)!
//        let encryptedContent = try! ChaChaPoly.seal(solt, using: key).combined
//        let arr = Array(encryptedContent)
//        return arr
//    }
//
//    func decryptArr(solt: Array<UInt8>) -> String {
//        let encryptData = Data(solt)
//        let sealedBox = try! ChaChaPoly.SealedBox(combined: encryptData)
//        let decryptedThemeSong = try! ChaChaPoly.open(sealedBox, using: key)
//        let result = String(data: encryptData, encoding: .utf8)
//        return result!
//    }
   
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    let key = "ZrnicMQK"
    let iv = "tEi1H3E1aj26XNro"
    let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    var keys: String = ""
    //let aesKey = String((0..<32).map{ _ in letters.randomElement()! })
//    @State var encryptedString: String = ""
//    @State var decryptedString: String = ""
    func randomString() -> String {
         keys = String((0..<32).map{ _ in letters.randomElement()! })
        return keys
    }
    
    func AESEncrypt(password: String) -> Array<UInt8> {
        
        let aesKey = key.padding(toLength: 32, withPad: "0", startingAt: 0)
        let solt = Array(password.bytes)
        let aes = try! AES(key: aesKey, iv: iv, padding: .pkcs7)
        let encrypted = try! aes.encrypt(solt)
        return encrypted
        
    }
    func AESDecrypt(solt: Array<UInt8>) -> String {
            
            let aesKey = key.padding(toLength: 32, withPad: "0", startingAt: 0)
            let aes = try! AES(key: aesKey, iv: iv, padding: .pkcs7)
            
            let decrypted = try! aes.decrypt(solt)
            let decryptedString = String.init(bytes: decrypted, encoding: .utf8) ?? "nil"
            //assert(password == decryptedString)
            return decryptedString
    }
    
    
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
    //    func update(id: NSManagedObjectID, service: String, login: String, password: String) {
    //           do {
    //               for item in PasswordItems.indices {
    //                   if PasswordItems[item].objectID == id {
    //                       PasswordItems[item].setValue(service, forKey: "service")
    //                       PasswordItems[item].setValue(login, forKey: "login")
    //                       PasswordItems[item].setValue(password, forKey: "password")
    //                       try managedObjectContext.save()
    //                   }
    //               }//if
    //           } catch {
    //               print(error.localizedDescription)
    //           }
    //       }
    
    
   
   
}



extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

