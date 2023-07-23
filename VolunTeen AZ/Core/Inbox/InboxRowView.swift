//
//  InboxRowView.swift
//  VolunTeen AZ
//
//  Created by Nadia Shovkovy on 7/22/23.
//

import SwiftUI

struct InboxRowView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            CircularProfileImage(user: User.MOCK_USER, size: .medium)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Olivia Shovkovy")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text("Some test message for now that spans over one line")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
                    .frame(maxWidth: UIScreen.main.bounds.width - 100, alignment: .leading)
            }
            
            HStack {
                Text("Yesterday")
                
                Image(systemName: "chevron.right")
            }
            .font(.footnote)
            .foregroundColor(.gray)
        }
        .frame(height: 72)
    }
}

struct InboxRowView_Previews: PreviewProvider {
    static var previews: some View {
        InboxRowView()
    }
}
