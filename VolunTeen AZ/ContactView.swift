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
    @State private var user = User.MOCK_USER
    
    
    var body: some View {
            ZStack {
                
                NavigationStack {
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
                    
                    ScrollView {
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
                    .padding(.top)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                showNewMessageView.toggle()
                            } label: {
                                Image(systemName: "square.and.pencil.circle.fill")
                                    .resizable()
                                    .frame(width: 40, height: 40)
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
