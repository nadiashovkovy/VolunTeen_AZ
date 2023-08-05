//
//  CircularProfileImage.swift
//  VolunTeen AZ
//
//  Created by Nadia Shovkovy on 7/22/23.
//

import SwiftUI

enum ProfileImageSize {
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xLarge
    
    var dimension: CGFloat {
        switch self {
        case.xxSmall: return 28
        case.xSmall: return 32
        case.small: return 42
        case.medium: return 56
        case.large: return 64
        case.xLarge: return 72
        }
    }
}

struct CircularProfileImage: View {
    var user: User?
    let size: ProfileImageSize
    
    var body: some View {
        if let imageUrl = user?.profileImageUrl {
            Image(imageUrl)
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: size.dimension, height: size.dimension)
                .foregroundColor(Color.accentColor)
        }
    }
}

struct CircularProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileImage(user: User.MOCK_USER, size: .medium)
    }
}
