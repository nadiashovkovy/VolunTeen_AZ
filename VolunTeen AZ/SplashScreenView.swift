//
//  SplashScreenView.swift
//  VolunTeen AZ
//
//  Created by Nadia Shovkovy on 7/20/23.
//

import SwiftUI

struct SplashScreenView: View {
    @State var isActive : Bool = false
    @State private var size = 0.1
    @State private var opacity = 0.3
    
    // Customise your SplashScreen here
    var body: some View {
        if isActive {
            CustomTabBarView()
        } else {
            VStack {
                VStack {
                    Image("Logo")
                        .font(.system(size: 5))
                        }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.4)) {
                            self.size = 0.2
                            self.opacity = 1.00
                        }
                    }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
