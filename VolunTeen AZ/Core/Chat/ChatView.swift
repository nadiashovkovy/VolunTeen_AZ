//
//  ChatView.swift
//  VolunTeen AZ
//
//  Created by Nadia Shovkovy on 7/22/23.
//

import SwiftUI

struct ChatView: View {
    @State private var messageText = ""
    var body: some View {
        VStack {
            ScrollView {
                // header
                
                VStack {
                    CircularProfileImage(user: User.MOCK_USER, size: .xLarge)
                    
                    VStack(spacing: 4) {
                        Text("Olivia Shovkovy")
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text("Messenger")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }

                }
                                
                // messages
                ForEach(0 ... 15, id: \.self) { message in
                    ChatMessageCell(isFromCurrentUser: Bool.random())
                }
            }
            
            // message input view
            
            Spacer()
            
            ZStack(alignment: .trailing) {
                TextField("Message...", text: $messageText, axis: .vertical)
                    .padding(12)
                    .padding(.trailing, 48)
                    .background(Color(.systemGroupedBackground))
                    .clipShape(Capsule())
                    .font(.subheadline)
                
                Button {
                    print("Send message")
                } label: {
                    Text("Send")
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                }
                .padding(.horizontal)

            }
            .padding(.horizontal)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
