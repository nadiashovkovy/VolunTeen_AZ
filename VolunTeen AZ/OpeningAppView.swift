//
//  OpeningAppView.swift
//  VolunTeen AZ
//
//  Created by Nadia Shovkovy on 7/22/23.
//

import SwiftUI

struct OpeningAppView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                SplashScreenView()
            } else {
                LoginView()
            }
        }
    }
}

struct OpeningAppView_Previews: PreviewProvider {
    static var previews: some View {
        OpeningAppView()
    }
}
