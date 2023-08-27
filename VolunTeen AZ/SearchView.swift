//
//  SearchView.swift
//  VolunTeen AZ
//
//  Created by Nadia Shovkovy on 7/20/23.
//

import SwiftUI

struct SearchView: View {
    
    @State private var eventToSearchFor = ""
    @State private var showAddNewEventView = false
    @State private var showFilterSearchView = false
    
    
    // user auth
    @StateObject var viewModel = AuthViewModel()
    @State private var selectedUser: User?
    private var user: User? {
        return viewModel.currentUser
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    VStack {
                        Text("Explore")
                            .font(.largeTitle)
                            .bold()
                        
                        Image("SpeakerBlob")
                            .resizable()
                            .frame(width:100, height: 100)
                            .padding(-20)
                        
                        HStack(spacing: -5) {
                            SearchBarView(searchText: $eventToSearchFor, placeholder: "Search Events In Arizona...")
                                .padding(.top)
                            
                            
                            Button {
                                showFilterSearchView.toggle()
                            } label: {
                                Image(systemName: "slider.vertical.3")
                                    .imageScale(.large)
                                    .padding(.trailing)
                                    .padding(.top)
                                    .foregroundColor(.black)
                            }
                                
                        }
                        Image("ArizonaState")
                            .resizable()
                            .frame(width: 300, height: 300)
                            .padding(.top, 100)
                    }
                    Spacer()
                }
            }
            .fullScreenCover(isPresented: $showAddNewEventView, content: {
                AddNewEventView()
            })
            .fullScreenCover(isPresented: $showFilterSearchView, content: {
               FilterEventSearchView()
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink {
                        ProfileView()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        CircularProfileImage(user: user, size: .small)
                            .navigationBarBackButtonHidden(true)
                            .padding(.bottom)
                            .padding(.top)
                            .padding(.trailing)
                    }
                }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showAddNewEventView.toggle()
                        } label: {
                            Image(systemName: "plus.circle.fill")
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

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
