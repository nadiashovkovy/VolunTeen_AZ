//
//  EventFilterViewModel.swift
//  VolunTeen AZ
//
//  Created by Nadia Shovkovy on 9/3/23.
//

import Foundation

enum EventFilterViewModel: Int, CaseIterable {
    case likes
    
    var title: String {
        switch self {
        case .likes: return "Likes"
        }
    }
}
