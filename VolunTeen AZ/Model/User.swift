//
//  User.swift
//  VolunTeen AZ
//
//  Created by Nadia Shovkovy on 7/22/23.
//

import Foundation
import FirebaseFirestoreSwift


struct User: Codable, Identifiable, Hashable  {
    @DocumentID var uid: String?
    let fullName: String
    let email: String
    var profileImageUrl: String?
    
    var id: String {
        return uid ?? NSUUID().uuidString
    }
    
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullName) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        
        return ""
    }
    
    var firstName: String {
        let formatter = PersonNameComponentsFormatter()
        let components = formatter.personNameComponents(from: fullName)
        return components?.givenName ?? fullName
    }
    
    
    
}

extension User {
    static let MOCK_USER = User(fullName: "Olivia Shovkovy", email: "oliviatest@gmail.com", profileImageUrl: "CloudBlob")
}
