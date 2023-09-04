//
//  Event.swift
//  VolunTeen AZ
//
//  Created by Nadia Shovkovy on 9/3/23.
//

import FirebaseFirestoreSwift
import Firebase

struct Event: Identifiable, Decodable {
    @DocumentID var id: String?
    let eventTitle: String
    let eventDescription: String
    let eventDate: String
    let eventStartTime: String
    let eventEndTime: String
    let eventLocation: String
    let uid: String
    
    var user: User?
}
