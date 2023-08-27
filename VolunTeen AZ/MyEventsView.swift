//
//  MyEventsView.swift
//  VolunTeen AZ
//
//  Created by Nadia Shovkovy on 7/20/23.
//

import SwiftUI

struct MyEventsView: View {
    
    // user auth
    @StateObject var viewModel = AuthViewModel()
    @State private var selectedUser: User?
    private var user: User? {
        return viewModel.currentUser
    }

    var body: some View {
            NavigationStack {
                VStack {
                    ScrollView {
                        Text("VolunTeen")
                            .font(.largeTitle)
                            .bold()
                        
                        Image("FourBlobs")
                            .resizable()
                            .frame(width:200, height: 100)
                            .padding(.top, -20)
                        
                        
                        
                        // the events start here
                        
                        VStack(spacing: -5) {
                            
                        Text("Upcoming Events")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title2)
                            .bold()
                            .padding(.top)
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal) {
                            HStack(spacing: 20) {
                                ForEach(0..<10) {
                                    Text("Event \($0)")
                                        .foregroundStyle(.white)
                                        .font(.largeTitle)
                                        .frame(width: 360, height: 150)
                                        .background(Color(UIColor(named: "MyYellow")!))
                                        .cornerRadius(10)
                                        .padding(.bottom, 25)
                                }
                            }
                        }
                        .padding()
                        
                        
                        
                        
                        Text("Saved")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title2)
                            .bold()
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal) {
                            HStack(spacing: 20) {
                                ForEach(0..<10) {
                                    Text("Event \($0)")
                                        .foregroundStyle(.white)
                                        .font(.largeTitle)
                                        .frame(width: 360, height: 150)
                                        .background(Color(UIColor(named: "MyYellow")!))
                                        .cornerRadius(10)
                                        .padding(.bottom, 25)
                                }
                            }
                        }
                        .padding()
                        
                        
                        
                        
                        Text("Reccomended")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title2)
                            .bold()
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal) {
                            HStack(spacing: 20) {
                                ForEach(0..<10) {
                                    Text("Event \($0)")
                                        .foregroundStyle(.white)
                                        .font(.largeTitle)
                                        .frame(width: 360, height: 150)
                                        .background(Color(UIColor(named: "MyYellow")!))
                                        .cornerRadius(10)
                                        .padding(.bottom, 25)
                                }
                            }
                        }
                        .padding()
                        
                        
                        
                        
                        Text("Events I've Shared")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title2)
                            .bold()
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal) {
                            HStack(spacing: 20) {
                                ForEach(0..<10) {
                                    Text("Event \($0)")
                                        .foregroundStyle(.white)
                                        .font(.largeTitle)
                                        .frame(width: 360, height: 150)
                                        .background(Color(UIColor(named: "MyYellow")!))
                                        .cornerRadius(10)
                                        .padding(.bottom, 25)
                                }
                            }
                        }
                        .padding()
                        
                        }
                    }
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
                    }
                }
            }
    }
}

struct MyEventsView_Previews: PreviewProvider {
    static var previews: some View {
        MyEventsView()
    }
}
