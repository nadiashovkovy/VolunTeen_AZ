//
//  MyEventsView.swift
//  VolunTeen AZ
//
//  Created by Nadia Shovkovy on 7/20/23.
//

import SwiftUI

struct MyEventsView: View {
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        if let user = viewModel.currentUser {
            ZStack {
                VStack {
                    ScrollView {
                        Text("VolunTeen: Arizona")
                            .font(.largeTitle)
                            .bold()
                        
                        Image("FourBlobs")
                            .resizable()
                            .frame(width:200, height: 100)
                            .padding(.top, -20)
                        
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
                                }
                            }
                        }
                        .padding()
                        
                        Text("All Saved")
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
                                }
                            }
                        }
                        .padding()
                        
                        
                        Spacer()
                    }
//                    .toolbar {
//                        ToolbarItem(placement: .navigationBarLeading) {
//                            CircularProfileImage(user: user, size: .small)
//                                .padding(.bottom)
//                                .padding(.top)
//                                .padding(.trailing)
//                        }
//                    }
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
