//
//  ProfileView.swift
//  VolunTeen AZ
//
//  Created by Nadia Shovkovy on 7/20/23.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    @StateObject var profileViewModel = ProfileViewModel()
    
    var body: some View {
        if let user = viewModel.currentUser {
            NavigationStack {
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
                            .foregroundColor(Color(UIColor(named: "MyYellow")!))
                            .padding()
                            .frame(minHeight: 130)
                            .overlay(
                                HStack {
                                    PhotosPicker(selection: $profileViewModel.selectedItem) {
                                        if let profileImage = profileViewModel.profileImage {
                                            profileImage
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 72, height: 72)
                                                .clipShape(Circle())
                                        } else {
                                            CircularProfileImage(user: user, size: .xLarge)
                                        }
                                    }
                                    .padding(.horizontal)
                                    
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
                                    .padding(.trailing, 140)
                            )
                        
                        //  General (version)
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color(UIColor(named: "MyYellow")!))
                            .padding()
                            .frame(minHeight: 90)
                            .overlay(
                                    SettingsRowView(imageName: "gear",
                                                    title: "Version: 1.0.0",
                                                    tintColor: Color(.systemGray))
                            )
                        
                        
                        // Acount functions (sign out and delete account)
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color(UIColor(named: "MyYellow")!))
                            .padding()
                            .frame(minHeight: 90)
                            .overlay(
                                Button {
                                    viewModel.signOut()
                                        } label: {
                                        SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign out", tintColor:  Color(.systemGray))
                                        }
                                )
                        
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color(UIColor(named: "MyYellow")!))
                            .padding()
                            .frame(minHeight: 90)
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


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(AuthViewModel())
    }
}

