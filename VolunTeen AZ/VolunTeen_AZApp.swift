//
//  VolunTeen_AZApp.swift
//  VolunTeen AZ
//
//  Created by Nadia Shovkovy on 7/20/23.
//

import SwiftUI
import Firebase

@main
struct VolunTeen_AZApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            OpeningAppView()
                .environmentObject(viewModel)
        }
    }
}
