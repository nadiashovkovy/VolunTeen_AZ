//
//  ContactView.swift
//  VolunTeen AZ
//
//  Created by Nadia Shovkovy on 7/20/23.
//

import SwiftUI

struct ContactView: View {
//    @EnvironmentObject var viewModel: AuthViewModel
    @State private var showNewMessageView = false
    @StateObject var viewModel = InboxViewModel()
    @State private var selectedUser: User?
    @State private var showChat = false
    
    private var user: User? {
        return viewModel.currentUser
    }
    
    
    var body: some View {
                NavigationStack {
                    ScrollView {
                        VStack {
                            
                            Text("Chats")
                                .font(.largeTitle)
                                .bold()
                            
                            Image("TwoRaisedBlobs")
                                .resizable()
                                .frame(width:100, height: 100)
                                .padding(-20)
                            
                        }
                        .padding(.bottom)
                        
                        ActiveNowView()
                        
                        List {
                            ForEach(viewModel.recentMessages) { message in
                                ZStack {
                                    NavigationLink(value: message) {
                                        EmptyView()
                                    }
                                    .opacity(0.0)
                                    
                                   InboxRowView(message: message)
                                }
                            }
                        }
                        .listStyle(PlainListStyle())
                        .frame(height: UIScreen.main.bounds.height - 120)
                    }
                    .onChange(of: selectedUser, perform: { newValue in
                        showChat = newValue != nil
                    })
                    .navigationDestination(for: Message.self, destination: { message in
                        if let user = message.user {
                            ChatView(user: user)
                        }
                    })
                    .navigationDestination(isPresented: $showChat, destination: {
                        if let user = selectedUser {
                            ChatView(user: user)
                        }
                    })
                    .fullScreenCover(isPresented: $showNewMessageView, content: {
                        NewMessageView(selectedUser: $selectedUser)
                    })
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            CircularProfileImage(user: user, size: .small)
                                .padding(.bottom)
                                .padding(.top)
                                .padding(.trailing)
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                showNewMessageView.toggle()
                                selectedUser = nil
                            } label: {
                                Image(systemName: "square.and.pencil.circle.fill")
                                    .resizable()
                                    .frame(width: 42, height: 42)
                                    .foregroundColor(Color(UIColor(named: "MyPink")!))
                                    .padding(.bottom)
                                    .padding(.top)
                                    .padding(.leading)
                            }
                        }
                    }
                }
    }
}


struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}
