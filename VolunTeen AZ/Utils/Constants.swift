//
//  Contents.swift
//  VolunTeen AZ
//
//  Created by Nadia Shovkovy on 8/5/23.
//

import Foundation
import Firebase

struct FirestoreConstants {
    
    static let UsersCollection = Firestore.firestore().collection("users")
    static let MessagesCollection = Firestore.firestore().collection("messages")
    
}
