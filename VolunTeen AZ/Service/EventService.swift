//
//  EventService.swift
//  VolunTeen AZ
//
//  Created by Nadia Shovkovy on 9/3/23.
//

import Firebase

struct EventService {
    
    func uploadEvent(eventTitle: String, eventDescription: String, eventDate: String, eventStartTime: String, eventEndTime: String, eventLocation: String, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        let data = ["uid": uid,
                    "title": eventTitle,
                    "description": eventDescription,
                    "date": eventDate,
                    "start time": eventStartTime,
                    "end time": eventEndTime,
                    "location": eventLocation]
        
        Firestore.firestore().collection("events").document()
            .setData(data) { error in
                if let error = error {
                    print("DEBUG: Failed to upload event")
                    completion(false)
                    return
                }
                
                completion(true)
        }
    }
    
    func fetchEvents(completion: @escaping([Event]) -> Void) {
        Firestore.firestore().collection("events").getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            let events = documents.compactMap({ try? $0.data(as: Event.self) })
            completion(events)
            

        }
    }
}
