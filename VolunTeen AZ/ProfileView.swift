//
//  ProfileView.swift
//  VolunTeen AZ
//
//  Created by Nadia Shovkovy on 7/20/23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if let user = viewModel.currentUser {
            ZStack {
                ScrollView {
                    VStack {
                        Text("Profile")
                            .font(.largeTitle)
                            .bold()
                        
                        Image("ProfileBlob")
                            .resizable()
                            .frame(width:100, height: 100)
                            .padding(.top, -20)
                        
                        
                        // User's name and email and pfp
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.accentColor)
                            .padding()
                            .frame(minHeight: 130)
                            .overlay(
                                HStack {
                                    Text(user.initials)
                                        .font(.title)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                        .frame(width: 72, height: 72)
                                        .background(Color(.systemGray3))
                                        .clipShape(Circle())
                                    
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(user.fullName)
                                            .font(.subheadline)
                                            .fontWeight(.semibold)
                                            .padding(.top, 4)
                                        
                                        
                                        Text(user.email)
                                            .font(.footnote)
                                            .foregroundColor(.gray)
                                    }
                                }
                                    .padding(.trailing, 120)
                            )
                        
                        //  General (version)
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.accentColor)
                            .padding()
                            .frame(minHeight: 80)
                            .overlay(
                                HStack {
                                    SettingsRowView(imageName: "gear",
                                                    title: "Version",
                                                    tintColor: Color(.systemGray))
                                    
                                    Text("1.0.0")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            )
                        
                        
                        // Acount functions (sign out and delete account)
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.accentColor)
                            .padding()
                            .frame(minHeight: 80)
                            .overlay(
                                Button {
                                    viewModel.signOut()
                                        } label: {
                                        SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign out", tintColor:  Color(.systemGray))
                                        }
                                )
                        
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.accentColor)
                            .padding()
                            .frame(minHeight: 80)
                            .overlay(
                                Button {
                                        print("Delete account")
                                        } label: {
                                        SettingsRowView(imageName: "xmark.circle.fill", title: "Delete account", tintColor:  Color(.systemGray))
                                        }
                                )
                        
                        }
                        Spacer()
                    }
                }
        }
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
