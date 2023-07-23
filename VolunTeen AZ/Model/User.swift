//
//  User.swift
//  VolunTeen AZ
//
//  Created by Nadia Shovkovy on 7/22/23.
//

import Foundation


struct User: Identifiable, Codable {
    let id: String
    let fullName: String
    let email: String
    var profileImageUrl: String?
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullName) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        
        return ""
    }
}

extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, fullName: "Olivia Shovkovy", email: "oliviatest@gmail.com", profileImageUrl: "CloudBlob")
}
