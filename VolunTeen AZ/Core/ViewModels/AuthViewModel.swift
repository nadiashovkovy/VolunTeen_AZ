//
//  AuthViewModel.swift
//  VolunTeen AZ
//
//  Created by Nadia Shovkovy on 7/22/23.
//

import SwiftUI
import Foundation
import Firebase
import FirebaseFirestoreSwift
import PhotosUI


protocol AuthenticationFormProtocol {
    var formIsValid: Bool {get}
}


@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var didUploadEvent = false
    

    
    @Published var selectedItem: PhotosPickerItem? {
        didSet { Task { try await loadImage() } }
    }
    
    @Published var profileImage: Image?
    
    
    func loadImage() async throws {
        guard let item = selectedItem else { return }
        guard let imageData = try await item.loadTransferable(type: Data.self) else {return}
        guard let uiImage = UIImage(data: imageData) else {return}
        self.profileImage = Image(uiImage: uiImage)
    }
    
    
    init() {
        self.userSession = Auth.auth().currentUser

        Task {
            await fetchUser()
        }
    }

    
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            print("DEBUG: Failed to log in with error \(error.localizedDescription)")
        }
    }
    
    func uploadEvent(withEventTitle eventTitle: String, eventDescription: String, eventDate: String, eventStartTime: String, eventEndTime: String, eventLocation: String) {
        let service = EventService()
        do {
            service.uploadEvent(eventTitle: eventTitle, eventDescription: eventDescription, eventDate: eventDate, eventStartTime: eventStartTime, eventEndTime: eventEndTime, eventLocation: eventLocation) { success in
                if success {
                    self.didUploadEvent = true
                } else {
                    // show error message to the user
                }
            }
        }
    }

    
    func createUser(withEmail email: String, password: String, fullName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(fullName: fullName, email: email)
            let encodedUser = try Firestore.Encoder().encode(user) 
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    
    func signOut() {
        do {
            try Auth.auth().signOut() // signs out user in the backend
            self.userSession = nil // wipes out user session and takes us back to login
            self.currentUser = nil // wipes out current user data model
        } catch {
            print("DEBUG:Failed to sign out with error \(error.localizedDescription)")
        }
    }
    
    func deleteAccount() {
        print("delete account")
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        self.currentUser = try? snapshot.data(as: User.self)
     
    }
}
