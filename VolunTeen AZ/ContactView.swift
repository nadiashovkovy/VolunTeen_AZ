//
//  ContactView.swift
//  VolunTeen AZ
//
//  Created by Nadia Shovkovy on 7/20/23.
//

import SwiftUI

struct ContactView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var showNewMessageView = false
//    @State private var user = User.MOCK_USER
    
    
    var body: some View {
        if let user = viewModel.currentUser {
            ZStack {
                
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
                            ForEach(0 ... 10, id: \.self) { message in
                                InboxRowView()
                            }
                        }
                        .listStyle(PlainListStyle())
                        .frame(height: UIScreen.main.bounds.height - 120)
                    }
                    .fullScreenCover(isPresented: $showNewMessageView, content: {
                        NewMessageView()
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
    }
}


struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}
