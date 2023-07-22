//
//  ContactView.swift
//  VolunTeen AZ
//
//  Created by Nadia Shovkovy on 7/20/23.
//

import SwiftUI

struct ContactView: View {
    var body: some View {
        ZStack {
            ScrollView {
                VStack {

                    Text("Contact")
                        .font(.largeTitle)
                        .bold()
                    
                    Image("TwoRaisedBlobs")
                        .resizable()
                        .frame(width:100, height: 100)
                        .padding(-20)
                    
                    Spacer()
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
