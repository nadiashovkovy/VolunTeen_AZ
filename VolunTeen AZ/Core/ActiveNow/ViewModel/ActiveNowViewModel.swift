//
//  ActiveNowViewModel.swift
//  VolunTeen AZ
//
//  Created by Nadia Shovkovy on 8/5/23.
//

import Foundation


class ActiveNowViewModel: ObservableObject {
    @Published var users = [User]()
    
    
    init() {
        Task {try await fetchUsers() }
    }
    
    @MainActor
    private func fetchUsers() async throws {
        self.users = try await UserService.fetchAllUsers()
    }
}
