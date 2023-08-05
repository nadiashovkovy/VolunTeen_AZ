//
//  ActiveNowView.swift
//  VolunTeen AZ
//
//  Created by Nadia Shovkovy on 7/22/23.
//

import SwiftUI

struct ActiveNowView: View {
    @StateObject var viewModel = ActiveNowViewModel()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 32) {
                ForEach(viewModel.users, id: \.self) { user in
                    VStack {
                        ZStack(alignment: .bottomTrailing) {
                            CircularProfileImage(user: user, size: .medium)

                            
//                            ZStack {
//                                Circle()
//                                    .fill(.white)
//                                    .frame(width: 18, height: 18)
//
//                                Circle()
//                                    .fill(Color(.systemGreen))
//                                    .frame(width: 12, height: 12)
//                            }
                            
                        }
                        Text(user.firstName)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding()
        }
        .frame(height: 106)
    }
}

struct ActiveNowView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveNowView()
    }
}
