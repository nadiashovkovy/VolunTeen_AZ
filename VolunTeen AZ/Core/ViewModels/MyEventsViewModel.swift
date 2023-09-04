//
//  MyEventsViewModel.swift
//  VolunTeen AZ
//
//  Created by Nadia Shovkovy on 9/3/23.
//

import Foundation

class MyEventsViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var events = [Event]()
    let service = EventService()
    
    init() {
        fetchEvents()
    }
    
    func fetchEvents() {
        service.fetchEvents { events in
            self.events = events
        }
    }
}
