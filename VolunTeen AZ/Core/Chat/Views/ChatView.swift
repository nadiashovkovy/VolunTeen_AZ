//
//  ChatView.swift
//  VolunTeen AZ
//
//  Created by Nadia Shovkovy on 7/22/23.
//

import SwiftUI

struct ChatView: View {
    @StateObject var viewModel: ChatViewModel
    let user: User
    
    
    init (user: User) {
        self.user = user
        self._viewModel = StateObject(wrappedValue: ChatViewModel(user: user))
    }
    
    var body: some View {
        VStack {
            ScrollView {
                // header
                
                VStack {
                    CircularProfileImage(user: user, size: .xLarge)
                    
                    VStack(spacing: 4) {
                        Text(user.fullName)
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text("Messenger")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }

                }
                                
                // messages
                ForEach(viewModel.messages) { message in
                    ChatMessageCell(message: message)
                }
            }
            
            // message input view
            
            Spacer()
            
            ZStack(alignment: .trailing) {
                TextField("Message...", text: $viewModel.messageText, axis: .vertical)
                    .padding(12)
                    .padding(.trailing, 48)
                    .background(Color(.systemGroupedBackground))
                    .clipShape(Capsule())
                    .font(.subheadline)
                    .padding(.bottom, 12)
                
                Button {
                    viewModel.sendMessage()
                    viewModel.messageText = ""
                } label: {
                    Text("Send")
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                        
                }
                .padding(.horizontal)
                .padding(.bottom, 12)

            }
            .padding(.horizontal)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(user: User.MOCK_USER)
    }
}
